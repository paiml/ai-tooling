# Capstone: Building Deterministic MCP Agents

## Project Overview

Build a deterministic MCP agent backed by provable contracts and PMAT compliance enforcement. The project uses the provable-contracts seven-phase pipeline (Extract, Specify, Scaffold, Implement, Falsify, Verify, Prove) to derive mathematically grounded kernel contracts from peer-reviewed papers, then enforces those contracts through property-based testing, Kani bounded model checking, and `pmat comply` quality gates. The agent communicates through Model Context Protocol, with every tool invocation governed by YAML contracts that trace back to specific equations.

## Deliverables

### 1. Contract Authorship and the Seven-Phase Pipeline
Write at least three YAML kernel contracts following the provable-contracts schema. Each contract must include metadata with paper references, named equations with domain and codomain, at least four proof obligations (spanning invariant, equivalence, bound, and monotonicity types), and a falsification test section with Popperian predictions. Run the full pipeline: `pv validate` to check schema compliance, `pv scaffold` to generate Rust trait stubs and failing test skeletons, `pv probar` to generate property-based tests, `pv kani` to generate bounded model checking harnesses, and `pv lint` to pass all seven quality gates. Demonstrate the traceability chain from paper equation to proof obligation to passing test using `pv audit`.

### 2. Property Testing, Fuzz Testing, and Bounded Model Checking
Implement the scaffold generated in Deliverable 1 with scalar kernel functions that satisfy each contract's equations. Run the generated probar property tests to falsify invariants across randomized input spaces and the generated fuzz targets (`pv fuzz`) to discover edge cases. Execute Kani harnesses to prove correctness bounds for at least two contracts, documenting which proof obligations pass exhaustive verification versus those requiring stub-float strategies. Apply the certainty-scope tradeoff framework: property tests provide broad probabilistic coverage, fuzz tests discover unknown unknowns, and Kani proofs provide bounded mathematical certainty. Score all contracts with `pv score` and achieve a minimum B grade across all five scoring dimensions.

### 3. MCP Agent with PMAT Compliance Enforcement
Build a deterministic MCP agent that exposes provable-contracts operations as tools through the Model Context Protocol client-server architecture. The agent must support tool registration for `validate`, `lint`, `score`, and `audit` operations, with every invocation producing deterministic output given the same contract input. Run `pmat comply check` on the project to verify compliance with current PMAT standards, achieving passing status on config files, quality thresholds, dependency health, dead code, and shell quality checks. Generate a `pmat comply report` documenting compliance status. Produce a Toyota Way analysis mapping kaizen (continuous improvement through contract tightening), muda elimination (dead code and waste scoring via CB-300), and jidoka (automated quality gates that stop the line on contract violation) to the provable-contracts workflow.

## Evaluation Criteria

### Distinction
- Three or more contracts pass all seven `pv lint` gates with A-grade scores and complete traceability chains verified by `pv audit`
- Kani harnesses prove at least two contracts with exhaustive strategy, property tests achieve full obligation coverage, and fuzz targets discover at least one edge case requiring contract amendment
- MCP agent passes `pmat comply check` with zero non-compliant findings, and Toyota Way analysis maps all three lean principles to specific provable-contracts enforcement mechanisms

### Proficient
- At least two contracts pass `pv validate` and `pv lint` with B-grade scores and documented proof obligations
- Property tests and fuzz targets run successfully with documented certainty-scope analysis across test types
- MCP agent exposes tool operations through the protocol and `pmat comply check` runs with documented findings

### Developing
- Contracts exist but do not pass `pv lint` or lack traceability from equations to proof obligations
- Testing covers property tests but omits Kani verification or fuzz testing
- Agent runs but lacks MCP tool registration or `pmat comply` integration

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "Building Deterministic MCP Agents — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository
