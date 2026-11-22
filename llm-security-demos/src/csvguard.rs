//! CSV formula guard: reject any cell that a spreadsheet would read as a formula.

pub const TRIGGERS: [char; 6] = ['=', '+', '-', '@', '\t', '\r'];

/// Split one CSV line into cells, honouring double-quoted cells.
pub fn split_row(line: &str) -> Vec<String> {
    let mut cells = Vec::new();
    let mut cur = String::new();
    let mut quoted = false;
    let mut chars = line.chars().peekable();
    while let Some(c) = chars.next() {
        match c {
            '"' if quoted && chars.peek() == Some(&'"') => {
                cur.push('"');
                chars.next();
            }
            '"' => quoted = !quoted,
            ',' if !quoted => cells.push(std::mem::take(&mut cur)),
            _ => cur.push(c),
        }
    }
    cells.push(cur);
    cells
}

/// First offending cell as (row, col, trigger), both 1-based; header row counts as row 1.
pub fn first_formula(csv: &str) -> Option<(usize, usize, char)> {
    for (r, line) in csv.lines().enumerate() {
        for (c, cell) in split_row(line).iter().enumerate() {
            if let Some(t) = cell.chars().next().filter(|t| TRIGGERS.contains(t)) {
                return Some((r + 1, c + 1, t));
            }
        }
    }
    None
}

/// The verdict line the demo prints.
pub fn verdict(csv: &str) -> (bool, String) {
    match first_formula(csv) {
        Some((r, c, t)) => (
            false,
            format!(
                "REJECT row {r} col {c} starts with '{}'",
                t.escape_default()
            ),
        ),
        None => (true, "OK".to_string()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn clean_file_is_ok() {
        assert_eq!(verdict("name,note\nAda,hello\n"), (true, "OK".into()));
    }

    #[test]
    fn every_trigger_is_rejected() {
        for t in TRIGGERS {
            let csv = format!("a,b\nx,{t}y\n");
            let (ok, msg) = verdict(&csv);
            assert!(!ok, "{t:?}");
            assert!(msg.starts_with("REJECT row 2 col 2"), "{msg}");
        }
    }

    #[test]
    fn quoted_formula_cell_is_rejected() {
        let (ok, msg) = verdict("name,email,note\nAda,a@x.com,\"=HYPERLINK(\"\"http://localhost/x\"\",\"\"click\"\")\"\n");
        assert!(!ok);
        assert_eq!(msg, "REJECT row 2 col 3 starts with '='");
    }

    #[test]
    fn email_with_at_inside_is_fine() {
        assert!(verdict("e\nada@example.com\n").0);
    }

    #[test]
    fn split_handles_quotes_and_commas() {
        assert_eq!(split_row("a,\"b,c\",\"d\"\"e\""), vec!["a", "b,c", "d\"e"]);
    }
}

/// CLI body: `csv-guard FILE`. Returns the exit code and prints the verdict.
pub fn run(args: &[String]) -> i32 {
    let Some(path) = args.first() else {
        eprintln!("usage: csv-guard FILE.csv");
        return 2;
    };
    match std::fs::read_to_string(path) {
        Ok(text) => {
            let (ok, msg) = verdict(&text);
            println!("{msg}");
            if ok {
                0
            } else {
                1
            }
        }
        Err(e) => {
            eprintln!("csv-guard: {path}: {e}");
            2
        }
    }
}

#[cfg(test)]
mod run_tests {
    use super::*;

    #[test]
    fn run_codes() {
        assert_eq!(run(&[]), 2);
        assert_eq!(run(&["/nonexistent/x.csv".into()]), 2);
        let d = std::env::temp_dir().join(format!("csvg-{}", std::process::id()));
        std::fs::create_dir_all(&d).unwrap();
        let good = d.join("g.csv");
        let bad = d.join("b.csv");
        std::fs::write(&good, "a\nb\n").unwrap();
        std::fs::write(&bad, "a\n=1+1\n").unwrap();
        assert_eq!(run(&[good.to_string_lossy().into()]), 0);
        assert_eq!(run(&[bad.to_string_lossy().into()]), 1);
        std::fs::remove_dir_all(&d).unwrap();
    }
}
