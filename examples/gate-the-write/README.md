# Gate a proposed write

constraints compiled from an ontology, applied to output the model never saw them with

A domain model in one file, a proposed write in another, and a gate that puts
them together. The proposal cannot argue with the constraints because the two
never meet until the gate runs. Three exit codes are the interface: 0 the write
may land, 1 at least one violation, 2 the gate could not run — which is also
blocked, because a checker that cannot read its own rules has found nothing,
not nothing wrong.

## Run it

```
cargo run -- proposed-bad.txt
```

Requires a Rust toolchain. No dependencies and no network: `cargo run` and
`cargo test` work offline.

## What is here

| file | |
|---|---|
| `ontology.txt` | the domain model, and the only place the rules live |
| `proposed-ok.txt` | a write that satisfies every constraint (exit 0) |
| `proposed-bad.txt` | a write that reads fine and violates two rules (exit 1) |
| `Cargo.toml` | no dependencies, on purpose |
| `src/main.rs` | the gate, and four tests including an anti-vacuity arm |

## The four exit paths, measured

```
cargo run -- proposed-ok.txt                      exit 0   PASS
cargo run -- proposed-bad.txt                     exit 1   BLOCKED, 2 violations
cargo run -- proposed-ok.txt no-such-file.txt     exit 2   BLOCKED, cannot read the model
cargo run -- proposed-ok.txt empty-model.txt      exit 2   BLOCKED, zero constraints
```

The last two are the point. An empty rule set accepts everything, and a missing
rule set checks nothing; reporting either as success is how a gate becomes
decoration.

---

<sub>Generated — do not edit by hand. Edit `example.toml` and re-render.</sub>
