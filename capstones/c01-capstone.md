# Capstone: Generative AI and Foundation Models on AWS

## Project Overview

Build a multi-pathway foundation model evaluation platform that compares AWS managed services (Bedrock, SageMaker Canvas) with open-source toolchains (llama.cpp, Ollama) across cost, latency, and quality dimensions. The platform ingests a document corpus, deploys RAG pipelines on both Bedrock knowledge bases and local vector stores, and produces a quantitative comparison report with deployment recommendations.

## Deliverables

### 1. RAG Pipeline Comparison System
Build two parallel RAG implementations: one using Amazon Bedrock knowledge bases with S3 data sources and Titan embeddings, and one using a local llama.cpp deployment with open-source embeddings. Measure retrieval accuracy, response latency, and per-query cost across both pipelines using a standardized evaluation dataset.

### 2. Local LLM Deployment Toolkit
Compile llama.cpp from source with hardware-specific optimization flags, download and quantize a Qwen Coder model in GGUF format, and deploy it as a local inference endpoint using Ollama. Document the complete toolchain setup including UV for Python dependency management, GPU configuration with nvidia-smi monitoring, and Amdahl's Law analysis of parallelization limits.

### 3. Foundation Model Decision Framework
Produce a written report that synthesizes your evaluation data into a decision framework for selecting between managed services (Bedrock, SageMaker Canvas), open-source local toolchains (llama.cpp, Ollama), and hybrid approaches (Dracula pattern). Include tokenization cost analysis, provisioned throughput calculations, and a decision tree that maps workload characteristics to recommended deployment strategies.

## Evaluation Criteria

### Distinction
- RAG pipeline comparison includes at least three retrieval quality metrics with statistical significance analysis
- Local LLM deployment demonstrates hardware-specific compilation with measured performance gains over default builds
- Decision framework includes quantitative cost modeling with break-even analysis between managed and self-hosted deployments

### Proficient
- Both RAG pipelines are functional and produce grounded responses from the evaluation dataset
- Local llama.cpp deployment runs inference with GGUF quantized models and documents the setup process
- Decision framework covers the key trade-offs between Bedrock, local toolchains, and SageMaker Canvas

### Developing
- At least one RAG pipeline is functional with basic retrieval and generation capabilities
- Local LLM deployment runs but lacks hardware-specific optimization or performance benchmarks
- Decision framework identifies trade-offs but lacks quantitative cost or performance data

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "Generative AI and Foundation Models on AWS — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository
