//! `readme2ttl` — read Markdown on stdin, write Turtle on stdout.
//!
//! The frontmatter of a README is a set of claims about a document. This turns
//! those claims into RDF so that a SHACL shape — which the author never sees
//! and cannot argue with — can decide whether they are well formed.
//!
//! /// Provable contract: output triple count == frontmatter key count + 1
//!
//! The `+ 1` is the `rdf:type` triple. It is emitted unconditionally, and that
//! is the whole point of it: a README with no frontmatter at all still produces
//! a focus node, so the shape reports five missing properties instead of
//! validating an empty graph and reporting nothing. An empty graph is the
//! failure mode where "no violations" and "nothing was checked" print the same
//! way, and this program never emits one.
//!
//! This binary does not filter. An unknown key is emitted exactly as it was
//! written, because deciding what is allowed is the shape's job, not the
//! extractor's. A tool that dropped unknown keys here would make a closed
//! shape unfalsifiable.

use sha2::{Digest, Sha256};
use std::io::{Read, Write};

/// The vocabulary these triples are written in.
const EX: &str = "http://example.org/readme#";

/// A single frontmatter entry, already split but not yet typed.
struct Entry {
    key: String,
    value: String,
}

/// Split the leading `---` … `---` block off a Markdown document.
///
/// Returns the frontmatter lines. A document whose first line is not `---`,
/// or whose opening `---` is never closed, has no frontmatter — both cases
/// return an empty vector rather than an error, because "no frontmatter" is a
/// document this program is required to handle, not a malformed input.
fn frontmatter_lines(doc: &str) -> Vec<&str> {
    let mut lines = doc.lines();
    match lines.next() {
        Some(first) if first.trim_end() == "---" => {}
        _ => return Vec::new(),
    }
    let mut out = Vec::new();
    for line in lines {
        if line.trim_end() == "---" {
            return out;
        }
        out.push(line);
    }
    // Opening fence with no closing fence: not frontmatter.
    Vec::new()
}

/// Parse `key: value` lines. Blank lines and `#` comments are skipped; a line
/// with no colon is skipped too, since it states no claim.
fn parse_entries(lines: &[&str]) -> Vec<Entry> {
    let mut out = Vec::new();
    for line in lines {
        let trimmed = line.trim();
        if trimmed.is_empty() || trimmed.starts_with('#') {
            continue;
        }
        let Some((key, value)) = trimmed.split_once(':') else {
            continue;
        };
        let key = key.trim();
        if key.is_empty() {
            continue;
        }
        out.push(Entry {
            key: key.to_string(),
            value: value.trim().trim_matches('"').to_string(),
        });
    }
    out
}

/// True when a value is an `xsd:date`, i.e. exactly `NNNN-NN-NN`.
///
/// Typing is decided by the SHAPE OF THE VALUE, never by the name of the key.
/// A key-driven rule would be the extractor quietly knowing the schema, and
/// then a shape violation could be hidden by the extractor agreeing with it.
fn is_date(value: &str) -> bool {
    let b = value.as_bytes();
    b.len() == 10
        && b[4] == b'-'
        && b[7] == b'-'
        && [0, 1, 2, 3, 5, 6, 8, 9]
            .iter()
            .all(|&i| b[i].is_ascii_digit())
}

/// Turtle's five escape pairs, in the order the grammar lists them.
const TURTLE_ESCAPES: [(char, &str); 5] = [
    ('\\', "\\\\"),
    ('"', "\\\""),
    ('\n', "\\n"),
    ('\r', "\\r"),
    ('\t', "\\t"),
];

/// Escape a string literal for Turtle.
///
/// Table-driven rather than a match arm per character: the pairs are data,
/// and adding one should not add a branch to a function.
fn escape(value: &str) -> String {
    let mut out = String::with_capacity(value.len());
    for ch in value.chars() {
        match TURTLE_ESCAPES.iter().find(|(from, _)| *from == ch) {
            Some((_, to)) => out.push_str(to),
            None => out.push(ch),
        }
    }
    out
}

/// Percent-escape anything in a key that cannot sit in an IRI path segment.
///
/// Unknown keys reach this function, and an unknown key is arbitrary text. It
/// must still produce a parseable IRI, or a malformed key would fail the run
/// as a Turtle syntax error instead of as the closed-shape violation it is.
fn escape_iri(key: &str) -> String {
    let mut out = String::with_capacity(key.len());
    for ch in key.chars() {
        if ch.is_ascii_alphanumeric() || ch == '_' || ch == '-' || ch == '.' {
            out.push(ch);
        } else {
            for byte in ch.to_string().as_bytes() {
                out.push_str(&format!("%{byte:02X}"));
            }
        }
    }
    out
}

