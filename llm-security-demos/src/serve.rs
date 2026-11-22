//! Rate-limited HTTP front: forwards the first N requests per window to an
//! upstream server and answers 429 to the rest. Localhost demo only.
use crate::limiter::Limiter;
use std::io::{Read, Write};
use std::net::{TcpListener, TcpStream};
use std::time::{SystemTime, UNIX_EPOCH};

fn now_secs() -> u64 {
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .map(|d| d.as_secs())
        .unwrap_or(0)
}

const REFUSED: &[u8] = b"HTTP/1.1 429 Too Many Requests\r\nContent-Length: 13\r\nConnection: close\r\n\r\nrate limited\n";
const BAD_GATEWAY: &[u8] = b"HTTP/1.1 502 Bad Gateway\r\nContent-Length: 0\r\n\r\n";

/// Forward the raw request bytes to `upstream` and return its raw response.
pub fn force_close(request: &[u8]) -> Vec<u8> {
    let end = request
        .windows(4)
        .position(|w| w == b"\r\n\r\n")
        .unwrap_or(request.len());
    let head = String::from_utf8_lossy(&request[..end]);
    let mut out: Vec<u8> = head
        .split("\r\n")
        .filter(|l| !l.to_ascii_lowercase().starts_with("connection:"))
        .collect::<Vec<_>>()
        .join("\r\n")
        .into_bytes();
    out.extend_from_slice(b"\r\nConnection: close\r\n\r\n");
    out.extend_from_slice(request.get(end + 4..).unwrap_or(&[]));
    out
}

/// Forward the request to `upstream` and return its raw response.
pub fn forward(upstream: &str, request: &[u8]) -> std::io::Result<Vec<u8>> {
    TcpStream::connect(upstream).map(|mut up| {
        let _ = up.write_all(&force_close(request));
        let mut resp = Vec::new();
        let _ = up.read_to_end(&mut resp);
        resp
    })
}

/// Read one request (headers plus Content-Length body); a read error ends it early.
pub fn read_request(s: &mut TcpStream) -> Vec<u8> {
    let mut buf = Vec::new();
    let mut chunk = [0u8; 4096];
    loop {
        let n = s.read(&mut chunk).unwrap_or(0);
        buf.extend_from_slice(&chunk[..n]);
        if let Some(end) = buf.windows(4).position(|w| w == b"\r\n\r\n") {
            let head = String::from_utf8_lossy(&buf[..end]).to_ascii_lowercase();
            let want = head
                .lines()
                .find_map(|l| l.strip_prefix("content-length:"))
                .and_then(|v| v.trim().parse::<usize>().ok())
                .unwrap_or(0);
            if buf.len() >= end + 4 + want {
                return buf;
            }
        }
        if n == 0 {
            return buf;
        }
    }
}

/// Handle one connection: Some(true) admitted, Some(false) refused, None if accept failed.
fn handle_one(listener: &TcpListener, upstream: &str, lim: &mut Limiter) -> Option<bool> {
    listener.accept().ok().map(|(mut s, _)| {
        let req = read_request(&mut s);
        let admitted = lim.admit(now_secs());
        let resp = if admitted {
            forward(upstream, &req).unwrap_or_else(|_| BAD_GATEWAY.to_vec())
        } else {
            REFUSED.to_vec()
        };
        let _ = s.write_all(&resp);
        admitted
    })
}

/// Handle `conns` connections, then return the (admitted, refused) counts.
pub fn serve(
    listener: &TcpListener,
    upstream: &str,
    limit: u32,
    window: u64,
    conns: usize,
) -> (u32, u32) {
    let mut lim = Limiter::new(limit, window);
    let (mut ok, mut no) = (0, 0);
    for _ in 0..conns {
        let r = handle_one(listener, upstream, &mut lim);
        ok += u32::from(r == Some(true));
        no += u32::from(r == Some(false));
    }
    (ok, no)
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::thread;

    fn fake_upstream(n: usize) -> (String, thread::JoinHandle<()>) {
        let l = TcpListener::bind("127.0.0.1:0").unwrap();
        let addr = l.local_addr().unwrap().to_string();
        let h = thread::spawn(move || {
            for _ in 0..n {
                let (mut s, _) = l.accept().unwrap();
                let _ = read_request(&mut s);
                s.write_all(b"HTTP/1.1 200 OK\r\nContent-Length: 2\r\nConnection: close\r\n\r\nok")
                    .unwrap();
            }
        });
        (addr, h)
    }

    fn status(addr: &str, body: &str) -> String {
        let mut c = TcpStream::connect(addr).unwrap();
        write!(
            c,
            "POST /x HTTP/1.1\r\nContent-Length: {}\r\n\r\n{body}",
            body.len()
        )
        .unwrap();
        let mut r = String::new();
        c.read_to_string(&mut r).unwrap();
        r.lines().next().unwrap().to_string()
    }

    #[test]
    fn ten_requests_five_pass_five_refused() {
        let (up, h) = fake_upstream(5);
        let front = TcpListener::bind("127.0.0.1:0").unwrap();
        let addr = front.local_addr().unwrap().to_string();
        let t = thread::spawn(move || serve(&front, &up, 5, 3600, 10));
        let codes: Vec<String> = (0..10).map(|i| status(&addr, &format!("q{i}"))).collect();
        assert_eq!(codes.iter().filter(|c| c.contains("200")).count(), 5);
        assert_eq!(codes.iter().filter(|c| c.contains("429")).count(), 5);
        assert_eq!(t.join().unwrap(), (5, 5));
        h.join().unwrap();
    }

    #[test]
    fn dead_upstream_is_502() {
        let dead = TcpListener::bind("127.0.0.1:0").unwrap();
        let up = dead.local_addr().unwrap().to_string();
        drop(dead);
        let front = TcpListener::bind("127.0.0.1:0").unwrap();
        let addr = front.local_addr().unwrap().to_string();
        let t = thread::spawn(move || serve(&front, &up, 1, 3600, 1));
        assert!(status(&addr, "x").contains("502"));
        t.join().unwrap();
    }

    #[test]
    fn empty_connection_is_skipped() {
        let front = TcpListener::bind("127.0.0.1:0").unwrap();
        let addr = front.local_addr().unwrap().to_string();
        let t = thread::spawn(move || serve(&front, "127.0.0.1:1", 1, 60, 1));
        drop(TcpStream::connect(&addr).unwrap());
        assert_eq!(t.join().unwrap(), (1, 0));
    }

    #[test]
    fn force_close_replaces_connection_header_and_keeps_body() {
        let r = force_close(
            b"POST /x HTTP/1.1\r\nConnection: keep-alive\r\nContent-Length: 2\r\n\r\nhi",
        );
        assert_eq!(
            r,
            b"POST /x HTTP/1.1\r\nContent-Length: 2\r\nConnection: close\r\n\r\nhi".to_vec()
        );
        assert_eq!(
            force_close(b"GET /"),
            b"GET /\r\nConnection: close\r\n\r\n".to_vec()
        );
    }

    #[test]
    fn forward_to_nothing_errors() {
        assert!(forward("127.0.0.1:1", b"x").is_err());
    }
}

/// CLI body: `rate-front LISTEN UPSTREAM [LIMIT] [WINDOW_SECS]`; serves until killed.
pub fn run(args: &[String]) -> i32 {
    let (Some(listen), Some(upstream)) = (args.first(), args.get(1)) else {
        eprintln!("usage: rate-front LISTEN UPSTREAM [LIMIT=5] [WINDOW_SECS=60] [CONNS=forever]");
        return 2;
    };
    let limit = args.get(2).and_then(|v| v.parse().ok()).unwrap_or(5);
    let window = args.get(3).and_then(|v| v.parse().ok()).unwrap_or(60);
    let conns = args
        .get(4)
        .and_then(|v| v.parse().ok())
        .unwrap_or(usize::MAX);
    match TcpListener::bind(listen) {
        Ok(l) => {
            println!("rate-front on {listen}: {limit} per {window}s -> {upstream}");
            serve(&l, upstream, limit, window, conns);
            0
        }
        Err(e) => {
            eprintln!("rate-front: {listen}: {e}");
            2
        }
    }
}

#[cfg(test)]
mod run_tests {
    use super::*;

    #[test]
    fn run_usage_and_bind_errors() {
        assert_eq!(run(&[]), 2);
        let held = TcpListener::bind("127.0.0.1:0").unwrap();
        let a = held.local_addr().unwrap().to_string();
        assert_eq!(run(&[a, "127.0.0.1:1".into()]), 2);
    }
}
