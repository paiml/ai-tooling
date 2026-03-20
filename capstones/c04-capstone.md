# Capstone: AI Orchestration: From Local Models to Cloud

## Project Overview

Build an AI orchestration system that spans the full local-to-cloud deployment spectrum, integrating Ollama, llamafile, and Candle for local inference with cloud endpoints for production scale. The system includes a prompt engineering layer with chain-of-thought reasoning in Rust, a GPU workstation monitoring dashboard, and a cost-optimized cloud deployment strategy using AWS Spot instances.

## Deliverables

### 1. Multi-Runtime Local Inference Platform
Deploy three distinct local inference runtimes: Ollama with custom Modelfiles for task-specific configurations, llamafile for single-binary portable deployment with Gemma, and Candle compiled with CUDA support for GPU-accelerated Rust-native inference. Benchmark each runtime on the same prompt suite measuring tokens per second, memory consumption, and cold start latency. Document the build process including GPU compilation flags.

### 2. Chain-of-Thought Orchestration Engine in Rust
Implement a Rust-based orchestration engine that applies the prompt engineering pyramid from basic prompts through chain-of-thought reasoning. The engine routes requests to the appropriate runtime (local or cloud) based on task complexity and model requirements. Include caching for repeated queries to reduce latency and cost, and implement a local RAG pipeline optimized for retrieval performance.

### 3. GPU Workstation and Cloud Deployment Guide
Configure a complete AI development workstation with tmux session management, nvidia-smi and Zenith monitoring dashboards, and all three local runtimes running concurrently. Deploy the orchestration engine to AWS using Spot instances for cost-effective GPU compute, with Hugging Face model downloads and GitHub AI model integration. Produce a cost analysis comparing local workstation operation against cloud deployment for various workload profiles.

## Evaluation Criteria

### Distinction
- Benchmark suite produces reproducible performance comparisons across all three local runtimes with statistical analysis
- Orchestration engine demonstrates intelligent routing with caching that achieves measurable latency and cost improvements
- Cost analysis includes break-even calculations between local and Spot instance deployment for at least three workload profiles

### Proficient
- All three local runtimes are functional with basic benchmarking on a common prompt suite
- Orchestration engine routes between local and cloud endpoints with chain-of-thought reasoning support
- Workstation is configured with monitoring and at least one cloud deployment is operational

### Developing
- At least one local runtime is functional but benchmarks lack cross-runtime comparison
- Orchestration engine connects to a single runtime without intelligent routing or caching
- Workstation setup is partial or cloud deployment is not demonstrated

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "AI Orchestration: From Local Models to Cloud — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository
