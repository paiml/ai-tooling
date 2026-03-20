# Capstone: Conversational Bot Architecture with Rust and Deno

## Project Overview

Build a multi-platform conversational bot using a Rust Cargo workspace that separates universal bot logic from platform-specific bindings, integrating Amazon Bedrock for LLM-powered responses, Tokio for async message handling, and Deno for TypeScript-based components. The bot operates across CLI, Discord, and web interfaces while sharing a common conversation engine.

## Deliverables

### 1. Universal Bot with Rust Workspace Architecture
Design and implement a Cargo workspace containing a universal bot library crate with platform-agnostic conversation logic, plus binary crates for specific platforms (CLI, Discord). Implement bot traits and generics for type-safe message handling, leveraging Rust's ownership model to prevent data races in concurrent conversations. Integrate Amazon Bedrock through the AWS SDK for Rust to power Claude-based conversational responses via an interactive CLI.

### 2. Discord Bot with Tokio Async Runtime
Deploy the universal bot to Discord using gateway events and slash commands for structured interactions. Implement the Tokio async runtime for concurrent message handling across multiple conversations simultaneously. Demonstrate the Rust memory model (ownership and borrowing) ensuring safe concurrent access to shared bot state. Include a test suite that validates bot responses against expected conversation flows.

### 3. Deno Integration and Cross-Platform Evaluation
Build a Deno-based bot component using TypeScript that connects to the same conversation logic or API endpoint. Demonstrate Deno runtime features including built-in permissions and TypeScript support for bot development. Produce a cross-platform evaluation comparing Rust and Deno bot implementations across latency, memory usage, developer productivity, and deployment complexity. Document the architectural patterns that enable code reuse across platforms.

## Evaluation Criteria

### Distinction
- Workspace architecture demonstrates clean crate boundaries with the universal bot library shared across at least two platform binaries
- Discord bot handles concurrent conversations with measurable throughput and zero data races verified through testing
- Cross-platform evaluation includes quantitative metrics across at least four dimensions with architectural pattern documentation

### Proficient
- Cargo workspace separates library and binary crates with Bedrock-powered conversational responses
- Discord bot handles messages asynchronously with basic Tokio runtime integration
- Deno component is functional with qualitative comparison against the Rust implementation

### Developing
- Bot runs as a single binary without workspace separation or trait-based abstractions
- Discord integration works but lacks concurrent message handling or async runtime optimization
- Deno component is absent or comparison lacks quantitative metrics

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "Conversational Bot Architecture with Rust and Deno — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository
