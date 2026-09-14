#!/usr/bin/env bash
# Every mutation below must go RED. A row that goes green means the gate cannot
# see the defect it exists to catch, and this script exits non-zero for it.
#
# This is the half that makes `make lint` worth anything. A gate nobody has
# tried to break is an assertion, not a check -- and the specific failure it
# guards against is a shape that validates everything because its target never
# matches, which prints exactly what a clean run prints.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT" || exit 2
WORK="build/falsify"
rm -rf "${WORK:?}"
mkdir -p "$WORK"

GOOD=tests/fixtures/good.md
pass=0
fail=0

# run <file> -> prints report to $WORK/out, returns lint's exit code
run() {
  local doc="$1" rc=0
  ./scripts/lint.sh "$doc" > "$WORK/out" 2>&1 || rc=$?
  printf '%s' "$rc"
}

# expect <name> <file> <wanted-exit> [needle ...]
expect() {
  local name="$1" doc="$2" want="$3"; shift 3
  local rc; rc="$(run "$doc")"
  local why=""
  [ "$rc" = "$want" ] || why="exit $rc, wanted $want"
  local needle
  for needle in "$@"; do
    grep -qF "$needle" "$WORK/out" || why="${why:+$why; }missing '$needle'"
  done
  if [ -z "$why" ]; then
    printf '  RED   %-34s exit %s\n' "$name" "$rc"
    pass=$((pass+1))
  else
    printf '  GREEN %-34s %s   <-- MUTATION NOT CAUGHT\n' "$name" "$why"
    sed 's/^/        /' "$WORK/out"
    fail=$((fail+1))
  fi
}

echo "== falsifiers: each row must go RED =="

# 1. an undeclared key -- the closed shape is the whole lesson
expect "undeclared key" tests/fixtures/undeclared-key.md 1 \
  "ClosedConstraintComponent" "ex:deploy_target"

# 2. a required property removed
expect "missing title" tests/fixtures/missing-title.md 1 \
  "MinCountConstraintComponent" "ex:title"

# 3. a value outside sh:in
expect "status not in the list" tests/fixtures/bad-status.md 1 \
  "InConstraintComponent"

# 3b. the same property twice -- exercises sh:maxCount
expect "duplicate title" tests/fixtures/duplicate-title.md 1 \
  "MaxCountConstraintComponent" "ex:title"

# 3c. a value of the wrong type -- exercises sh:datatype
expect "updated is not a date" tests/fixtures/bad-date.md 1 \
  "DatatypeConstraintComponent" "ex:updated"

# 4. no frontmatter at all -- must be FAIL with 5 MinCount results, NOT UNKNOWN.
#    The type triple is emitted unconditionally, so the shape still has a focus
#    node and reports every missing property. If this ever returns 2, the
#    extractor has started emitting empty graphs.
rc4="$(run tests/fixtures/no-frontmatter.md)"
mincount_n=$(awk '/MinCountConstraintComponent/{n++} END{print n+0}' "$WORK/out")
if [[ "$rc4" = 1 && "$mincount_n" = 5 ]]; then
  printf '  RED   %-34s exit 1, %s MinCount results\n' "no frontmatter" "$mincount_n"
  pass=$((pass+1))
else
  printf '  GREEN %-34s exit %s, %s MinCount results (wanted exit 1 and 5)\n' \
         "no frontmatter" "$rc4" "$mincount_n"
  sed 's/^/        /' "$WORK/out"
  fail=$((fail+1))
fi

# 5. an empty graph must be UNKNOWN, never PASS. This is the vacuous-pass trap:
#    a graph with no focus node has no violations, and reporting that as 0 is
#    how a gate that checks nothing looks exactly like a gate that passed.
: > "$WORK/empty.ttl"
rc5=0
./scripts/lint.sh --ttl "$WORK/empty.ttl" > "$WORK/out" 2>&1 || rc5=$?
if [ "$rc5" = 2 ] && grep -q 'UNKNOWN' "$WORK/out"; then
  printf '  RED   %-34s exit 2, UNKNOWN\n' "empty graph"
  pass=$((pass+1))
else
  printf '  GREEN %-34s exit %s   <-- an empty graph was not UNKNOWN\n' "empty graph" "$rc5"
  sed 's/^/        /' "$WORK/out"
  fail=$((fail+1))
fi

# 6. a corrupt TBox must surface Jena's own parse error, not be swallowed.
#    A gate that cannot read its own rules has found nothing, not nothing wrong.
cp shapes/readme.ttl "$WORK/shapes.bak"
sed 's/sh:ignoredProperties ( rdf:type ) ;/sh:ignoredProperties ( rdf:type ;/' \
    "$WORK/shapes.bak" > shapes/readme.ttl
rc6=0
./scripts/lint.sh "$GOOD" > "$WORK/out" 2>&1 || rc6=$?
cp "$WORK/shapes.bak" shapes/readme.ttl
if [ "$rc6" != 0 ] && grep -qiE 'UNKNOWN|parse|syntax|Exception' "$WORK/out"; then
  printf '  RED   %-34s exit %s, parse error surfaced\n' "corrupt TBox" "$rc6"
  pass=$((pass+1))
else
  printf '  GREEN %-34s exit %s   <-- a broken shape did not fail\n' "corrupt TBox" "$rc6"
  sed 's/^/        /' "$WORK/out"
  fail=$((fail+1))
fi

# The control arm. Without it, a lint.sh that returned 1 unconditionally would
# make every row above go RED and this script would call that success.
rc0=0
./scripts/lint.sh "$GOOD" > "$WORK/out" 2>&1 || rc0=$?
if [ "$rc0" = 0 ] && grep -q '^PASS' "$WORK/out"; then
  printf '  CTRL  %-34s exit 0, PASS\n' "good.md still passes"
  pass=$((pass+1))
else
  printf '  CTRL  %-34s exit %s   <-- the gate now fails everything\n' "good.md still passes" "$rc0"
  sed 's/^/        /' "$WORK/out"
  fail=$((fail+1))
fi

# The lesson's contract line: exactly one ClosedConstraintComponent for the one
# undeclared key. Measured here because this is where SHACL results exist --
# the extractor cannot observe them.
./scripts/lint.sh tests/fixtures/undeclared-key.md > "$WORK/out" 2>&1 || true
closed=$(awk '/ClosedConstraintComponent/{n++} END{print n+0}' "$WORK/out")
echo
if [ "$closed" -eq 1 ]; then
  echo "contract: closed_shape_rejects_undeclared OK"
else
  echo "contract: closed_shape_rejects_undeclared FAILED ($closed results, wanted 1)"
  fail=$((fail+1))
fi

echo
echo "falsifiers: $pass red, $fail green"
case "$fail" in
    0)
        echo "all falsifiers red"
        ;;
    *)
        echo "FAIL: a mutation was not caught"
        exit 1
        ;;
esac
