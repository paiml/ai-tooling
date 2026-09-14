#!/usr/bin/env bash
# Assert that .github/required-status-checks.txt still matches the live ruleset.
#
# The file exists because `main` is protected by an ORG RULESET, and the legacy
# branch-protection endpoint answers 404 for ruleset-protected branches -- so a
# tool querying only that endpoint concludes there is no gate at all. Writing the
# contexts down fixes the discovery problem and creates a new one: the file can
# drift from the ruleset it describes.
#
# This closes that. Offline (no gh, no auth, no scope) it SKIPS and says so,
# because "could not check" and "checked and fine" must never print the same.
set -euo pipefail

ROOT=$(cd "$(dirname "$0")/.." && pwd)
FILE="$ROOT/.github/required-status-checks.txt"
RULESET_ID=13878864
JQ='[.rules[] | select(.type == "required_status_checks") | .parameters.required_status_checks[].context] | sort | join(",")'

if [ ! -f "$FILE" ]; then
    printf 'FAIL: .github/required-status-checks.txt is missing\n' >&2
    exit 1
fi

declared=$(awk '!/^[[:space:]]*#/ && NF { print }' "$FILE" | sort -u | paste -sd, -)
if [ -z "$declared" ]; then
    printf 'FAIL: required-status-checks.txt names no contexts\n' >&2
    exit 1
fi
printf 'declared contexts: %s\n' "$declared"

if ! command -v gh > /dev/null 2>&1; then
    printf 'SKIP: gh is not installed, so the live ruleset was NOT fetched\n'
    exit 0
fi
if ! gh auth status > /dev/null 2>&1; then
    printf 'SKIP: gh is not authenticated, so the live ruleset was NOT fetched\n'
    exit 0
fi

read_live_contexts() {
    gh api "orgs/paiml/rulesets/$RULESET_ID" --jq "$JQ" 2> /dev/null
}
live=$(read_live_contexts || true)
if [ -z "$live" ]; then
    printf 'SKIP: the ruleset could not be fetched (no admin:org scope?), NOT verified\n'
    exit 0
fi
printf 'live ruleset    : %s\n' "$live"

if [ "$declared" != "$live" ]; then
    printf 'FAIL: the file says "%s" but ruleset %s requires "%s"\n' \
        "$declared" "$RULESET_ID" "$live" >&2
    exit 1
fi
printf 'required contexts match the live ruleset\n'
