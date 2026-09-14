SHELL := /bin/bash

.PHONY: help lint test test-fast coverage fmt fmt-check check bench examples supply-chain contexts shell

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

lint: ## Lint markdown files
	@echo "=== Markdown lint ==="
	@find . -name '*.md' -not -path './.git/*' -not -path './node_modules/*' | \
		xargs -I{} sh -c 'grep -Pn "\t" "$$1" && echo "FAIL: tabs in $$1" && exit 1 || true' _ {}
	@echo "=== Checking capstone links ==="
	@for i in $$(seq -w 1 20); do \
		f="capstones/c$$i-capstone.md"; \
		[ -f "$$f" ] || { echo "MISSING: $$f"; exit 1; }; \
	done
	@echo "=== Lint passed ==="

test: ## Validate all capstones and course structure
	@echo "=== Validating 20-course structure ==="
	@test $$(ls capstones/c[0-9][0-9]-capstone.md 2>/dev/null | wc -l) -eq 20 || \
		{ echo "FAIL: expected 20 capstones, found $$(ls capstones/c[0-9][0-9]-capstone.md 2>/dev/null | wc -l)"; exit 1; }
	@echo "  20 capstone files present"
	@for i in $$(seq -w 1 20); do \
		f="capstones/c$$i-capstone.md"; \
		grep -q "## Deliverables" "$$f" || { echo "FAIL: $$f missing Deliverables section"; exit 1; }; \
		grep -q "## Evaluation Criteria" "$$f" || { echo "FAIL: $$f missing Evaluation Criteria"; exit 1; }; \
		grep -q "## Share Your Work" "$$f" || { echo "FAIL: $$f missing Share Your Work"; exit 1; }; \
	done
	@echo "  All capstones have required sections"
	@grep -q "20-Course" README.md || { echo "FAIL: README does not reference 20 courses"; exit 1; }
	@echo "  README references 20 courses"
	@echo "=== All tests passed ==="

test-fast: test ## Fast test (same as test for this repo)

coverage: test ## Coverage (structural validation)
	@echo "=== Coverage: 20/20 capstones validated (100%) ==="

fmt: ## Format (no-op for markdown repo)
	@echo "No formatter configured for markdown-only repo"

fmt-check: ## Check formatting
	@echo "No formatter configured for markdown-only repo"

check: lint shell test examples supply-chain contexts ## Run all checks
	@echo "=== All checks passed ==="

bench: ## Benchmark (no-op)
	@echo "No benchmarks for this repo"

examples: ## Validate the worked examples and run each one's own gates
	@echo "=== examples: consistency ==="
	@./scripts/check-examples.sh --self-test
	@./scripts/check-examples.sh
	@echo "=== examples: gate-the-write ==="
	@cd examples/gate-the-write && cargo fmt --check && cargo clippy --all-targets -- -D warnings && cargo test
	@echo "=== examples: readme-shacl ==="
	@$(MAKE) --no-print-directory -C examples/readme-shacl check

supply-chain: ## cargo-deny over every example, against the repo's one policy
	@command -v cargo-deny >/dev/null 2>&1 || { \
	  echo "NOT RUN: cargo-deny is absent, so no supply-chain policy was enforced."; \
	  echo "  cargo install --locked cargo-deny"; exit 1; }
	@for d in examples/*/; do \
	  test -f "$$d/Cargo.toml" || continue; \
	  echo "  cargo deny: $$d"; \
	  ( cd "$$d" && cargo deny --manifest-path Cargo.toml check --config "$(CURDIR)/deny.toml" ) || exit 1; \
	done

contexts: ## The required status checks on disk must match the live ruleset
	@./scripts/check-required-contexts.sh

shell: ## Every gate here is a shell script, so the scripts are gated too
	@command -v bashrs >/dev/null 2>&1 || { \
	  echo "NOT RUN: bashrs is absent, so no shell script was linted."; \
	  echo "  cargo install --locked bashrs"; exit 1; }
	@for s in scripts/*.sh examples/*/scripts/*.sh; do \
	  test -f "$$s" || continue; \
	  echo "  bashrs lint $$s"; \
	  bashrs lint "$$s" || exit 1; \
	done
