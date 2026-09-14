#!/usr/bin/env bash
# Validate a README's frontmatter against shapes/readme.ttl.
#
# usage: scripts/lint.sh <README.md>
#        scripts/lint.sh --ttl <graph.ttl>   # validate an already-extracted graph
#
# Exit codes ARE the interface:
#   0  PASS     - focus nodes were found and none violated the shape
#   1  FAIL     - at least one violation, each one printed
#   2  UNKNOWN  - the check could not run, or ran against nothing
#
# 2 is never mapped to 0. "Nothing was checked" and "nothing was wrong" are
# different answers, and a gate that prints the same thing for both has stopped
# being a gate. Zero focus nodes is the specific case: a graph the shape has no
# opinion about validates silently, and calling that a pass is how an unenforced
# rule survives for months.
#
# --ttl exists so that branch is reachable. readme2ttl always emits the type
# triple, so no README can produce an empty graph -- which means without a way
# to hand in a foreign graph the UNKNOWN path could never be tested, and it
# would be a claim rather than a check.
set -euo pipefail

ROOT=$(cd "$(dirname "$0")/.." && pwd)
SHAPES="$ROOT/shapes/readme.ttl"
BUILD="$ROOT/build"
JENA="$ROOT/tools/jena"
EXTRACTOR="$ROOT/target/release/readme2ttl"

usage() {
    printf 'usage: scripts/lint.sh <README.md>\n' >&2
    printf '       scripts/lint.sh --ttl <graph.ttl>\n' >&2
    exit 2
}

MODE=readme
case "${1:-}" in
    --ttl)
        MODE=ttl
        shift
        ;;
    -h | --help | "")
        usage
        ;;
    *)
        MODE=readme
        ;;
esac

if [ "$#" -ne 1 ]; then
    usage
fi
DOC="$1"

if [ ! -f "$DOC" ]; then
    printf 'UNKNOWN: no such file: %s\n' "$DOC" >&2
    exit 2
fi
if [ ! -f "$SHAPES" ]; then
    printf 'UNKNOWN: shapes/readme.ttl is missing\n' >&2
    exit 2
fi
if [ ! -x "$JENA/bin/shacl" ]; then
    printf 'UNKNOWN: Jena is not installed - run make tools\n' >&2
    exit 2
fi

# Jena's launcher prefers $JAVA_HOME/bin/java over PATH, so a stale JAVA_HOME
# silently decides which JVM runs and the failure surfaces as an unreadable
# UnsupportedClassVersionError. Resolve it here, out loud.
JAVA_HOME=$("$ROOT/scripts/java17.sh")
export JAVA_HOME

mkdir -p "$BUILD"
REPORT="$BUILD/report.ttl"

if [ "$MODE" = readme ]; then
    if [ ! -x "$EXTRACTOR" ]; then
        printf 'UNKNOWN: readme2ttl is not built - run make build\n' >&2
        exit 2
    fi
    TTL="$BUILD/readme.ttl"
    if ! "$EXTRACTOR" < "$DOC" > "$TTL" 2> "$BUILD/extract.log"; then
        printf 'UNKNOWN: readme2ttl failed\n' >&2
        cat "$BUILD/extract.log" >&2
        exit 2
    fi
else
    TTL="$DOC"
fi

# Focus nodes FIRST. Asking "were there violations?" of a graph with nothing in
# it is the vacuous-pass trap, so the count that decides UNKNOWN is taken before
# the validator is ever consulted.
focus_nodes=$(grep -c 'ex:Readme' "$TTL" || true)
case "$focus_nodes" in
    0)
        printf 'UNKNOWN: no focus nodes - the shape had nothing to judge\n'
        exit 2
        ;;
esac

if ! "$JENA/bin/shacl" validate --shapes "$SHAPES" --data "$TTL" > "$REPORT" 2> "$BUILD/shacl.log"; then
    printf 'UNKNOWN: shacl validate failed\n' >&2
    cat "$BUILD/shacl.log" >&2
    exit 2
fi

"$JENA/bin/riot" --output=nquads "$REPORT" > "$BUILD/report.nq"

# grep -c exits 1 on a count of zero, which set -e would read as a crash. The
# || true is why a clean README does not look like a broken gate.
violations=$(grep -c 'shacl#result>' "$BUILD/report.nq" || true)

printf 'focus nodes: %s    violations: %s\n' "$focus_nodes" "$violations"

case "$violations" in
    0) ;;
    *)
        awk -f "$ROOT/scripts/report.awk" "$BUILD/report.nq" | sort
        printf 'FAIL\n'
        exit 1
        ;;
esac

printf 'PASS\n'
exit 0
