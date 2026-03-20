# Capstone: Building Deterministic MCP Agents

## Project Overview

Build a deterministic agent system using Model Context Protocol (MCP) for structured tool communication, backed by PMAT quality metrics and comprehensive testing including property testing and fuzz testing. The project applies Toyota Way lean principles to software quality, models agent behavior with finite state machines, and evaluates quality across six essential metric dimensions.

## Deliverables

### 1. MCP Agent with Finite State Machine Behavior
Implement a deterministic MCP agent that communicates with tools through the Model Context Protocol client-server architecture. Model the agent's behavior as a finite state machine with explicit state transitions, ensuring every output is reproducible given the same input. Implement tool registration and invocation patterns following the MCP specification. Demonstrate the agent using Claude Code as an MCP client connected to PMAT for automated quality analysis.

### 2. Comprehensive Testing Suite with Property and Fuzz Testing
Build a testing suite covering all six essential test types for deterministic agent validation. Implement property-based testing to verify behavioral invariants across randomized input spaces and fuzz testing to discover edge cases and failure modes. Use agentic AI to assist with test generation and execution. Apply the certainty-scope tradeoff framework to guide testing strategy, documenting which tests provide high certainty over narrow scope versus broad coverage with lower confidence.

### 3. Quality Assessment with PMAT and Toyota Way Analysis
Run PMAT quality assessment on at least three software projects, applying the six essential quality metrics to evaluate project health. Analyze survivorship-adjusted language popularity metrics to contextualize technology adoption decisions. Produce a Toyota Way analysis that maps lean manufacturing principles (kaizen, waste elimination) to the software development practices observed in the assessed projects, with specific recommendations for quality improvement.

## Evaluation Criteria

### Distinction
- MCP agent demonstrates deterministic behavior with FSM state coverage analysis and measurable reliability metrics
- Testing suite includes property tests, fuzz tests, and at least four other test types with certainty-scope analysis
- PMAT assessment covers three projects with Toyota Way mapping and actionable improvement recommendations

### Proficient
- MCP agent communicates with tools through the protocol with basic deterministic behavior
- Testing includes property testing and fuzz testing with documented edge case discoveries
- PMAT assessment covers at least two projects with quality metrics and basic Toyota Way analysis

### Developing
- Agent communicates but lacks FSM modeling or deterministic behavior guarantees
- Testing covers basic test types without property testing or fuzz testing
- PMAT assessment is run on a single project without cross-project comparison or lean analysis

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "Building Deterministic MCP Agents — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository
