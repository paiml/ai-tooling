#!/usr/bin/env bash
# Thin wrapper: glob the example directories and hand them to one awk process.
# All the checking lives in check-examples.awk; see its header for what it can
# and cannot catch.
#
# --self-test makes the checker judge deliberately broken copies of the tree
# before it judges the real one. The failure mode of a checker like this is
# going quietly blind and waving everything through, so the arms below are
# unrolled rather than looped: each one is readable on its own.
set -euo pipefail

# One temp dir, cleaned once, guarded so the trap is a no-op when the
# self-test never ran.
tmp=""
cleanup() { if [ -n "${tmp:-}" ]; then rm -rf "${tmp:?}"; fi; }
trap cleanup EXIT

ROOT=$(cd "$(dirname "$0")/.." && pwd)
PROG="$ROOT/scripts/check-examples.awk"

run_on() {
    printf '%s\n' "$1"/examples/*/ | awk -f "$PROG"
}

self_test() {
    local pass_n=0 fail_n=0
    tmp=$(mktemp -d)

    fresh() {
        rm -rf "${tmp:?}/r"
        mkdir -p "${tmp:?}/r"
        cp -r "$ROOT/examples" "${tmp:?}/r/examples"
    }
    arm() {
        local name="$1" want="$2" got=0
        run_on "${tmp:?}/r" > /dev/null 2>&1 || got=$?
        if [ "$want" = "$got" ]; then
            printf '  ok   %s\n' "$name"
            pass_n=$((pass_n+1))
        else
            printf '  FAIL %s (exit %s, wanted %s)\n' "$name" "$got" "$want"
            fail_n=$((fail_n+1))
        fi
    }

    fresh
    arm "S0 a clean tree passes" 0

    fresh
    rm -f "${tmp:?}"/r/examples/readme-shacl/example.toml
    arm "S1 a missing example.toml is caught" 1

    fresh
    sed -i '0,/^# /s/^# .*/# Something Else Entirely/' "${tmp:?}"/r/examples/readme-shacl/README.md
    arm "S2 a reworded title is caught" 1

    fresh
    printf '\n[[files]]\npath = "not-on-disk.txt"\n' >> "${tmp:?}"/r/examples/readme-shacl/example.toml
    arm "S3 a TOML listing a missing file is caught" 1

    fresh
    sed -i 's|`tools.lock`|`renamed.lock`|' "${tmp:?}"/r/examples/readme-shacl/README.md
    arm "S4 a README that drops a listed file is caught" 1

    fresh
    sed -i 's|^run .*=.*|run         = ""|' "${tmp:?}"/r/examples/readme-shacl/example.toml
    arm "S5 an empty required field is caught" 1

    fresh
    rm -rf "${tmp:?}/r/examples"
    arm "S6 no examples at all is caught" 1

    printf 'self-test: %s/%s passed\n' "$pass_n" "$((pass_n+fail_n))"
    [ "$fail_n" = 0 ]
}

case "${1:-}" in
    --self-test)
        self_test
        ;;
    *)
        run_on "$ROOT"
        ;;
esac
