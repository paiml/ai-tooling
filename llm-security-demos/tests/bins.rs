//! End-to-end: drive both binaries as a user would.
use std::io::{Read, Write};
use std::net::{TcpListener, TcpStream};
use std::process::Command;

#[test]
fn csv_guard_binary_rejects_formula() {
    let d = std::env::temp_dir().join(format!("bins-{}", std::process::id()));
    std::fs::create_dir_all(&d).unwrap();
    let f = d.join("c.csv");
    std::fs::write(&f, "name,email,note\nAda,a@x.com,=1+1\n").unwrap();
    let out = Command::new(env!("CARGO_BIN_EXE_csv-guard"))
        .arg(&f)
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(1));
    assert_eq!(
        String::from_utf8_lossy(&out.stdout).trim(),
        "REJECT row 2 col 3 starts with '='"
    );
    std::fs::remove_dir_all(&d).unwrap();
}

#[test]
fn rate_front_binary_five_ok_five_429() {
    let up = TcpListener::bind("127.0.0.1:0").unwrap();
    let up_addr = up.local_addr().unwrap().to_string();
    let t = std::thread::spawn(move || {
        for _ in 0..5 {
            let (mut s, _) = up.accept().unwrap();
            let _ = llm_security_demos::serve::read_request(&mut s);
            s.write_all(b"HTTP/1.1 200 OK\r\nContent-Length: 2\r\nConnection: close\r\n\r\nok")
                .unwrap();
        }
    });
    let probe = TcpListener::bind("127.0.0.1:0").unwrap();
    let front = probe.local_addr().unwrap().to_string();
    drop(probe);
    let mut child = Command::new(env!("CARGO_BIN_EXE_rate-front"))
        .args([&front, &up_addr, "5", "3600", "10"])
        .stdout(std::process::Stdio::null())
        .spawn()
        .unwrap();
    let mut codes = Vec::new();
    for _ in 0..10 {
        let mut c = loop {
            if let Ok(c) = TcpStream::connect(&front) {
                break c;
            }
            std::thread::sleep(std::time::Duration::from_millis(20));
        };
        c.write_all(b"POST /x HTTP/1.1\r\nContent-Length: 1\r\n\r\nq")
            .unwrap();
        let mut r = String::new();
        c.read_to_string(&mut r).unwrap();
        codes.push(r.lines().next().unwrap().to_string());
    }
    assert!(child.wait().unwrap().success());
    t.join().unwrap();
    assert_eq!(codes.iter().filter(|c| c.contains("200")).count(), 5);
    assert_eq!(codes.iter().filter(|c| c.contains("429")).count(), 5);
}
