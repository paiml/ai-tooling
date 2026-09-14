---
title: Closed shape rejects undeclared
status: Live
owner: Noah Gift
updated: 2026-09-14
track: AI & LLMs
---

# Closed shape rejects undeclared

This README validates itself.

The frontmatter above is a set of claims about this document. `make lint` turns
those claims into RDF and hands them to a SHACL shape in `shapes/readme.ttl` —
a shape this document never sees and cannot argue with. That separation is the
whole point: the constraint lives outside the thing it judges.

```
make check
```

## Why "closed" is the load-bearing word

SHACL says nothing about properties no shape mentions. An open shape would
accept `deploy_target: prod` in the frontmatter without comment, because no
rule mentions `deploy_target` and silence is not a violation.

`sh:closed true` inverts that default: what is not declared is refused. Add any
key to the frontmatter above and the lint goes red with a
`ClosedConstraintComponent` naming the exact predicate.

## Exit codes are the interface

| code | meaning |
|---|---|
| 0 | PASS — focus nodes were found, and none violated the shape |
| 1 | FAIL — at least one violation, each printed with its focus node and path |
| 2 | UNKNOWN — the check could not run, or ran against nothing |

**2 is never mapped to 0.** A graph with no focus node has no violations, so a
shape whose target never matches reports zero problems — the same output a
clean run gives. `scripts/lint.sh` counts focus nodes *before* it consults the
validator, and refuses to call an empty graph a pass.

## What each file does

| file | |
|---|---|
| `shapes/readme.ttl` | the TBox: five declared properties, `sh:closed true` |
| `src/main.rs` | `readme2ttl` — frontmatter to Turtle, contract asserted in `main` |
| `scripts/lint.sh` | extract, validate, report, exit 0/1/2 |
| `scripts/falsify.sh` | eight mutations that must go red, and a control that must stay green |
| `scripts/java17.sh` | finds a JVM Jena can actually run |
| `scripts/report.awk` | a SHACL report to one line per violation |
| `tools.lock` | the pinned Jena version and its sha256 |
| `tests/fixtures` | one good README and seven that each break one rule |

## The extractor never filters

`readme2ttl` emits unknown keys exactly as written. If it dropped them, the
closed shape could never fire and `make falsify` would go green against a real
violation — a gate that cannot fail.

It also emits the `rdf:type` triple unconditionally, so a README with no
frontmatter at all still produces a focus node and gets five `MinCount`
violations instead of validating an empty graph and reporting nothing.

Its contract is asserted at runtime:

```
/// Provable contract: output triple count == frontmatter key count + 1
```

## Falsifiers

`make falsify` is the half that makes `make lint` worth anything. Every row
must go **red**; a row that goes green fails the build.

| mutation | expected |
|---|---|
| add `deploy_target: prod` | exit 1, `ClosedConstraintComponent`, path `ex:deploy_target` |
| delete `title:` | exit 1, `MinCountConstraintComponent`, path `ex:title` |
| `status: Shipped` | exit 1, `InConstraintComponent` |
| `title:` twice | exit 1, `MaxCountConstraintComponent` |
| `updated: last Tuesday` | exit 1, `DatatypeConstraintComponent` |
| strip the frontmatter | exit 1 with five `MinCount` results — not exit 2 |
| an empty graph | exit 2, `UNKNOWN` |
| unbalanced bracket in the shape | non-zero, Jena's parse error surfaced |
| **control:** `good.md` unchanged | exit 0, `PASS` |

The control arm is not decoration. Without it, a lint that returned 1
unconditionally would drive every mutation red and the suite would call that
success.

## Jena is a tool here, not pipeline code

Apache Jena 5.6.0 is downloaded by `make tools`, sha256-verified against
`tools.lock` before anything is unpacked, and never committed. It needs Java 17
or newer — 6.x needs 21, which is why the pin is 5.6.0.

`scripts/java17.sh` exists because Jena's launcher prefers `$JAVA_HOME/bin/java`
over `PATH`. On a machine with Java 17 on `PATH` and a stale `JAVA_HOME`
pointing at an 11 from an unrelated toolchain, Jena runs the 11 and dies with
`class file version 61.0 ... recognizes up to 55.0` — a message naming neither
Java nor Jena.

---

<sub>Generated — do not edit by hand. Edit `example.toml` and re-render.</sub>
