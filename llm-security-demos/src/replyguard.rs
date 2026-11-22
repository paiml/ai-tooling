//! Reply checker: rejects any model reply that contains the secret code.
//!
//! Provable contract: a reply containing the secret (any letter case) is
//! rejected; a reply without it is accepted; an empty secret is a usage error.

use std::io::Read;

/// Byte offset of the first case-insensitive occurrence of `secret` in `reply`.
pub fn find_leak(reply: &str, secret: &str) -> Option<usize> {
    reply.to_lowercase().find(&secret.to_lowercase())
}

/// Verdict line for a reply.
pub fn verdict(reply: &str, secret: &str) -> (i32, String) {
    match find_leak(reply, secret) {
        Some(at) => (1, format!("LEAK secret code found at byte {at}")),
        None => (0, "OK".to_string()),
    }
}

/// `reply-guard SECRET [FILE|-]`: exit 0 OK, 1 LEAK, 2 usage or read error.
pub fn run(args: &[String], stdin: &mut dyn Read) -> i32 {
    let secret = args.get(1).map(String::as_str).unwrap_or("");
    if secret.is_empty() {
        eprintln!("usage: reply-guard SECRET [FILE|-]");
        return 2;
    }
    let mut reply = String::new();
    let read = match args.get(2).map(String::as_str) {
        None | Some("-") => stdin.read_to_string(&mut reply).map(|_| ()),
        Some(path) => std::fs::read_to_string(path).map(|s| reply = s),
    };
    if let Err(e) = read {
        eprintln!("reply-guard: {e}");
        return 2;
    }
    let (code, line) = verdict(&reply, secret);
    println!("{line}");
    code
}

#[cfg(test)]
mod tests {
    use super::*;

    fn a(v: &[&str]) -> Vec<String> {
        v.iter().map(|s| s.to_string()).collect()
    }

    #[test]
    fn leak_found_any_case() {
        assert_eq!(find_leak("the code is SwordFish ok", "swordfish"), Some(12));
        assert_eq!(find_leak("nothing here", "swordfish"), None);
    }

    #[test]
    fn verdicts() {
        assert_eq!(
            verdict("x swordfish", "swordfish"),
            (1, "LEAK secret code found at byte 2".into())
        );
        assert_eq!(verdict("safe", "swordfish"), (0, "OK".into()));
    }

    #[test]
    fn run_stdin_dash_and_default() {
        assert_eq!(run(&a(&["rg", "k"]), &mut "has k".as_bytes()), 1);
        assert_eq!(run(&a(&["rg", "k", "-"]), &mut "none".as_bytes()), 0);
    }

    #[test]
    fn run_file_and_errors() {
        let p = std::env::temp_dir().join(format!("rg-{}.txt", std::process::id()));
        std::fs::write(&p, "leaks KEY here").unwrap();
        let path = p.to_str().unwrap().to_string();
        assert_eq!(run(&a(&["rg", "key", &path]), &mut "".as_bytes()), 1);
        std::fs::remove_file(&p).unwrap();
        assert_eq!(run(&a(&["rg", "key", &path]), &mut "".as_bytes()), 2);
        assert_eq!(run(&a(&["rg"]), &mut "".as_bytes()), 2);
        assert_eq!(run(&a(&["rg", ""]), &mut "".as_bytes()), 2);
    }

    struct Bad;
    impl Read for Bad {
        fn read(&mut self, _: &mut [u8]) -> std::io::Result<usize> {
            Err(std::io::Error::other("boom"))
        }
    }

    #[test]
    fn run_stdin_read_error() {
        assert_eq!(run(&a(&["rg", "k"]), &mut Bad), 2);
    }
}
