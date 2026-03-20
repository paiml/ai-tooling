# Capstone: Deterministic LLM Programming and Quality Metrics

## Project Overview

Build a deterministic LLM programming system that combines RAG on AWS with local LLM toolchains to produce repeatable, measurable AI outputs. The system implements quality metrics for evaluating LLM responses, applies Amdahl's Law analysis to inference optimization, and demonstrates the full spectrum from managed Bedrock APIs through local llama.cpp deployment to SageMaker Canvas no-code ML.

## Deliverables

### 1. Deterministic RAG System with Quality Evaluation
Build a RAG system on AWS using Bedrock knowledge bases that produces deterministic, evaluable outputs from a document corpus. Implement quality metrics that measure response accuracy, relevance, and grounding against known document content. Apply prompt evaluation techniques from the Bedrock console to systematically compare prompt variants and foundation models, documenting which configurations produce the most consistent results.

### 2. Local LLM Toolchain with Performance Analysis
Deploy a complete local LLM toolchain including llama.cpp compiled with hardware-specific optimization flags, GGUF model quantization at multiple levels (Q4, Q5, Q8), and a Qwen Coder chatbot for interactive coding assistance. Apply Amdahl's Law to analyze the parallelization limits of inference workloads. Manage dependencies using UV and document the toolchain setup including provisioned throughput comparison between local and Bedrock endpoints.

### 3. Quality Metrics Dashboard and No-Code ML Comparison
Create a quality metrics dashboard that tracks LLM output consistency, cost per query, and response latency across managed APIs, local toolchains, and SageMaker Canvas AutoML. Train a classification model using Canvas on a tabular dataset and compare the no-code ML workflow against LLM-based approaches for the same task. Produce a report evaluating when deterministic LLM programming outperforms traditional ML and vice versa.

## Evaluation Criteria

### Distinction
- Quality metrics include at least five evaluation dimensions with automated scoring and drift detection
- Amdahl's Law analysis produces quantitative parallelization limits validated against measured inference throughput
- Comparison report includes statistical analysis across managed, local, and no-code approaches with decision criteria

### Proficient
- RAG system produces evaluable outputs with basic quality metrics comparing prompt and model variants
- Local toolchain is functional with multiple quantization levels and documented performance characteristics
- Dashboard tracks key metrics across at least two deployment modes with Canvas comparison

### Developing
- RAG system operates but lacks systematic quality evaluation or prompt comparison
- Local toolchain runs a single model configuration without optimization or performance analysis
- Quality metrics are collected but lack cross-platform comparison or Canvas integration

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "Deterministic LLM Programming and Quality Metrics — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository
