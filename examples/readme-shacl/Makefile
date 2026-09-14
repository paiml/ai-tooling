# readme-shacl -- lint a README's frontmatter with a closed SHACL shape.
#
# Jena is a TOOL here, not code: pinned in tools.lock, downloaded on demand,
# sha256-verified before a single byte is unpacked. Nothing under tools/ is
# committed.

JENA_VERSION := $(shell sed -n 's/^jena_version *= *//p' tools.lock)
JENA_SHA256  := $(shell sed -n 's/^jena_sha256 *= *//p' tools.lock)
JENA_URL     := $(shell sed -n 's/^jena_url *= *//p' tools.lock)

TARBALL := tools/apache-jena-$(JENA_VERSION).tar.gz
JENA    := tools/jena
DOC     ?= README.md

.PHONY: all check build test lint falsify tools shellcheck clean

all: check

## check -- the full gate: tests, shell lint, a passing lint, and red falsifiers
check: test shellcheck tools build
	@echo "== lint on the known-good fixture =="
	@./scripts/lint.sh tests/fixtures/good.md
	@echo
	@$(MAKE) --no-print-directory falsify
	@echo
	@echo "check OK"

## build -- the extractor
build: target/release/readme2ttl

target/release/readme2ttl: src/main.rs Cargo.toml
	cargo build --release

## test -- the extractor's own contract
test:
	cargo test

## shellcheck -- every gate here is a shell script, so the scripts are gated too
shellcheck:
	@command -v bashrs >/dev/null 2>&1 || { \
	  echo "NOT RUN: bashrs is absent, so scripts/*.sh were not linted."; \
	  echo "  Install it (cargo install bashrs) or run 'make lint' and 'make falsify' directly."; \
	  exit 1; }
	@for s in scripts/lint.sh scripts/falsify.sh scripts/java17.sh; do \
	  echo "  bashrs lint $$s"; \
	  bashrs lint "$$s" || exit 1; \
	done

## lint -- validate one document (default: this directory's own README)
lint: tools build
	./scripts/lint.sh $(DOC)

## falsify -- every mutation below must go RED, or this target fails
falsify: tools build
	./scripts/falsify.sh

## tools -- download and verify Jena, once
tools: $(JENA)/bin/shacl

$(JENA)/bin/shacl: tools.lock
	@command -v java >/dev/null 2>&1 || { \
	  echo "java is not on PATH. Jena $(JENA_VERSION) needs Java 17 or newer."; exit 2; }
	@mkdir -p tools
	@test -f $(TARBALL) || { echo "downloading Jena $(JENA_VERSION)"; \
	  curl -sSL --fail -o $(TARBALL) "$(JENA_URL)"; }
	@echo "$(JENA_SHA256)  $(TARBALL)" | sha256sum -c - \
	  || { echo "REFUSING to unpack: sha256 does not match tools.lock"; rm -f $(TARBALL); exit 1; }
	@rm -rf $(JENA)
	@mkdir -p $(JENA)
	@tar xzf $(TARBALL) -C $(JENA) --strip-components=1
	@touch $(JENA)/bin/shacl
	@echo "Jena $(JENA_VERSION) ready"

clean:
	rm -rf build target
