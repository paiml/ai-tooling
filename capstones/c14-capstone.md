# Capstone: AI-Powered Data Pipelines with Deno

## Project Overview

Build a production-ready data pipeline system using Deno and TypeScript that incorporates AI-driven development practices including roadmap-driven planning with agentic AI, pre-commit quality gates, and composable task playbooks. The system processes real-world data through transformation stages, compiles to standalone binaries for deployment, and demonstrates proactive toolchain practices with full documentation and dependency vendoring.

## Deliverables

### 1. Deno Data Pipeline with Task Playbooks
Build a multi-stage data pipeline using Deno and TypeScript that processes a real-world dataset through extraction, transformation, and loading stages. Implement composable task playbooks using the Deno task system (deno.json configuration) that orchestrate pipeline stages into end-to-end workflows. Set up git pre-commit hooks and quality gates that validate code formatting, linting, and tests before every commit. Demonstrate roadmap-driven development using agentic AI for project planning.

### 2. Production Tooling with Compile, Doc, and Vendor
Compile the data pipeline into standalone binaries using `deno compile` for deployment without runtime dependencies. Generate API documentation from TypeScript types using `deno doc` and verify that documentation stays current with code changes. Vendor all remote dependencies using `deno vendor` for reproducible offline builds. Compare the proactive toolchain approach (Deno built-in tools) against reactive toolchains that require external dependencies for each capability.

### 3. Pipeline Performance and Ecosystem Analysis
Benchmark the data pipeline across different dataset sizes measuring throughput, memory consumption, and processing latency. Document the Deno ecosystem advantages including URL-based imports, built-in permissions security, and native TypeScript support. Produce a comparison report evaluating when Deno data pipelines outperform traditional Python or Node.js approaches, with specific metrics on developer setup time, runtime performance, and dependency management complexity.

## Evaluation Criteria

### Distinction
- Pipeline processes at least three data transformation stages with composable playbooks and pre-commit quality enforcement
- Compiled binary, generated docs, and vendored dependencies are all functional with reproducible build verification
- Performance benchmarks include at least three dataset sizes with ecosystem comparison against Python or Node.js

### Proficient
- Data pipeline is functional with task playbooks and basic quality gates
- At least two of the three production tools (compile, doc, vendor) are demonstrated
- Basic performance measurement and ecosystem comparison are documented

### Developing
- Data pipeline runs but lacks task orchestration or quality gate enforcement
- Production tooling is partially configured without reproducible builds
- Performance analysis is qualitative without measured benchmarks

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "AI-Powered Data Pipelines with Deno — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository
