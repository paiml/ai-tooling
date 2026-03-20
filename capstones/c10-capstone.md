# Capstone: Agentic AI: Actor Models and Subagent Architecture

## Project Overview

Build a multi-language agentic AI system grounded in actor model principles, implementing supervision trees for fault tolerance, subagent delegation for task decomposition, and Claude-powered reasoning agents. The system demonstrates actor patterns in Rust, Go, and Deno, applies Amdahl's Law to optimize parallel subagent execution, and evaluates when simple agents outperform complex multi-agent designs.

## Deliverables

### 1. Actor System with Supervision Trees in Rust
Implement a fault-tolerant actor system using the Actix framework in Rust that supports supervision trees with automatic actor restart and recovery. Demonstrate location transparency for distributed actor communication and implement message-passing patterns for concurrent subagent coordination. Build at least three actor types: a supervisor, a worker agent, and a specialized reasoning agent that delegates to Claude subagents.

### 2. Multi-Language Actor Comparison
Implement equivalent actor patterns in Rust (Actix), Go (goroutines and channels), and Deno (TypeScript async patterns). Build a supervisor pattern in Go that manages multiple worker actors with fault recovery. Benchmark all three implementations on the same message-passing workload, measuring throughput, latency, and memory consumption. Apply Amdahl's Law to analyze the parallelization limits of subagent architectures.

### 3. Subagent Architecture with Small Language Model Evaluation
Design a subagent architecture inspired by pmat that decomposes complex analysis tasks into specialized subagent pipelines. Integrate Clippy as a linting subagent for automated code quality checks. Evaluate small language models as efficient alternatives to large models for agent reasoning tasks, comparing SLM cost and speed against full-size model accuracy. Produce a design document that argues when simple agents outperform complex multi-agent architectures.

## Evaluation Criteria

### Distinction
- Supervision trees demonstrate automatic recovery from injected faults with measurable recovery time metrics
- Multi-language benchmarks include statistical analysis across at least three workload profiles with Amdahl's Law validation
- SLM evaluation quantifies the accuracy-efficiency tradeoff with clear decision criteria for agent model selection

### Proficient
- Rust actor system with supervision trees handles basic fault tolerance and subagent delegation
- All three language implementations are functional with comparative benchmarks on a standard workload
- Subagent architecture decomposes tasks with documented comparison of simple versus complex designs

### Developing
- Actor system runs in a single language without supervision trees or fault tolerance
- Multi-language comparison is incomplete or lacks quantitative benchmarks
- Subagent design exists conceptually but lacks implementation or SLM evaluation

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "Agentic AI: Actor Models and Subagent Architecture — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository
