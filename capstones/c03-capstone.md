# Capstone: Prompt Architecture and NLP on Amazon Bedrock

## Project Overview

Build a production NLP pipeline that applies structured prompt architecture principles to Amazon Bedrock, combining prompt management with versioning, chain-of-thought agent workflows, and custom Rust-based NLP tools. The system processes unstructured text through multiple pipeline stages, from tokenization analysis through agent-driven reasoning to SVG visualization of results.

## Deliverables

### 1. Prompt Management System with Version Control
Implement a prompt-as-code workflow where prompts are stored as versioned artifacts in source control and managed programmatically through the Bedrock CLI. Build prompt templates with parameterized variables for reusable NLP workflows, and demonstrate prompt versioning with rollback capability. Include a comparison of at least two prompt variants showing measurable quality differences.

### 2. Chain-of-Thought NLP Agent Pipeline
Build an agent pipeline that uses chain-of-thought prompting to perform multi-step NLP analysis on input documents. The pipeline should decompose complex language tasks into stages (extraction, classification, reasoning, synthesis), with each stage producing structured output that feeds the next. Implement the pipeline in Rust with type-safe prompt template construction and structured response parsing.

### 3. Custom NLP Bridge Tool
Create a Rust NLP tool inspired by the SVGen and Ollama-Bedrock bridge patterns that routes NLP requests between local Ollama models and Bedrock cloud endpoints based on task complexity and latency requirements. The tool should accept text input, perform NLP analysis using the appropriate model endpoint, and produce structured output. Include integration with Amazon Transcribe for speech-to-text input support.

## Evaluation Criteria

### Distinction
- Prompt management system demonstrates measurable quality improvement through systematic A/B prompt evaluation
- Chain-of-thought pipeline produces transparent reasoning chains with per-stage quality metrics
- Bridge tool dynamically routes requests based on measured latency and model capability matching

### Proficient
- Prompt versioning and CLI management are functional with at least two template variants
- Agent pipeline successfully chains multiple NLP stages with structured intermediate output
- Bridge tool routes between local and cloud endpoints with basic configuration

### Developing
- Prompts are managed through console only without programmatic versioning or quality comparison
- Pipeline performs single-stage NLP analysis without multi-step chain-of-thought decomposition
- Tool connects to a single endpoint without routing or hybrid deployment logic

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "Prompt Architecture and NLP on Amazon Bedrock — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository
