# Capstone: AI Engineering Capstone: Serverless Multi-Model Systems

## Project Overview

Synthesize all skills from the Applied AI Engineering specialization into a production serverless multi-model system deployed on AWS Lambda using Cargo Lambda and Rust. The system routes requests across Amazon Bedrock and Ollama models based on task requirements, manages prompts through YAML configuration, and demonstrates the complete AI engineering lifecycle from model ecosystem evaluation through serverless production deployment.

## Deliverables

### 1. Multi-Model Router with Bedrock and Ollama
Build a Rust application that integrates both Amazon Bedrock (cloud-hosted models) and Ollama (local models) through a unified routing layer. Implement YAML-based prompt configuration for structured, version-controlled prompt engineering. Design the multi-model flow to route requests to different models based on task type, latency requirements, and cost constraints. Demonstrate the router handling at least three distinct task categories with appropriate model selection for each.

### 2. Serverless Deployment with Cargo Lambda
Deploy the multi-model router as an AWS Lambda function using the Cargo Lambda toolchain for Rust serverless development. Implement the Amazon Bedrock router for cloud model access within the Lambda execution environment. Measure cold start performance, memory consumption, and inference latency for the deployed function. Compare serverless deployment costs against always-on infrastructure for various traffic patterns.

### 3. AI Engineering Portfolio and Ecosystem Analysis
Produce a comprehensive capstone report that synthesizes learnings from the entire specialization. Include an ecosystem evolution analysis documenting how the AI model landscape has changed during the course of study. Evaluate the multi-model system against production criteria including reliability, cost efficiency, latency targets, and operational complexity. Deliver a GitHub repository containing the complete project with documentation, tests, and deployment instructions that serves as an AI engineering portfolio piece.

## Evaluation Criteria

### Distinction
- Multi-model router handles at least three task categories with measurable routing accuracy and cost optimization
- Serverless deployment includes cold start analysis, cost modeling for three traffic patterns, and performance benchmarks
- Portfolio report synthesizes at least five specialization courses with ecosystem analysis and production readiness evaluation

### Proficient
- Router integrates Bedrock and Ollama with YAML prompt configuration and basic task routing
- Lambda deployment is functional with Cargo Lambda and basic performance measurement
- Portfolio report documents the project with deployment instructions and ecosystem overview

### Developing
- Router connects to a single model provider without multi-model routing logic
- Deployment runs locally but is not deployed to Lambda or lacks performance analysis
- Portfolio documentation is minimal without specialization synthesis or ecosystem analysis

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "AI Engineering Capstone: Serverless Multi-Model Systems — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository
