# llm-security-demos

Demo code for the llm-security course. Everything binds to localhost.

- `rate-front LISTEN UPSTREAM [LIMIT=5] [WINDOW_SECS=60] [CONNS]`: fixed-window rate limit in front of a model server. Requests past the limit get `429`. Forces `Connection: close` upstream.
- `csv-guard FILE.csv`: prints `REJECT row R col C starts with 'X'` (exit 1) for any cell starting with `=`, `+`, `-`, `@`, tab or CR, else `OK`.
- `scripts/formula-harness.sh MODEL_OUTPUT.csv`: runs the guard, then has LibreOffice evaluate the same file and prints the evaluated cells (`=1+1` becomes `2`). `DISPLAY_99=1` also opens it on display :99.

Provable contract: the limiter admits exactly `limit` requests per window; the guard rejects every trigger character. Tests: `cargo test`; coverage: `cargo llvm-cov`.

- `reply-guard SECRET [FILE|-]`: rejects a model reply that contains the secret code (any letter case): `LEAK secret code found at byte N` exit 1, else `OK` exit 0; usage or read error exit 2. For the prompt-injection video.
