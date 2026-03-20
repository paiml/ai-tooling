# Capstone: Intelligent Applications with Amazon Bedrock

## Project Overview

Design and deploy an intelligent application that progresses through all three Bedrock integration layers: console-based model exploration, programmatic API development with Rust and Bash, and autonomous agent orchestration with knowledge-base-backed RAG. The application implements the Dracula pattern for cloud-first inference with local Ollama fallback, demonstrating production resilience across connectivity scenarios.

## Deliverables

### 1. Bedrock API Application with Dracula Pattern
Build a Rust application using the AWS SDK that invokes Claude models through Bedrock for primary inference and falls back to local Ollama models when cloud endpoints are unavailable. Implement both curl-based prototyping scripts and a production Rust client with async Tokio runtime, credential chain resolution, and structured error handling.

### 2. Knowledge Base with Programmatic Management
Create a Bedrock knowledge base using S3 data sources and Titan embedding models, configured both through the console and programmatically via CloudShell CLI commands. Implement a query interface that retrieves documents from the knowledge base and generates grounded responses, with test cases verifying retrieval accuracy against known document content.

### 3. Agent with Action Groups and RAG Integration
Deploy a Bedrock agent that combines knowledge base retrieval with Lambda-powered action groups to perform multi-step tasks autonomously. The agent should accept natural language requests, plan execution steps, invoke tools through action groups, and ground its responses in knowledge base content. Include a test suite that validates agent behavior across at least five distinct task scenarios.

## Evaluation Criteria

### Distinction
- Dracula pattern implements automatic failover with latency measurement and provider selection logging
- Knowledge base achieves measurable retrieval accuracy improvements through chunking and embedding strategy tuning
- Agent handles multi-step tasks with observable planning, tool invocation, and knowledge-grounded responses

### Proficient
- Rust application successfully invokes Bedrock and Ollama models with basic fallback logic
- Knowledge base is functional through both console and CLI with demonstrable query results
- Agent executes action groups and retrieves from the knowledge base for at least three task types

### Developing
- Application invokes Bedrock models but lacks Ollama fallback or uses only one access method
- Knowledge base works through console but lacks programmatic management or query testing
- Agent is configured but does not demonstrate multi-step planning or knowledge-grounded responses

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "Intelligent Applications with Amazon Bedrock — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository
