#!/bin/bash
# Formula harness for the llm-security demo (lesson 2.11, insecure output handling).
# Usage: formula-harness.sh MODEL_OUTPUT.csv
# 1. csv-guard (the Rust validator) says whether a cell would be read as a formula.
# 2. LibreOffice evaluates the same file and the evaluated cells are read back,
#    so the audience sees "=1+1" become "2". The file is also opened on display :99
#    (never the owner's desktop) for the recording.
set -u
csv="${1:-}"
if [ -z "$csv" ] || [ ! -f "$csv" ]; then
  echo "usage: formula-harness.sh MODEL_OUTPUT.csv" >&2
  exit 2
fi
here="$(cd "$(dirname "$0")/.." && pwd)"
guard="$here/llm-security-demos/target/release/csv-guard"
if [ ! -x "$guard" ]; then
  echo "NOT RUN: build the guard first (cargo build --release in llm-security-demos)" >&2
  exit 2
fi
work="$(mktemp -d)" || exit 2
case "$work" in /tmp/*|/mnt/*|/var/*) ;; *) echo "bad temp dir" >&2; exit 2 ;; esac
trap 'rm -rf "${work:?}"' EXIT
echo "== guard =="
"$guard" "$csv"
guard_rc=$?
echo "== spreadsheet evaluation =="
if ! command -v soffice >/dev/null 2>&1; then
  echo "NOT RUN: soffice is absent" >&2
  exit 2
fi
timeout 90 soffice --headless "-env:UserInstallation=file://$work/profile" --convert-to "csv:Text - txt - csv (StarCalc):44,34,76,1,,0,false,true,false,false,false" --outdir "$work/out" "$csv" >/dev/null 2>&1
if [ ! -f "$work/out/$(basename "$csv")" ]; then
  echo "NOT RUN: LibreOffice produced no output" >&2
  exit 2
fi
echo "-- evaluated cells --"
while IFS= read -r line; do echo "$line"; done < "$work/out/$(basename "$csv")"
if [ -n "${DISPLAY_99:-}" ]; then
  DISPLAY=:99 soffice "-env:UserInstallation=file://$work/profile99" --calc "$csv" >/dev/null 2>&1 &
  echo "opened on :99"
fi
exit "$guard_rc"