/// Build the Turtle document. Returns `(text, triple_count)`.
///
/// Triples are SORTED, so the same README always produces byte-identical
/// output. Determinism is not a nicety here: the extracted graph is an input
/// to a gate, and a gate whose input reorders cannot be diffed between runs.
fn to_turtle(doc: &str) -> (String, usize) {
    let mut hasher = Sha256::new();
    hasher.update(doc.as_bytes());
    let subject = format!("urn:readme:{:x}", hasher.finalize());

    let entries = parse_entries(&frontmatter_lines(doc));

    let mut triples: Vec<String> = Vec::with_capacity(entries.len() + 1);
    triples.push(format!("<{subject}> a ex:Readme ."));
    for entry in &entries {
        let object = if is_date(&entry.value) {
            format!("\"{}\"^^xsd:date", escape(&entry.value))
        } else {
            format!("\"{}\"", escape(&entry.value))
        };
        triples.push(format!(
            "<{subject}> ex:{} {object} .",
            escape_iri(&entry.key)
        ));
    }
    triples.sort();

    let mut out = String::new();
    out.push_str(&format!("@prefix ex:   <{EX}> .\n"));
    out.push_str("@prefix xsd:  <http://www.w3.org/2001/XMLSchema#> .\n\n");
    for triple in &triples {
        out.push_str(triple);
        out.push('\n');
    }
    (out, triples.len())
}

fn main() {
    let mut doc = String::new();
    if let Err(e) = std::io::stdin().read_to_string(&mut doc) {
        eprintln!("readme2ttl: cannot read stdin: {e}");
        std::process::exit(2);
    }

    let key_count = parse_entries(&frontmatter_lines(&doc)).len();
    let (turtle, triple_count) = to_turtle(&doc);

    // Provable contract: output triple count == frontmatter key count + 1.
    assert_eq!(
        triple_count,
        key_count + 1,
        "contract violated: emitted {triple_count} triples for {key_count} frontmatter key(s)"
    );

    let mut stdout = std::io::stdout();
    if let Err(e) = stdout.write_all(turtle.as_bytes()) {
        eprintln!("readme2ttl: cannot write stdout: {e}");
        std::process::exit(2);
    }
    eprintln!("contract: triples == keys + 1 OK ({triple_count} == {key_count} + 1)");
}

#[cfg(test)]
mod tests {
    use super::*;

    const GOOD: &str = "---\ntitle: A\nstatus: Live\nowner: N\nupdated: 2026-09-14\ntrack: AI & LLMs\n---\n\n# A\n";

    #[test]
    fn the_contract_holds_on_well_formed_frontmatter() {
        let keys = parse_entries(&frontmatter_lines(GOOD)).len();
        let (_, triples) = to_turtle(GOOD);
        assert_eq!(keys, 5);
        assert_eq!(triples, keys + 1);
    }

    #[test]
    fn a_readme_with_no_frontmatter_still_has_a_focus_node() {
        let (ttl, triples) = to_turtle("# Just a heading\n");
        assert_eq!(triples, 1, "the rdf:type triple is unconditional");
        assert!(ttl.contains("a ex:Readme ."));
        // The failure this guards is an EMPTY graph, where "no violations" and
        // "nothing was checked" are indistinguishable.
        assert!(ttl.lines().any(|l| l.ends_with(" .")));
    }

    #[test]
    fn an_undeclared_key_is_emitted_rather_than_filtered() {
        // If the extractor dropped unknown keys, the closed shape could never
        // fire and `make falsify` would go green against a real violation.
        let doc = "---\ntitle: A\ndeploy_target: prod\n---\n";
        let (ttl, triples) = to_turtle(doc);
        assert!(ttl.contains("ex:deploy_target \"prod\""));
        assert_eq!(triples, 3);
    }

    #[test]
    fn output_is_sorted_and_byte_identical_across_runs() {
        let (a, _) = to_turtle(GOOD);
        let (b, _) = to_turtle(GOOD);
        assert_eq!(a, b, "same README must give byte-identical Turtle");
        let body: Vec<&str> = a.lines().filter(|l| l.starts_with('<')).collect();
        let mut sorted = body.clone();
        sorted.sort_unstable();
        assert_eq!(body, sorted, "triples must be emitted in sorted order");
    }

    #[test]
    fn a_date_is_typed_by_its_shape_not_by_its_key_name() {
        assert!(is_date("2026-09-14"));
        assert!(!is_date("2026-9-14"));
        assert!(!is_date("Live"));
        // `updated` is only xsd:date because its VALUE looks like one.
        let (ttl, _) = to_turtle("---\nupdated: not-a-date\n---\n");
        assert!(ttl.contains("ex:updated \"not-a-date\" ."));
        assert!(!ttl.contains("xsd:date"));
    }

    #[test]
    fn an_unclosed_fence_is_not_frontmatter() {
        assert!(frontmatter_lines("---\ntitle: A\n").is_empty());
        assert!(frontmatter_lines("# No fence\ntitle: A\n").is_empty());
    }

    #[test]
    fn a_key_that_is_not_iri_safe_still_parses_as_turtle() {
        let (ttl, triples) = to_turtle("---\nbad key!: x\n---\n");
        assert_eq!(triples, 2);
        assert!(ttl.contains("ex:bad%20key%21"), "got: {ttl}");
    }

    #[test]
    fn quotes_and_backslashes_in_a_value_are_escaped() {
        let (ttl, _) = to_turtle("---\ntitle: a \\ b\n---\n");
        assert!(ttl.contains("\"a \\\\ b\""), "got: {ttl}");
    }
}
