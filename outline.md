# Applied AI Engineering — 20-Course Coursera Specialization

Progressive ladder from foundation models to production AI systems. Each course ~60 minutes,
3–5 minute videos.

**Target audience:** AI engineers, cloud developers, and DevOps practitioners who want to
build and deploy production AI systems — from AWS Bedrock and local LLMs through
deterministic agents, multi-modal programming, and serverless multi-model architectures.

**Structure:** Course → Module (2+ lessons + Critical Thinking Assessment) → Lesson (3–5 videos).
Each lesson produces `key-terms.md` and `reflection.md`. Each module ends with a
**Critical Thinking Assessment** (quiz + `roleplay.md`).

**Instructor:** Noah Gift (Courses 1–10, 13, 15, 20) / Alfredo Deza (Courses 11, 12, 14, 16, 17, 18, 19)

---

## Course 1: Generative AI and Foundation Models on AWS

> **STATUS: NEED TRANSCRIPTION** — 32 videos in `2025-Courses/LLMs-On-AWS` + `AWS Gen AI Services`, 0 SRTs

Start with the fundamentals of generative AI on AWS. Learn how tokenization works,
explore multiple model architectures, and build your first RAG system with Amazon Bedrock.
Progress through Amazon Q developer tools for IDE integration and code scanning, then
dive into open-source LLM toolchains — compiling llama.cpp, understanding GGUF formats,
and deploying local models on AWS GPU instances. Finish with SageMaker Canvas for no-code
ML workflows.

**Learning Objectives:**
- Explain tokenization, model architectures, and RAG patterns on AWS
- Build RAG systems with Amazon Bedrock knowledge agents
- Install and use Amazon Q Developer in VS Code and IntelliJ
- Compile and optimize llama.cpp for local LLM deployment
- Deploy open-source LLMs on AWS GPU instances
- Use SageMaker Canvas for no-code machine learning

### Module 1: Generative AI Foundations

#### Lesson 1: Understanding Large Language Models
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Generative AI on AWS — service landscape, model families, use cases | `1.1-generative-ai-on-aws.mp4` | HAVE |
| 2 | What Is Tokenization — BPE, token counts, cost implications | `1.2-what-is-tokenization.mp4` | HAVE |
| 3 | Multiple Model Architecture — ensemble patterns, model selection | `1.3-multiple-model-architecture.mp4` | HAVE |
| 4 | Introduction to RAG — retrieval-augmented generation fundamentals | `1.4-intro-to-RAG.mp4` | HAVE |

#### Lesson 2: RAG and Bedrock Foundations
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | RAG on AWS — knowledge base integration, embedding pipelines | `1.6-RAG-on-AWS.mp4` | HAVE |
| 2 | Bedrock Knowledge Agent RAG Demo — end-to-end retrieval workflow | `1.8-bedrock-knowledge-agent-rag-demo.mp4` | HAVE |
| 3 | RAG Bedrock System Walkthrough — architecture deep dive | `1.9-RAG-Bedrock-System-Walkthrough.mp4` | HAVE |
| 4 | AWS Bedrock Rust Demo — listing models via Rust SDK | `1.10_demo_aws_bedrock_list_rust-demo.mp4` | HAVE |
| 5 | Bedrock Rust Architecture — SDK integration patterns | `1.11-bedrock-rust-diagram.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Amazon Q Developer Tools

#### Lesson 1: Amazon Q IDE Integration
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Amazon Q Developer Introduction — capabilities, pricing, setup | `2.2-amazon-q-developer-intro.mp4` | HAVE |
| 2 | Amazon Q in IntelliJ — plugin installation, code suggestions | `2.4-amazon-q-developer-intellij.mp4` | HAVE |
| 3 | Installing Amazon Q in VS Code — extension setup, authentication | `2.5-install-amazon-q-vscode.mp4` | HAVE |
| 4 | Developing with Amazon Q Developer — code generation, chat | `2.6-developing-with-amazon-q-developer.mp4` | HAVE |

#### Lesson 2: Amazon Q for Documentation and Security
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Documentation Assistant — auto-generating docs with Q | `2.8-documentation-assistant.mp4` | HAVE |
| 2 | Amazon Q Code Scanning — security analysis, vulnerability detection | `2.10-amazon-q-code-scanning.mp4` | HAVE |
| 3 | Bedrock Provisioned IO — throughput guarantees, pricing tiers | `3.2-bedrock-provisioned-io.mp4` | HAVE |
| 4 | Setup Bedrock Provisioned IO — console configuration walkthrough | `3.4-setup-bedrock-provisioned-io.mp4` | HAVE |
| 5 | Evaluating Prompts in Bedrock — prompt evaluation console | `3.6-evaluate-prompts-in-bedrock.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 3: Open-Source LLM Toolchain

#### Lesson 1: Compiling and Optimizing Local LLMs
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Amdahl's Law and Compiling llama.cpp — parallelism limits, build flags | `3.2-amdahls-law-compiling-llama-cpp.mp4` | HAVE |
| 2 | llama.cpp Flags and Compile — optimization flags, BLAS backends | `3.4-llama.cpp-flags-compile.mp4` | HAVE |
| 3 | GGUF File Format — quantization levels, model packaging | `3.6-gguf-file-format.mp4` | HAVE |
| 4 | Fixing Python Packaging with UV CLI — dependency resolution, speed | `3.8-fixing-python-packging-with-uv-cli-tool-demo.mp4` | HAVE |

#### Lesson 2: Local LLM Deployment
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | UV Architecture — package manager internals, Rust foundations | `3.10-uv-architecture.mp4` | HAVE |
| 2 | llamacpp Toolchain: Qwen Coder — model download, quantization | `3.12-llamacpp-toolchain-qwen-coder.mp4` | HAVE |
| 3 | llamacpp Qwen2.5 Coder Chatbot Demo — interactive coding assistant | `3.16-llamacpp-qwen25-coder-chatbot-demo.mp4` | HAVE |
| 4 | llama.cpp on AWS GPU Demo — EC2 GPU instance, CUDA acceleration | `3.18-llama-cpp-on-aws-gpu-demo.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 4: SageMaker Canvas and MLOps

#### Lesson 1: SageMaker Canvas
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | SageMaker Canvas Introduction — no-code ML, visual workflows | `4.1-sagemaker-canvas-intro.mp4` | HAVE |
| 2 | Overview of Canvas UI — data import, model training, predictions | `4.2-overview-of-canvas-ui.mp4` | HAVE |
| 3 | Working with Datasets — upload, transform, feature engineering | `4.4-working-with-dataset.mp4` | HAVE |

#### Lesson 2: Course Synthesis
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Introduction (Open Source LLMs) — local deployment overview | `1.0-course-intro-open-source-llms-on-aws.mp4` | HAVE |
| 2 | Course Conclusion — key takeaways and next steps | `4.6-course-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 2: Intelligent Applications with Amazon Bedrock

> **STATUS: NEED TRANSCRIPTION** — 19 videos in `2025-Courses/Building AI Applications with Amazon Bedrock`, 0 SRTs

Hands-on application development with Amazon Bedrock. Explore the Bedrock console, compare
models using Claude and Haiku, and implement the Dracula pattern for cloud-to-local model
portability. Build APIs in Bash and Rust, create programmatic knowledge bases via CloudShell,
and construct autonomous agents with RAG integration.

**Learning Objectives:**
- Navigate the Amazon Bedrock console and compare model outputs
- Implement the Dracula pattern for cloud-to-local model portability
- Build Bedrock APIs in Bash and Rust
- Create and query knowledge bases programmatically via CloudShell
- Construct Bedrock agents with RAG integration
- Evaluate trade-offs between Bedrock managed models and Ollama

### Module 1: Bedrock Console and Model Exploration

#### Lesson 1: Getting Started with Bedrock
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Introduction — scope, prerequisites, project roadmap | `1.0-course-introduction-building-ai-applications.mp4` | HAVE |
| 2 | Amazon Bedrock Core Features — model catalog, playground, APIs | `1.2-amazon-bedrock-core-features.mp4` | HAVE |
| 3 | Exploring Bedrock in Console — navigation, model access, regions | `1.3-exploring-bedrock-in-console.mp4` | HAVE |
| 4 | Using Bedrock Console Comparison Mode — side-by-side model outputs | `1.5-using-bedrock-console-comparison-mode.mp4` | HAVE |

#### Lesson 2: Model Selection and Patterns
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Model Comparison: Claude Haiku — latency, quality, cost trade-offs | `1.6-model-comparison-claude-haiku.mp4` | HAVE |
| 2 | Dracula Pattern: Bedrock Claude — cloud-first, local-fallback strategy | `1.7-dracula-pattern-bedrock-claude.mp4` | HAVE |
| 3 | Dracula Pattern: Bedrock to Ollama — portability implementation | `1.9-dracula-pattern-bedrock-to-ollama.mp4` | HAVE |
| 4 | Choosing Between Bedrock and Ollama — decision framework | `1.10-make-choices-bedrock-ollama.mp4` | HAVE |
| 5 | Misconceptions About GenAI — common pitfalls and corrections | `1.11-misconceptions-genai.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: API Development with Bedrock

#### Lesson 1: Building Bedrock APIs
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Bash and Rust API Exploration — curl vs SDK approaches | `2.2-bash-rust-api-exploration-amazon-bedrock.mp4` | HAVE |
| 2 | Hello World: Bedrock Claude Bash — first API call with curl | `2.4-hello-world-bedrock-claude-bash.mp4` | HAVE |
| 3 | Rust Hello World Bedrock — AWS SDK for Rust, async client | `2.6-rust-hello-world-bedrock.mp4` | HAVE |

#### Lesson 2: Knowledge Bases
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Bedrock Knowledge Bases — S3 data sources, embedding models | `3.3-bedrock-knowledge-bases.mp4` | HAVE |
| 2 | Bedrock Knowledge Bases Demo — console walkthrough | `3.4-bedrock-knowledge-bases-demo.mp4` | HAVE |
| 3 | Programmatic Knowledge Base in CloudShell — CLI creation and query | `3.5-demo-programatic-knowledge-base-cloudshell.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 3: Agents and RAG

#### Lesson 1: Bedrock Agents
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Agents Overview — autonomous task execution, tool use | `3.6-agents-overview.mp4` | HAVE |
| 2 | Creating Agents in Console — action groups, Lambda integration | `3.7-creating-agents-console-bedrock.mp4` | HAVE |
| 3 | Agents with RAG — knowledge-base-backed agent workflows | `3.8-agents-with-rag.mp4` | HAVE |

#### Lesson 2: Course Synthesis
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Conclusion — key patterns and production readiness | `4.0-course-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 3: Prompt Architecture and NLP on Amazon Bedrock

> **STATUS: NEED TRANSCRIPTION** — 14 videos in `2025-Courses/Natural Language AI with Bedrock`, 0 SRTs

Deep dive into prompt engineering architecture on Amazon Bedrock. Understand the token
processing lifecycle, design prompt architectures as code, and use the Bedrock Prompt
Management CLI. Build advanced NLP pipelines with chain-of-thought prompting, agent-based
processing, and bridge tools connecting Ollama to Bedrock for hybrid local-cloud NLP workflows.

**Learning Objectives:**
- Analyze the Bedrock token processing lifecycle
- Design prompt architectures and manage them as code
- Use the Amazon Bedrock Prompt CLI for programmatic management
- Build chain-of-thought prompting pipelines with Bedrock agents
- Construct transcription and SVG generation pipelines
- Bridge Ollama and Bedrock for hybrid NLP workflows

### Module 1: Prompt Engineering Architecture

#### Lesson 1: Token Processing and NLP Architecture
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Introduction — NLP on Bedrock scope and goals | `1.0-course-intro.mp4` | HAVE |
| 2 | Bedrock Token Processing Lifecycle — input→tokens→inference→output | `1.2-bedrock-token-processing-lifecycle.mp4` | HAVE |
| 3 | NLP Architecture: Amazon Bedrock Overview — service topology | `1.3-nlp-architecture-amazon-bedrock-overview.mp4` | HAVE |
| 4 | Bedrock Prompt Architecture — template design, variable injection | `1.4-bedrock-prompt-architecture.mp4` | HAVE |

#### Lesson 2: Prompt Management and CLI
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Bedrock Prompt Management Demo — versioning, A/B testing | `1.5-bedrock-prompt-management-demo.mp4` | HAVE |
| 2 | Prompt as Code Diagram — IaC patterns for prompt templates | `1.6-prompt-as-code-diagram.mp4` | HAVE |
| 3 | Amazon Bedrock Prompt CLI Demo — programmatic prompt CRUD | `1.7-amazon-bedrock-prompt-cli-demo.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Advanced NLP with Agents

#### Lesson 1: Agent-Based NLP Pipelines
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Advanced NLP with Bedrock Agents — multi-step pipelines | `2.0-advanced-nlp-with-bedrock-agents.mp4` | HAVE |
| 2 | Chain-of-Thought Prompting: Bedrock Agent — structured reasoning | `2.1-chain-of-thought-prompting-bedrock-agent.mp4` | HAVE |
| 3 | NLP Agent Pipeline Architecture — orchestration topology | `2.2-nlp-agent-pipeline-architecture.mp4` | HAVE |

#### Lesson 2: NLP Tools and Bridges
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Transcribe Pipeline Architecture — audio→text→structured output | `2.3-transcribe-pipeline-architecture.mp4` | HAVE |
| 2 | SVGen: Bedrock Rust NLP Tool — text-to-SVG generation | `2.4-svgen-bedrock-rust-nlp-tool.mp4` | HAVE |
| 3 | Ollama-Bedrock Rust NLP Bridge — hybrid local-cloud inference | `2.5-ollama-bedrock-rust-nlp-bridge-tool.mp4` | HAVE |
| 4 | Course Conclusion — recap and integration patterns | `3.0-course-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 4: AI Orchestration: From Local Models to Cloud

> **STATUS: NEED TRANSCRIPTION** — 27 videos in `2025-Courses/AI-Orchestration`, 0 SRTs

Master AI system orchestration across local and cloud environments. Start with the prompt
engineering pyramid and chain-of-thought patterns in Rust, then build caching strategies
and optimize local RAG. Deploy models using Ollama and llamafile, set up GPU computing
environments with NVIDIA-SMI and Zenith monitoring, compile Rust Candle for GPU inference,
and deploy ML workloads on AWS Spot instances.

**Learning Objectives:**
- Apply the prompt engineering pyramid for structured AI interactions
- Implement chain-of-thought prompting in Rust
- Build caching strategies and optimize local RAG systems
- Deploy models using Ollama, llamafile, and Rust Candle
- Set up and monitor GPU computing environments
- Deploy ML workloads on AWS Spot instances

### Module 1: Orchestration Foundations

#### Lesson 1: Course Overview and Architecture
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Introduction — orchestration scope and goals | `1.0-course-intro.mp4` | HAVE |
| 2 | Course Overview — module roadmap and prerequisites | `1.1-course-overview.mp4` | HAVE |
| 3 | AI Orchestration Overview — local-cloud topology, routing patterns | `1.3-ai-orchestration-overview.mp4` | HAVE |

#### Lesson 2: Prompt Engineering and Chain of Thought
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Prompt Engineering Pyramid — zero-shot to fine-tuned hierarchy | `2.4-prompt-engineering-pyramid.mp4` | HAVE |
| 2 | Chain of Thought Prompt in Rust — structured reasoning with Bedrock SDK | `2.6-chain-of-thought-prompt-rust.mp4` | HAVE |
| 3 | Chain of Thought Rust Demo — live coding walkthrough | `2.8-chain-of-thought-rust-prompt-demo.mp4` | HAVE |
| 4 | Explaining Chain of Thought — step-by-step reasoning analysis | `3.10-explaining-chain-of-thought-rust-prompt.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: AI Systems Architecture

#### Lesson 1: Caching and RAG Optimization
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Caching for AI — TTL strategies, embedding cache, prompt cache | `3.14-caching-for-ai.mp4` | HAVE |
| 2 | Optimizing Local RAG — chunk size, retrieval accuracy, latency | `3.20-optimizing-local-RAG.mp4` | HAVE |
| 3 | Local vs Cloud Models — cost, latency, privacy trade-offs | `3.2-local-vs-cloud-models.mp4` | HAVE |

#### Lesson 2: Local Model Deployment
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Llamafile Getting Started: Gemma — single-file LLM deployment | `4.11-llamafile-getting-started-gemma.mp4` | HAVE |
| 2 | Llamafile Simple — minimal setup, portable binary | `4.12-llamafile-simple.mp4` | HAVE |
| 3 | Ollama Local Demo — model pull, serve, chat workflow | `4.2-ollama-local-demo.mp4` | HAVE |
| 4 | Ollama Modelfile Rust Debugger — custom model for debugging | `4.3-ollama-modelfile-rust-debugger.mp4` | HAVE |
| 5 | Ollama Architecture — server, model store, API layer | `4.6-ollama-arch.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 3: Infrastructure and GPU Computing

#### Lesson 1: Linux and GPU Tools
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Using TMUX on Linux — session management for long-running jobs | `4.4-using-tmux-on-linux.mp4` | HAVE |
| 2 | Using NVIDIA-SMI — GPU utilization, memory, temperature monitoring | `4.5-using-nvidia-smi.mp4` | HAVE |
| 3 | Using Zenith GPU Monitoring — real-time system metrics TUI | `4.7-using-zenith-gpu-monitoring.mp4` | HAVE |
| 4 | Compiling Rust Candle GPU — CUDA backend, tensor operations | `4.9-compiling-rust-candle-gpu.mp4` | HAVE |

#### Lesson 2: Cloud and Workflow Deployment
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Rust Hello World Project Structure — workspace layout, Cargo.toml | `4-13-rust-hello-world-project-structure.mp4` | HAVE |
| 2 | AWS Spot Deploy ML — cost-optimized GPU instances | `4.16-aws-spot-deploy-ml.mp4` | HAVE |
| 3 | Hugging Face Workflow Models — model hub, pipelines, deployment | `4.18-huggingface-workflow-models.mp4` | HAVE |
| 4 | GitHub AI Models Workflow — model marketplace integration | `4.22-github-ai-models-workflow.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 4: Learning Architecture and Best Practices

#### Lesson 1: AI Engineering Practices
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Technical Training Approaches — learning strategies for AI | `4.32-technical-training-approaches.mp4` | HAVE |
| 2 | Effective AI Engineering Learning — deliberate practice patterns | `4.42-effective-ai-engineering-learning.mp4` | HAVE |
| 3 | AI Orchestration Local Workstation — dev environment setup | `4.44-AI-orchestration-local-workstation.mp4` | HAVE |

#### Lesson 2: Course Synthesis
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Conclusion — orchestration patterns recap | `6.0-course-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 5: Enterprise AIOps and Amazon Q Business

> **STATUS: NEED TRANSCRIPTION** — 13 videos in `2025-Courses/AWS Enterprise AI Solutions`, 0 SRTs

Operate AI at enterprise scale with Amazon Q Business and AWS services. Configure Q Business
capabilities, use CloudShell for Bedrock API operations, and control costs across SageMaker
workloads. Understand LLM scaling economics, implement enterprise MLOps workflows, and build
RAG-powered production systems with Bedrock console prototyping.

**Learning Objectives:**
- Configure Amazon Q Business for enterprise knowledge management
- Use AWS CloudShell for Bedrock API operations
- Implement cost controls for SageMaker and cloud AI workloads
- Analyze LLM scaling economics and diminishing returns
- Build enterprise MLOps workflows with AIOps patterns
- Prototype RAG production systems in the Bedrock console

### Module 1: Amazon Q for Enterprise

#### Lesson 1: Amazon Q Business
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction to Enterprise AIOps — scope, AWS service landscape | `1.0-introduction-enterprise-aiops-aws.mp4` | HAVE |
| 2 | Amazon Q Business — enterprise knowledge management, connectors | `1.1-amazon-q-business.mp4` | HAVE |
| 3 | Using CloudShell with Q — terminal-based AI assistance | `1.2-using-cloudshell-with-q.mp4` | HAVE |
| 4 | Amazon Q Business Capabilities — search, chat, plugins | `1.3-amazon-q-business-capabilities.mp4` | HAVE |

#### Lesson 2: Bedrock API and CloudShell
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Bedrock API CloudShell Overview — API access patterns | `2.2-bedrock-api-cloudshell-overview.mp4` | HAVE |
| 2 | Foundational CloudShell Skills — navigation, scripting, persistence | `2.4-foundational-cloudshell-skills.mp4` | HAVE |
| 3 | Cost Control: CloudShell and SageMaker — budget alerts, quotas | `2.6-cost-control-cloud-shell-sagemaker.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Enterprise MLOps and Scaling

#### Lesson 1: LLM Scaling and Economics
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Diminishing Scale of LLMs — scaling laws, cost curves | `2.8-diminishing-scale-llm.mp4` | HAVE |
| 2 | Enterprise MLOps Overview — pipeline patterns, model registry | `2.10-enterprise-mlops-what-is-it.mp4` | HAVE |
| 3 | Enterprise AIOps with Bedrock — operational workflows | `3.2-enterprise-aiops-bedrock.mp4` | HAVE |

#### Lesson 2: Production Workflows
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Bedrock Console Prototyping — rapid iteration, prompt testing | `3.6-bedrock-console-prototyping.mp4` | HAVE |
| 2 | RAG Workflows with Bedrock — production retrieval patterns | `3.12-RAG-workflows-bedrock.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 3: Course Synthesis

#### Lesson 1: Enterprise AI Next Steps
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Wrapup — enterprise AI patterns recap | `4.0-course-wrapup.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 6: AI Security and Governance on AWS

> **STATUS: NEED TRANSCRIPTION** — 16 videos in `2025-Courses/Responsible AI on AWS`, 0 SRTs

Comprehensive AI security and governance on AWS. Build security architectures with
authentication patterns and monitoring, implement Bedrock guardrails for input validation
and output safety controls, configure CloudTrail observability for AI workloads, and use
Rust for security-enhanced AI applications. Cover Amazon Q security, SageMaker Clarify for
responsible AI fairness evaluation, and edge case handling for production guardrails.

**Learning Objectives:**
- Design AI security architectures with authentication and monitoring patterns
- Implement Bedrock guardrails for input validation and output safety
- Configure CloudTrail flow and visualization for Bedrock workloads
- Apply Rust for security-enhanced AI applications
- Evaluate edge cases and security boundaries in guardrail configurations
- Use SageMaker Clarify for responsible AI and fairness evaluation

### Module 1: AI Security Architecture

#### Lesson 1: Security Foundations
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Introduction — security and governance scope | `1.0-course-introduction.mp4` | HAVE |
| 2 | AI Security Architecture — threat model, defense layers | `1.2-ai-security-architecture.mp4` | HAVE |
| 3 | AI Auth Patterns — API keys, IAM roles, STS tokens | `1.3-ai-auth-patterns.mp4` | HAVE |
| 4 | Complete Security Architecture — end-to-end security diagram | `1.4-complete-security-architecture.mp4` | HAVE |

#### Lesson 2: Monitoring and Observability
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | AI Monitoring and Logging — metrics, alarms, dashboards | `1.5-ai-monitoring-logging.mp4` | HAVE |
| 2 | Rust Security-Enhanced AI — memory safety, no-panic guarantees | `1.6-rust-security-enhanced-ai.mp4` | HAVE |
| 3 | CloudTrail Flow for Bedrock — event capture, audit trails | `1.7-cloudtrail-flow-for-bedrock.mp4` | HAVE |
| 4 | CloudTrail Visualization for Bedrock — event analysis dashboard | `1.8-cloudtrail-visualization-for-bedrock.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Bedrock Guardrails

#### Lesson 1: Input and Output Controls
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | AWS Guardrail Overview — content filters, topic restrictions | `2.0-aws-guardrail-overview.mp4` | HAVE |
| 2 | Bedrock Guardrails: Input Validation — blocked topics, word filters | `2.1-amazon-bedrock-guardrails-input-validation.mp4` | HAVE |
| 3 | Bedrock Output Safety Controls — response filtering, PII masking | `2.2-bedrock-output-safety-controls.mp4` | HAVE |

#### Lesson 2: Security Boundaries
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Guardrails Security Boundaries — scope limits, bypass resistance | `2.4-bedrock-guardrails-security-boundaries-notes.mp4` | HAVE |
| 2 | Edge Cases: Guardrails — adversarial inputs, false positives | `2.5-edge-cases-diagram-guardrails.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 3: Amazon Q Security

#### Lesson 1: Amazon Q Security
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Amazon Q Security — data isolation, access controls | `3.0-amazon-q-security.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 4: SageMaker Clarify and Fairness

#### Lesson 1: Responsible AI with SageMaker
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Responsible AI with SageMaker Clarify — bias detection, fairness metrics | `4.0-responsible-ai-with-sagemaker-clarify.mp4` | HAVE |
| 2 | Course Conclusion — governance patterns recap | `5.0-course-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 7: AI-Powered Analytics and Performance Engineering

> **STATUS: NEED TRANSCRIPTION** — 16 videos in `2025-Courses/Advanced AI Analytics`, 0 SRTs

Transform analytics workflows with AI-powered engineering. Build Rust-Bedrock analytics
integrations, construct intelligent code transformation pipelines, and benchmark Rust vs.
Python Lambda performance with Claude. Analyze energy efficiency of AI workloads, use AWS
Data Wrangler for analytics, and accelerate development with Amazon Q CodeCatalyst and
translation workflows.

**Learning Objectives:**
- Build Rust-Bedrock analytics integration pipelines
- Construct intelligent code transformation pipelines with GenAI
- Benchmark Rust vs. Python Lambda performance with analytics
- Analyze energy efficiency of AI analytics workloads
- Use Amazon Q for living insights and workflow translation
- Accelerate development with CodeCatalyst AI environments

### Module 1: AI-Powered Analytics

#### Lesson 1: Analytics Architecture
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Introduction — analytics and performance scope | `1.0-course-intro.mp4` | HAVE |
| 2 | Analytics with AI Overview — pipeline patterns, data flow | `1.1-analytics-with-ai-overview.mp4` | HAVE |
| 3 | Rust Bedrock Analytics Integration — SDK integration diagram | `1.4-diagram-rust-bedrock-analytics-integration-demo.mp4` | HAVE |
| 4 | Bedrock Rust Analytics Demo — live data pipeline walkthrough | `1.5-bedrock-rust-analytics-demo.mp4` | HAVE |

#### Lesson 2: Code Transformation Pipelines
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Converting Python to Rust: GenAI Demo — automated code translation | `1.7-converting-python-to-rust-genai-demo.mp4` | HAVE |
| 2 | Intelligent Code Transform Pipeline — multi-step transformation | `1.9-intelligent-code-transform-pipeline.mp4` | HAVE |
| 3 | Code Instrumentation Pipeline — automated profiling injection | `1.11-code-instrumentation-pipeline-genai-aws.mp4` | HAVE |
| 4 | AWS Performance Pipeline with GenAI — benchmarking automation | `1.12-aws-performance-pipeline-with-genai.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Cost Optimization and Advanced Tools

#### Lesson 1: Lambda and Cost Analytics
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Lambda Rust Cost Comparison — cold start, memory, pricing | `2.2-lambda-rust-cost-comparison-analytics.mp4` | HAVE |
| 2 | Rust-Python Lambda Benchmark — Claude-assisted performance analysis | `2.3-rust-python-lambda-benchmark-with-claude-analytics-demo.mp4` | HAVE |
| 3 | AWS Data Wrangler Analytics — visual data preparation | `2.5-aws-data-wrangler-analytics.mp4` | HAVE |
| 4 | Energy Efficiency: AI Analytics — carbon footprint, green compute | `2.6-energy-efficiency-ai-analytics-workloads.mp4` | HAVE |

#### Lesson 2: Amazon Q for Analytics
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Amazon Q AI Analytics Living Insights — dynamic knowledge queries | `2.7-amazon-q-ai-analytics-living-insights.mp4` | HAVE |
| 2 | Amazon Q CodeCatalyst Dev Environments — cloud IDE, AI pairing | `2.8-amazon-q-code-catalyst-dev-environments.mp4` | HAVE |
| 3 | Q Translate Analytics Workflows — Python CLI translation demo | `2.9-q-translate-analytics-workflows-python-cli-demo.mp4` | HAVE |
| 4 | Course Conclusion — analytics patterns recap | `3.0-course-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 8: CLI Automation with Amazon Q and CloudShell

> **STATUS: NEED TRANSCRIPTION** — 11 videos in `2025-Courses/CLI Automation and Development with Amazon Q`, 0 SRTs

Automate cloud development using Amazon Q and AWS CloudShell. Build Docker workflows in
CloudShell, hack Rust projects with Amazon Q assistance, construct CDK Lambda deployments,
and push container images to ECR. Progress from basic CLI interactions to complete
infrastructure-as-code workflows driven by AI assistance.

**Learning Objectives:**
- Use Amazon Q in AWS CloudShell for AI-assisted development
- Build Docker workflows and container pipelines in CloudShell
- Construct CDK Lambda deployments with Amazon Q
- Push container images to ECR from CloudShell
- Implement Rust development workflows with Amazon Q assistance
- Automate cloud infrastructure with AI-driven CLI patterns

### Module 1: Amazon Q CLI Foundations

#### Lesson 1: Getting Started with Amazon Q
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Introduction — CLI automation scope | `1.0-course-intro.mp4` | HAVE |
| 2 | What Is Amazon Q — capabilities, pricing, CLI interface | `2.1-what-is-amazon-q.mp4` | HAVE |
| 3 | Amazon Q CloudShell Introduction — browser-based terminal, Q integration | `2.2-amazon-q-cloudshell-intro.mp4` | HAVE |

#### Lesson 2: Docker and CloudShell Workflows
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Using Docker in AWS CloudShell — container runtime, image management | `2.3-using-docker-aws-cloudshell.mp4` | HAVE |
| 2 | Docker CloudShell Workflows — build, tag, push patterns | `2.4-docker-cloudshell-workflows.mp4` | HAVE |
| 3 | Hacking AWS CloudShell: Rust and Amazon Q — AI-assisted Rust dev | `2.6-hacking-aws-cloudshell-rust-amazonq.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Infrastructure as Code with Amazon Q

#### Lesson 1: CDK and Lambda
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | CDK with Amazon Q: Lambda Node — AI-generated infrastructure | `2.11-cdk-with-amazonq-lambda-node.mp4` | HAVE |
| 2 | CloudShell Lambda CDK Workflow — deploy pipeline walkthrough | `2.12-cloudshell-lambda-cdk-amazonq-workflow.mp4` | HAVE |
| 3 | Docker Build: CloudShell to ECR — container registry pipeline | `2.16-docker-build-diagram-cloudshell-ecr.mp4` | HAVE |

#### Lesson 2: Container Registry and Deployment
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | CloudShell ECR Push Demo — live container push walkthrough | `2.17-cloudshell-ecr-push-demo.mp4` | HAVE |
| 2 | Course Conclusion — IaC patterns recap | `3.0-course-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 9: Deterministic LLM Programming and Quality Metrics

> **STATUS: NEED TRANSCRIPTION** — 18 videos in `Noah Gift/Exploring deterministic LLM programming`, 0 SRTs

Master the science of controlling LLM non-determinism. Study Amdahl's Law for coding agents,
Jevons Paradox in AI automation, and the HAL evaluation framework from Princeton. Learn to
increase determinism through deep context, AST analysis, and code quality metrics — complexity,
entropy, code churn, and technical debt prediction. Build provability scores and apply PMAT
tooling for quantitative code quality assessment.

**Learning Objectives:**
- Apply Amdahl's Law and Jevons Paradox to evaluate AI coding agent performance
- Use the Elo rating system and HAL framework to benchmark LLM capabilities
- Increase determinism through deep context and AST-based analysis
- Measure code complexity, entropy, and churn for quality assessment
- Predict technical debt using SATD analysis
- Build provability scores for quantitative code evaluation

### Module 1: AI Engineering Principles

#### Lesson 1: Warming Strategies and Performance Laws
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Introduction — deterministic programming scope | `1.0-course-introduction.mp4` | HAVE |
| 2 | Warming Strategies — cache warming, model preloading | `1.2-warming-strategies.mp4` | HAVE |
| 3 | Amdahl's Law for Coding Agents — parallelism limits in AI workflows | `1.3-amdahls-law-coding-agents.mp4` | HAVE |
| 4 | Jevons Paradox — efficiency gains increase total consumption | `1.4-jevons-paradox.mp4` | HAVE |

#### Lesson 2: Evaluation Frameworks
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | HAL Framework (Princeton) — benchmark methodology, leaderboard | `1.5-hal-framework-princeton.mp4` | HAVE |
| 2 | Elo Rating System — competitive model ranking, head-to-head | `1.6-elo-rating-system.mp4` | HAVE |
| 3 | Elo Ratings Deep Dive — rating stability, sample size | `1.7-elo-ratings-questions.mp4` | HAVE |
| 4 | Myth of Developer Automation — human oversight requirements | `1.8-myth-developer-automation.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Controlling Non-Determinism

#### Lesson 1: Agent Control Patterns
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Illusion of Control: Agents — stochastic behavior, guardrails | `2.1-illusion-of-control-agents.mp4` | HAVE |
| 2 | Increasing Determinism with Deep Context — CLAUDE.md, project docs | `2.2-increasing-determinism-with-deep-context.mp4` | HAVE |
| 3 | Understanding AST in Agentic Coding — syntax tree analysis, code quality | `2.3-understanding-AST-agentic-coding.mp4` | HAVE |

#### Lesson 2: Code Quality Metrics
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Understanding Complexity — cyclomatic, cognitive, Halstead | `2.4-understanding-complexity.mp4` | HAVE |
| 2 | Understanding Entropy — code diversity, pattern repetition | `2.5-understanding-entropy.mp4` | HAVE |
| 3 | Understanding Code Churn — change frequency, volatility scores | `2.6-understanding-code-churn.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 3: Technical Debt and Provability

#### Lesson 1: Roadmaps and Technical Debt
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Roadmaps, Sprints, and Technical Debt — planning under uncertainty | `2.7-roadmap-sprints-technical-debt.mp4` | HAVE |
| 2 | SATD Predicts Technical Debt — self-admitted debt patterns, TODO mining | `2.8-satd-predicts-technical-debt.mp4` | HAVE |
| 3 | Provability Score — formal verification metrics for code | `2.9-provability-score.mp4` | HAVE |

#### Lesson 2: Applied Deterministic Tools
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Demo: PMAT and Next Steps — quality tooling walkthrough | `3.1-demo-pmat-and-next-steps.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 10: Agentic AI: Actor Models and Subagent Architecture

> **STATUS: NEED TRANSCRIPTION** — 16 videos in `Noah Gift/Agentic AI and autonomous development`, 0 SRTs

Implement agentic AI systems using the actor model paradigm. Build actor systems with
supervision trees in Rust (Actix), Go, and Deno, implementing location transparency and
message passing. Design Claude subagent architectures, build PMAT sub-agents for code review,
coordinate supervised multiple agents, and apply Amdahl's Law to optimize subagent performance.
Learn why simple agents consistently outperform complex ones.

**Learning Objectives:**
- Implement the actor paradigm with supervision trees in Rust, Go, and Deno
- Design Claude subagent architectures for multi-agent systems
- Build specialized sub-agents for code review and analysis
- Coordinate supervised multiple agents with performance optimization
- Apply Amdahl's Law to subagent parallelism decisions
- Evaluate when simple agents outperform complex orchestrations

### Module 1: Actor Model Foundations

#### Lesson 1: The Actor Paradigm
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Introduction — agentic AI scope and goals | `1.0-course-intro.mp4` | HAVE |
| 2 | What Is the Actor Paradigm — message passing, isolation, concurrency | `1.3-what-is-actor-paradigm.mp4` | HAVE |
| 3 | Actix Supervision Trees in Rust — fault tolerance, restart strategies | `1.5-actix-supervision-trees-rust.mp4` | HAVE |
| 4 | Location Transparency — local and remote actors, distribution | `1.6-location-transparency.mp4` | HAVE |

#### Lesson 2: Multi-Language Actor Implementations
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Deno Actor Demo — TypeScript actor implementation | `3.2-deno-actor-demo.mp4` | HAVE |
| 2 | Go Actor Demo — goroutine-based actors, channels | `3.3-go-actor-demo.mp4` | HAVE |
| 3 | Rust Actor Demo — Actix message handlers | `3.4-rust-actor-demo.mp4` | HAVE |
| 4 | Go Supervisor Demo — supervisor tree in Go | `3.5-go-supervisor-demo.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: AI Subagent Architecture

#### Lesson 1: Subagent Design Patterns
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Claude Subagents — spawning, orchestration, result aggregation | `2.2-claude-subagents.mp4` | HAVE |
| 2 | PMAT Sub-Agent Architecture — quality-gated agent pipelines | `2.3-pmat-sub-agent-architecture.mp4` | HAVE |
| 3 | Clippy Sub-Agent: Code Review — automated lint analysis agent | `2.4-clippy-sub-agent.mp4` | HAVE |
| 4 | Supervised Multiple Agents — coordination, conflict resolution | `2.5-supervized-multiple-agents.mp4` | HAVE |

#### Lesson 2: Performance and Simplicity
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Amdahl's Law and Subagents — parallelism bounds for agents | `2.6-amdahls-law-subagents.mp4` | HAVE |
| 2 | Simple Agents Win — complexity vs. reliability trade-offs | `2.7-simple-agents-win.mp4` | HAVE |
| 3 | Small Language Models for Agents — SLM selection criteria | `2.8-slm.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 3: Project Architecture

#### Lesson 1: Agentic Coding Projects
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Agentic Coding Project Repository — project structure walkthrough | `3.6-agentic-coding-project-repo.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 11: AI-Assisted Debugging and Test-Driven Fixes

> **STATUS: NEED TRANSCRIPTION** — 25 videos in `Noah Gift/Debug Your Code with AI`, 0 SRTs

Transform your debugging workflow with AI assistance. Start by understanding why AI debugging
is useful and where AI output falls short, then explore a real project's architecture and
documentation. Build test-driven debugging skills — defining bugs with tests, using context
gathering to guide AI, and helping AI with structured logging. Progress to advanced techniques
for discovering unknown bugs and building comprehensive debugging strategies.

**Learning Objectives:**
- Apply AI-assisted debugging systematically across a real codebase
- Define bugs precisely using test-driven approaches
- Gather and structure context to improve AI debugging suggestions
- Use logging and documentation to guide AI-assisted fixes
- Discover potential unknown bugs through exploratory techniques
- Build comprehensive debugging strategies combining tests and AI

### Module 1: AI Debugging Foundations

#### Lesson 1: Getting Started with AI Debugging
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Introduction — AI debugging scope and methodology | `1.1.1-course-introduction.mp4` | HAVE |
| 2 | Why AI Debugging Is Useful — speed, pattern matching, blind spots | `1.1.2-why-ai-debugging-is-useful.mp4` | HAVE |
| 3 | Challenges with AI Output — hallucination, stale context, confidence | `1.1.3-challenges-with-ai-output.mp4` | HAVE |
| 4 | Exploring the Project — repository structure, key files | `1.1.4-exploring-the-project.mp4` | HAVE |
| 5 | Conclusion — module summary | `1.1.5-conclusion.mp4` | HAVE |

#### Lesson 2: Understanding the Codebase
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — codebase exploration approach | `1.2.1-introduction.mp4` | HAVE |
| 2 | Overview of Issues to Fix — bug inventory, severity triage | `1.2.2-overview-of-issues-to-fix.mp4` | HAVE |
| 3 | Architecture of the Project — modules, dependencies, data flow | `1.2.3-architecture-of-the-project.mp4` | HAVE |
| 4 | Documentation for Debugging — README, docstrings, inline comments | `1.2.4-documentation-for-debugging.mp4` | HAVE |
| 5 | Conclusion — module summary | `1.2.5-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Testing and Debugging

#### Lesson 1: Test-Driven Debugging
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — test-driven debugging methodology | `1.3.1-introduction.mp4` | HAVE |
| 2 | The Importance of Testing — regression prevention, confidence | `1.3.2-the-importance-of-testing.mp4` | HAVE |
| 3 | Easier Debugging with Tests — isolating failures, assertions | `1.3.3-easier-debugging-with-tests.mp4` | HAVE |
| 4 | Simple Fixing with Testing — red-green-refactor cycle | `1.3.4-simple-fixing-with-testing.mp4` | HAVE |
| 5 | Defining a Bug with a Test — reproducing issues systematically | `1.3.5-defining-a-bug-with-a-test.mp4` | HAVE |
| 6 | Conclusion — module summary | `1.3.6-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 3: Contextual Debugging

#### Lesson 1: Gathering Context
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — context-driven debugging approach | `2.1.1-introduction.mp4` | HAVE |
| 2 | Gathering Context for Debugging — stack traces, logs, state | `2.1.2-gathering-context-for-debugging.mp4` | HAVE |
| 3 | Finding Direction with Context — narrowing search space | `2.1.3-finding-direction-with-context.mp4` | HAVE |
| 4 | Helping AI with Logging — structured logs, trace IDs | `2.1.4-helping-ai-with-logging.mp4` | HAVE |
| 5 | Conclusion — module summary | `2.1.5-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 4: Advanced Debugging Techniques

#### Lesson 1: Exploring Unknown Bugs
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — exploratory debugging techniques | `2.2.1-introduction.mp4` | HAVE |
| 2 | Exploring Potential Unknown Bugs — fuzzing, edge cases, invariants | `2.2.2-exploring-potential-unknown-bugs.mp4` | HAVE |
| 3 | Overview of Debugging and Testing with AI — integrated strategies | `2.2.3-overview-of-debugging-and-testing-with-ai.mp4` | HAVE |
| 4 | Course Conclusion — debugging workflow recap | `2.2.4-course-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 12: Multi-Modal AI: Screenshots to Production Code

> **STATUS: NEED TRANSCRIPTION** — 28 videos in `Noah Gift/Multi-modal programming interfaces`, 0 SRTs

Build production applications using multi-modal AI techniques. Start with screenshot-to-code
conversions, set up multi-modal development environments, and apply prompt engineering with
visual context. Develop with GitHub Copilot for visual iteration, build web applications
using documentation-driven design, and automate validation with checks. Master advanced
patterns including MCP integration and Playwright browser automation for end-to-end
multi-modal workflows.

**Learning Objectives:**
- Convert screenshots to production code with multi-modal AI
- Set up multi-modal development environments and toolchains
- Apply prompt engineering techniques with visual context
- Build web applications with iterative visual feedback loops
- Automate validation checks for AI-generated visual outputs
- Integrate MCP and Playwright for browser-based AI workflows

### Module 1: Multi-Modal Foundations

#### Lesson 1: Understanding Multi-Modal AI
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — multi-modal programming scope | `1.1.1-introduction.mp4` | HAVE |
| 2 | What Is Multi-Modal Programming — visual + text + code inputs | `1.1.2-what-is-multi-modal-programming.mp4` | HAVE |
| 3 | Setting Up Multi-Modal Dev Environments — toolchain configuration | `1.1.3-setting-up-multi-modal-dev-environments.mp4` | HAVE |
| 4 | Your First Screenshot-to-Code Conversion — end-to-end demo | `1.1.4-your-first-screenshot-to-code-conversion.mp4` | HAVE |
| 5 | Conclusion — module summary | `1.1.5-conclusion.mp4` | HAVE |

#### Lesson 2: Visual Input Techniques
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — visual prompting techniques | `1.2.1-introduction.mp4` | HAVE |
| 2 | Prompt Engineering with Visual Context — image annotations, cropping | `1.2.2-prompt-engineering-with-visual-context.mp4` | HAVE |
| 3 | Introduction to GitHub Copilot and VS Code — AI pairing setup | `1.2.3-introduction-to-github-copilot-and-vscode.mp4` | HAVE |
| 4 | Developing with GitHub Copilot — code completion, inline suggestions | `1.2.4-developing-with-github-copilot.mp4` | HAVE |
| 5 | Conclusion — module summary | `1.2.5-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Web Development with Multi-Modal AI

#### Lesson 1: Web Development Setup
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — web development project overview | `1.3.1-introduction.mp4` | HAVE |
| 2 | What Will We Build — project scope, wireframes | `1.3.2-what-will-we-build.mp4` | HAVE |
| 3 | Live Reload and Developer Tools — hot reload, browser DevTools | `1.3.3-live-reload-and-developer-tools.mp4` | HAVE |
| 4 | Setting Up the Development Environment — Node, Vite, project scaffold | `1.3.4-setting-up-the-development-environment.mp4` | HAVE |
| 5 | Conclusion — module summary | `1.3.5-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 3: Applied Multi-Modal Techniques

#### Lesson 1: Iterative Development with AI
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — iterative AI development workflow | `2.1.1-introduction.mp4` | HAVE |
| 2 | Designing with Documentation — doc-driven development | `2.1.2-designing-with-documentation.mp4` | HAVE |
| 3 | Iterating Over First Changes — incremental improvements | `2.1.3-iterating-over-first-changes.mp4` | HAVE |
| 4 | Using Images for Iteration — screenshot feedback loops | `2.1.4-using-images-for-iteration.mp4` | HAVE |
| 5 | Challenges with Iteration — convergence, prompt drift | `2.1.5-challenges-with-iteration.mp4` | HAVE |

#### Lesson 2: Automation and Validation
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Automating Checks and Validations — CI checks, visual diffs | `2.1.6-automating-checks-and-validations.mp4` | HAVE |
| 2 | Conclusion — module summary | `2.1.7-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 4: Advanced Patterns

#### Lesson 1: MCP and Browser Automation
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — advanced multi-modal patterns | `2.2.1-introduction.mp4` | HAVE |
| 2 | Introduction to MCP — Model Context Protocol architecture | `2.2.2-introduction-to-mcp.mp4` | HAVE |
| 3 | Overview of Playwright — browser automation framework | `2.2.3-overview-of-playwright.mp4` | HAVE |
| 4 | Using Playwright MCP — browser-connected AI agent | `2.2.4-using-playwright-mcp.mp4` | HAVE |
| 5 | Overview of What We Built — project recap, architecture review | `2.2.5-overview-of-what-we-built.mp4` | HAVE |
| 6 | Course Conclusion — multi-modal workflow patterns | `2.2.6-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 13: Privacy-Conscious Development with AI Assistants

> **STATUS: NEED TRANSCRIPTION** — 21 videos in `Noah Gift/Windsurf for privacy-conscious development`, 0 SRTs

Develop with AI assistants while maintaining rigorous security and privacy standards.
Compare web-based and CLI-based AI tools, use GitHub Advanced Security and Grype for
vulnerability scanning, and conduct AI-assisted code reviews for security issues. Work
with Claude Code, Windsurf, and Gemini CLI using secure prompting techniques. Practice
identifying SQL injection, file handling vulnerabilities, HTTP header issues, and configure
automated security scanning with Dependabot and container scanning.

**Learning Objectives:**
- Evaluate AI coding tools for privacy and security characteristics
- Conduct AI-assisted code reviews focusing on security vulnerabilities
- Apply secure prompting techniques with Claude Code, Windsurf, and Gemini CLI
- Identify SQL injection, file handling, and HTTP header vulnerabilities
- Configure GitHub Advanced Security, Dependabot, and container scanning
- Build automated security scanning pipelines with Grype

### Module 1: Privacy Foundations

#### Lesson 1: Privacy-Conscious Development
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | What Is Privacy-Conscious Development — data handling, tool evaluation | `1.1.1-What-Is-Privacy-Conscious-Development.mp4` | HAVE |
| 2 | Web vs CLI — privacy trade-offs, data transmission paths | `1.1.2-Web-vs-CLI.mp4` | HAVE |
| 3 | GitHub Advanced Security — code scanning, secret scanning | `1.1.3-GHAS.mp4` | HAVE |
| 4 | Grype — container vulnerability scanner, SBOM analysis | `1.1.4-Grype.mp4` | HAVE |

#### Lesson 2: AI-Assisted Code Review
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Claude Code — CLI-based AI assistant, privacy model | `1.2.1-Claude-Code.mp4` | HAVE |
| 2 | Your First AI-Assisted Code Review — security-focused review session | `1.2.2-Your-First-AI-Assisted-Code-Review-Session.mp4` | HAVE |
| 3 | Reviewing Simple Security Issues — common vulnerability patterns | `1.2.3-Reviewing-Simple-Security-Issue.mp4` | HAVE |
| 4 | Passwords and Keys — credential management, secret detection | `1.2.4-Passwords-and-Keys.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: AI Coding Tools

#### Lesson 1: IDE-Based AI Tools
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Windsurf — IDE-integrated AI, privacy characteristics | `1.3.1-Windsurf.mp4` | HAVE |
| 2 | Gemini CLI — Google's AI assistant, terminal integration | `1.3.2-Gemini-CLI.mp4` | HAVE |
| 3 | Using AI Tools Safely — data boundaries, opt-out settings | `1.3.3-Using-AI-Tools-Safely.mp4` | HAVE |
| 4 | Secure Prompting — avoiding PII leakage, prompt hygiene | `1.3.4-Secure-Prompting.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 3: Vulnerability Patterns

#### Lesson 1: Common Vulnerabilities
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | SQL Injection — parameterized queries, ORM safety | `2.1.1-SQL-Injection.mp4` | HAVE |
| 2 | File Handling — path traversal, temp files, permissions | `2.1.2-File-Handling.mp4` | HAVE |
| 3 | HTTP Headers — CORS, CSP, security headers | `2.1.3-HTTP-Headers.mp4` | HAVE |
| 4 | Vulnerable Code — identifying and remediating patterns | `2.1.4-Vulnerable-Code.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 4: Security Automation

#### Lesson 1: Automated Security Scanning
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | GitHub Advanced Security — enterprise features, code scanning | `2.2.1-GitHub-Advanced-Security.mp4` | HAVE |
| 2 | Dependabot — automated dependency updates, security alerts | `2.2.2-Dependabot.mp4` | HAVE |
| 3 | Container Scanning with Grype — image vulnerability analysis | `2.2.3-Container-Scanning-Grype.mp4` | HAVE |
| 4 | Security Scans — CI pipeline integration, scheduled scanning | `2.2.4-Security-Scans.mp4` | HAVE |
| 5 | Conclusion — privacy-conscious development recap | `2.3.1-Conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 14: AI-Powered Data Pipelines with Deno

> **STATUS: NEED TRANSCRIPTION** — 13 videos in `Noah Gift/Build with AI_ Data Pipelines and Stream Processing with Deno`, 0 SRTs

Construct data pipelines using Deno's modern runtime and AI-driven development practices.
Start with roadmap-driven development using agentic AI, configure git pre-commit hooks as
quality gates, and explore the Deno ecosystem. Build data engineering tasks with Deno's task
system and playbooks, then compile, document, and vendor Deno applications for production
distribution.

**Learning Objectives:**
- Apply roadmap-driven development with agentic AI assistance
- Configure git pre-commit hooks as quality gates
- Build data engineering pipelines with Deno's task system
- Create task playbooks for repeatable data workflows
- Compile Deno applications for standalone distribution
- Generate documentation and vendor dependencies for production

### Module 1: Foundations and Tooling

#### Lesson 1: Development Methodology
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Introduction — Deno pipelines scope and goals | `1.0-course-intro.mp4` | HAVE |
| 2 | Roadmap-Driven Development with Agentic AI — AI-assisted planning | `1.2-roadmaps-driven-development-with-agentic-ai.mp4` | HAVE |
| 3 | Git Pre-Commit Hooks and Quality Gates — automated checks, CI gates | `1.3-git-pre-commit-hooks-quality-gates.mp4` | HAVE |

#### Lesson 2: Runtime Ecosystem
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Deno Ecosystem — permissions, TypeScript-first, standard library | `1.4-deno-ecosystem.mp4` | HAVE |
| 2 | Proactive vs Reactive Toolchains — Deno vs legacy runtimes | `1.5-proactive-vs-reactive-toolchains-deno-to-ruchy.mp4` | HAVE |
| 3 | Deno Runtime Tooling Demo — formatter, linter, test runner | `1.6-deno-runtime-tooling-demo.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Data Engineering Tasks

#### Lesson 1: Task Systems and Data Engineering
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Deno Task System — deno.json tasks, script orchestration | `2.1-deno-task-system.mp4` | HAVE |
| 2 | Deno Data Engineering — ETL patterns, streaming transforms | `2.2-deno-data-engineering.mp4` | HAVE |
| 3 | Deno Tasks Playbooks — repeatable workflow recipes | `2.3-deno-tasks-playbooks.mp4` | HAVE |
| 4 | Running Tasks Demo — live pipeline execution walkthrough | `2.4-running-tasks-demo.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 3: Compilation and Distribution

#### Lesson 1: Compile, Document, and Vendor
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Deno Compile — standalone binary, cross-compilation | `3.1-deno-compile.mp4` | HAVE |
| 2 | Deno Doc — auto-generated API docs, JSDoc integration | `3.2-deno-doc.mp4` | HAVE |
| 3 | Deno Vendor — dependency vendoring, offline builds | `3.3-deno-vendor.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 15: Building Deterministic MCP Agents

> **STATUS: NEED TRANSCRIPTION** — 13 videos in `Noah Gift/Build with AI_ Create Deterministic MCP Agents`, 0 SRTs

Design deterministic Model Context Protocol agents grounded in quality engineering
principles. Apply the Toyota Way through PMAT, understand certainty-scope tradeoffs,
and build finite state machine quality metrics. Study MCP protocol architecture, implement
six essential test types including property testing and fuzz testing with agentic AI,
and use Claude with PMAT for quality-assured agent development.

**Learning Objectives:**
- Apply Toyota Way quality principles to AI agent development
- Analyze certainty-scope tradeoffs in agent design
- Build finite state machine quality metrics for deterministic behavior
- Implement MCP protocol architecture for tool-connected agents
- Apply property testing and fuzz testing with agentic AI
- Use Claude with PMAT for quality-assured development

### Module 1: Quality Metrics and MCP Architecture

#### Lesson 1: Quality-First Development
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Introduction — deterministic MCP agents scope | `1.1-course-intro.mp4` | HAVE |
| 2 | Introduction to PMAT — quality framework, scoring methodology | `1.2-intro-pmat.mp4` | HAVE |
| 3 | Toyota Way and PMAT — continuous improvement, Kaizen | `1.3-toyota-way-pmat.mp4` | HAVE |
| 4 | Certainty-Scope Tradeoff — precision vs. generality in agents | `1.4-certainty-scope-tradeoff.mp4` | HAVE |

#### Lesson 2: Metrics and Protocol Architecture
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | FSM Quality Metrics — state machines for behavior verification | `1.5-fsm-quality-metrics.mp4` | HAVE |
| 2 | MCP Protocol Architecture — tools, resources, prompts | `1.6-mcp-protocol-architecture.mp4` | HAVE |
| 3 | Survivorship-Adjusted Language Popularity — ecosystem longevity metrics | `1.7-survivorship-adjusted-language-popularity.mp4` | HAVE |
| 4 | Six Essential Quality Metrics — coverage, complexity, churn, SATD, provability, entropy | `1.8-six-essential-quality-metrics.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Testing and Agentic Workflows

#### Lesson 1: Advanced Testing with AI
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Six Essential Test Types — unit, integration, property, fuzz, mutation, e2e | `2.1-six-essential-test-types.mp4` | HAVE |
| 2 | Property Testing with Agentic AI — invariant generation, Hypothesis | `2.2-property-testing-with-agentic-ai.mp4` | HAVE |
| 3 | Fuzz Testing with Agentic AI — corpus generation, crash analysis | `2.3-fuzz-testing-with-agentic-ai.mp4` | HAVE |

#### Lesson 2: Practical Agent Usage
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Using Claude with PMAT — quality-gated AI development workflow | `2.4-using-claude-with-pmat.mp4` | HAVE |
| 2 | Project Examples Walkthrough — real MCP agent implementations | `2.5-project-examples-walkthrough.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 16: Conversational Bot Architecture with Rust and Deno

> **STATUS: NEED TRANSCRIPTION** — 12 videos in `Noah Gift/Build with AI_ Developing a Discord bot conversationally`, 0 SRTs

Architect conversational bots using Rust's safety guarantees and async runtime. Design bot
architectures with Rust workspaces, understand Tokio for concurrent message handling, and
master Rust's memory model for safe bot development. Build a universal bot pattern that
connects to multiple backends — Bedrock Claude, Discord, and Deno — with interactive CLI
interfaces.

**Learning Objectives:**
- Design conversational bot architectures with Rust workspaces
- Implement async bot handlers using the Tokio runtime
- Apply Rust's memory model for safe concurrent bot development
- Build a universal bot pattern with pluggable backends
- Connect bots to Bedrock, Discord, and Deno platforms
- Create interactive CLI interfaces with AI assistance

### Module 1: Bot Architecture and Runtime

#### Lesson 1: Architecture Foundations
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Course Introduction — bot architecture scope and goals | `1.0-course-introduction.mp4` | HAVE |
| 2 | Conversation Bot Architecture — message flow, handler patterns | `1.2-conversation-bot-architecture.mp4` | HAVE |
| 3 | Rust Workspace Architecture — multi-crate bot project layout | `1.3-rust-workspace-architecture-bot.mp4` | HAVE |

#### Lesson 2: Rust Runtime Fundamentals
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Tokio Runtime — async executor, task spawning, select! | `1.4-tokio-runtime.mp4` | HAVE |
| 2 | Rust Memory Model — ownership, borrowing, lifetimes for bots | `1.5-rust-memory-model.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Bot Implementation

#### Lesson 1: Universal Bot Pattern
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Universal Bot Code Walkthrough — trait-based backend abstraction | `2.2-universal-bot-code-walkthrough.mp4` | HAVE |
| 2 | Basic Bot Demo — terminal-based chat, input loop | `2.3-universal-bot-basic-bot-demo.mp4` | HAVE |
| 3 | Interactive CLI with Bedrock and Claude Code — AI-powered bot backend | `2.4-universal-bot-bedrock-interactive-cli-claude-code.mp4` | HAVE |

#### Lesson 2: Platform Integration
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Discord Overview — bot tokens, gateway, slash commands | `2.6-discord-overview.mp4` | HAVE |
| 2 | Deno Overview — TypeScript bot runtime, permissions | `2.7-deno-overview.mp4` | HAVE |
| 3 | Deno Demo — live bot implementation in Deno | `2.8-deno-demo.mp4` | HAVE |
| 4 | Final Project Overview — architecture recap, extension points | `3.1-final-project-overview.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 17: AI Code Review Automation with GitHub Actions

> **STATUS: NEED TRANSCRIPTION** — 28 videos in `Noah Gift/Build with AI_ Developing a Code Review Assistant`, 0 SRTs

Build an AI-powered code review assistant from scratch and publish it to GitHub Marketplace.
Understand GitHub Actions basics, define review criteria using PMAT quality tools, and design
prompt strategies for LLM-based code analysis. Create the GitHub Action, add tests, implement
local testing strategies, then deploy to GitHub and use the bot in real pull requests.
Document the action and publish to GitHub Marketplace.

**Learning Objectives:**
- Build a complete AI code review GitHub Action from scratch
- Define review criteria and standards using PMAT quality tools
- Design prompt strategies for LLM-based code analysis
- Implement local and remote testing strategies for GitHub Actions
- Deploy and use AI code review bots in pull requests
- Write documentation and publish to GitHub Marketplace

### Module 1: Code Review Foundations

#### Lesson 1: Why Automate Code Reviews
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — AI code review automation scope | `1.1.1-introduction.mp4` | HAVE |
| 2 | Why Automate Code Reviews with AI — consistency, speed, coverage | `1.1.2-why-automate-code-reviews-with-ai.mp4` | HAVE |
| 3 | Architectural Overview — GitHub Actions, LLM integration | `1.1.3-architectural-overview.mp4` | HAVE |
| 4 | Understanding GitHub Actions Basics — workflows, triggers, runners | `1.1.4-understanding-github-actions-basics.mp4` | HAVE |
| 5 | Leveraging LLMs for Development — prompt design for code analysis | `1.1.5-leveraging-llms-for-development.mp4` | HAVE |
| 6 | Conclusion — module summary | `1.1.6-conclusion.mp4` | HAVE |

#### Lesson 2: Review Criteria and Standards
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — defining quality standards | `1.2.1-introduction.mp4` | HAVE |
| 2 | Overview of the PMAT Tool — quality metrics, scoring | `1.2.2-overview-of-the-pmat-tool.mp4` | HAVE |
| 3 | Defining Review Criteria and Standards — coding standards codification | `1.2.3-defining-review-criteria-and-standards.mp4` | HAVE |
| 4 | Overview of a Similar GitHub Action — existing action analysis | `1.2.4-overview-of-a-similar-github-action.mp4` | HAVE |
| 5 | Initial Prompt Strategy — system prompt, review template | `1.2.5-initial-prompt-strategy.mp4` | HAVE |
| 6 | Conclusion — module summary | `1.2.6-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Building the GitHub Action

#### Lesson 1: Creating the Action
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — action creation methodology | `1.3.1-introduction.mp4` | HAVE |
| 2 | Defining Strategy with Documentation — README-driven development | `1.3.2-defining-your-strategy-with-documentation.mp4` | HAVE |
| 3 | Creating the GitHub Action — action.yml, Docker container | `1.3.3-creating-the-github-action.mp4` | HAVE |
| 4 | Adding Tests and Refining — test harness, edge cases | `1.3.4-adding-tests-and-refining.mp4` | HAVE |
| 5 | Local Testing Strategies — act, Docker compose, mock events | `1.3.5-local-testing-strategies.mp4` | HAVE |
| 6 | Conclusion — module summary | `1.3.6-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 3: Deployment and Real-World Usage

#### Lesson 1: Deploying to GitHub
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — deployment workflow | `2.1.1-introduction.mp4` | HAVE |
| 2 | Creating the Action in GitHub — repository setup, release tagging | `2.1.2-creating-the-github-action-in-github.mp4` | HAVE |
| 3 | Using the Bot in a Pull Request — live PR review demo | `2.1.3-using-the-bot-in-a-pull-request.mp4` | HAVE |
| 4 | Challenges with Generative AI — non-deterministic reviews, noise | `2.1.4-challenges-with-generative-ai.mp4` | HAVE |
| 5 | Exploring Additional Features — multi-model, custom rules | `2.1.5-exploring-additional-features.mp4` | HAVE |
| 6 | Conclusion — module summary | `2.1.6-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 4: Documentation and Marketplace

#### Lesson 1: Publishing to Marketplace
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — marketplace publishing workflow | `2.2.1-introduction.mp4` | HAVE |
| 2 | Writing Clear Action Documentation — README, inputs, outputs | `2.2.2-writing-clear-action-documentation.mp4` | HAVE |
| 3 | Publishing to GitHub Marketplace — listing, categories, verification | `2.2.3-publishing-to-github-marketplace.mp4` | HAVE |
| 4 | Conclusion — course recap and next steps | `2.2.4-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 18: LLM Security: Vulnerabilities and Defense Patterns

> **STATUS: NEED TRANSCRIPTION** — 23 videos in `Noah Gift/Introduction to LLM Vulnerabilities`, 0 SRTs

Understand the security landscape of large language model applications. Learn how LLMs work
in production applications — API-based, embedded model, and multi-model architectures. Study
model-level vulnerabilities including prompt injection, insecure output handling, model theft,
and model replication. Examine application-level threats: sensitive information disclosure and
insecure plugin design. Survey emerging vulnerability patterns and build defensive strategies.

**Learning Objectives:**
- Analyze how LLMs work in API-based, embedded, and multi-model applications
- Identify prompt injection and insecure output handling vulnerabilities
- Evaluate model theft and model replication attack vectors
- Detect sensitive information disclosure risks in AI applications
- Assess insecure plugin design patterns and their mitigations
- Survey emerging LLM vulnerability patterns and defense strategies

### Module 1: LLM Foundations and AI Applications

#### Lesson 1: How LLMs Work
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Meet Your Instructor — course overview and background | `1.0.0.0-meet-your-instructor.mp4` | HAVE |
| 2 | How Do LLMs Work in Applications — inference pipelines, API layers | `1.1.1.2-how-do-llms-work-in-applications.mp4` | HAVE |
| 3 | How Are LLMs Created — training, fine-tuning, RLHF | `1.1.1.3-how-are-llms-created.mp4` | HAVE |
| 4 | What Are LLMs and How Do They Work — transformers, attention, tokens | `1.1.1.4-what-are-llms-and-how-do-they-work.mp4` | HAVE |

#### Lesson 2: Generative AI Application Types
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — application architecture overview | `1.1.2.1-introduction.mp4` | HAVE |
| 2 | Common Types of Generative AI Applications — chatbots, agents, pipelines | `1.1.2.2-common-types-of-generative-ai-applications.mp4` | HAVE |
| 3 | Overview of an API-Based Application — request/response, rate limits | `1.1.2.3-overview-of-an-api-based-application.mp4` | HAVE |
| 4 | Overview of an Embedded Model Application — on-device inference | `1.1.2.4-overview-of-an-embedded-model-application.mp4` | HAVE |
| 5 | What Is a Multi-Model Application — routing, ensemble, fallback | `1.1.2.5-what-is-a-multi-model-application.mp4` | HAVE |
| 6 | Challenges and Highlights of AI Applications — latency, cost, reliability | `1.1.2.6-challenges-and-highglights-of-ai-applications.mp4` | HAVE |
| 7 | Summary — application patterns recap | `1.1.2.7-summary.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Model-Level Vulnerabilities

#### Lesson 1: Prompt Injection and Model Theft
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — model-level threat landscape | `1.2.1.1-introduction.mp4` | HAVE |
| 2 | Prompt Injection — direct injection, indirect injection, jailbreaks | `1.2.1.2-prompt-injection.mp4` | HAVE |
| 3 | Insecure Output Handling — XSS via LLM, code execution risks | `1.2.1.3-insecure-output-handling.mp4` | HAVE |
| 4 | Model Theft — weight extraction, API distillation | `1.2.1.5-model-theft.mp4` | HAVE |
| 5 | Model Replication — knowledge distillation, fine-tuning clones | `1.2.1.6-model-replication.mp4` | HAVE |
| 6 | Summary — model vulnerability patterns recap | `1.2.1.7-summary.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 3: Application-Level Vulnerabilities

#### Lesson 1: Information Disclosure and Plugin Security
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — application-level threat landscape | `1.3.1.1-introduction.mp4` | HAVE |
| 2 | Application Vulnerabilities — attack surface analysis | `1.3.1.2-application-vulnerabilities.mp4` | HAVE |
| 3 | Sensitive Information Disclosure — training data leakage, PII exposure | `1.3.1.3-sensitive-information-disclosure.mp4` | HAVE |
| 4 | Insecure Plugin Design — tool injection, permission escalation | `1.3.1.5-insecure-plugin-design.mp4` | HAVE |
| 5 | Summary — application vulnerability patterns recap | `1.3.1.6-summary.mp4` | HAVE |

#### Lesson 2: Emerging Threats
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Other Types of Vulnerabilities — supply chain, data poisoning | `1.4.1.1-other-types-of-vulnerabilities.mp4` | HAVE |
| 2 | Course Conclusion — defense strategy recap | `1.4.1.2-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 19: Build a Production SaaS Application with AI

> **STATUS: NEED TRANSCRIPTION** — 30 videos in `Noah Gift/Build a SaaS MVP in a Day`, 0 SRTs

End-to-end capstone project building a production SaaS application with AI assistance. Plan
an MVP architecture, leverage LLMs for rapid development, build API endpoints with
documentation and test harnesses, containerize the application with automated Docker
workflows, and publish to a container registry. Develop a converting landing page, pricing
page, and about page, deploy to GitHub Pages, implement API key access controls, and add
developer documentation.

**Learning Objectives:**
- Plan and architect an MVP with AI-assisted development
- Build documented API endpoints with test harnesses
- Containerize applications with Docker and automated CI workflows
- Publish container images to registries
- Develop and deploy a marketing site to GitHub Pages
- Implement API key access controls and developer documentation

### Module 1: Foundation and Planning

#### Lesson 1: Project Setup
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — SaaS MVP project overview | `1.1.1-introduction-REVISED.mp4` | HAVE |
| 2 | What Are We Building — product scope, feature list | `1.1.2-what-are-we-building.mp4` | HAVE |
| 3 | Architectural Overview — tech stack, service boundaries | `1.1.3-architectural-overview.mp4` | HAVE |
| 4 | Planning an MVP — prioritization, feature slicing | `1.1.4-planning-an-mvp.mp4` | HAVE |
| 5 | Leveraging LLMs for Development — AI-assisted scaffolding | `1.1.5-leveraging-llms-for-development.mp4` | HAVE |
| 6 | Conclusion — module summary | `1.1.6-conclusion.mp4` | HAVE |

#### Lesson 2: API Development
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — API development approach | `1.2.1-introduction.mp4` | HAVE |
| 2 | Initial Project Structure — directory layout, config files | `1.2.2-initial-project-structure.mp4` | HAVE |
| 3 | Exploring Data and Defining Endpoints — REST design, resources | `1.2.3-exploring-data-and-defining-endpoints.mp4` | HAVE |
| 4 | Defining the API with Documentation — OpenAPI spec, Swagger | `1.2.4-defining-the-api-with-documentation.mp4` | HAVE |
| 5 | Verifying the API — curl tests, status codes, response shapes | `1.2.5-verifying-the-api.mp4` | HAVE |
| 6 | Creating a Test Harness — automated endpoint validation | `1.2.6-creating-a-test-harness.mp4` | HAVE |
| 7 | Conclusion — module summary | `1.2.7-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Containerization

#### Lesson 1: Container Workflow
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — containerization approach | `1.3.1-introduction.mp4` | HAVE |
| 2 | Containerizing the Application — Dockerfile, multi-stage builds | `1.3.2-containerizing-the-application.mp4` | HAVE |
| 3 | Testing and Verifying the Container — health checks, smoke tests | `1.3.3-testing-and-verifying-the-container.mp4` | HAVE |
| 4 | Automating Containerization — CI pipeline, image tagging | `1.3.4-automating-containerization.mp4` | HAVE |
| 5 | Publishing to a Registry — Docker Hub, GitHub Packages | `1.3.5-publishing-the-container-to-a-registry.mp4` | HAVE |
| 6 | Conclusion — module summary | `1.3.6-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 3: Frontend Development

#### Lesson 1: Building the Frontend
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — frontend development approach | `2.1.1-introduction.mp4` | HAVE |
| 2 | Create a Converting Landing Page — hero, CTA, social proof | `2.1.2-create-a-converting-landing-page.mp4` | HAVE |
| 3 | Refine the Pricing Page — tier design, feature comparison | `2.1.3-refine-the-pricing-page.mp4` | HAVE |
| 4 | Design an About Us Page — team, mission, trust signals | `2.1.4-design-an-about-us-page.mp4` | HAVE |
| 5 | Deploy to GitHub Pages — static site hosting, custom domain | `2.1.5-deploy-your-new-site-to-github-pages.mp4` | HAVE |
| 6 | Conclusion — module summary | `2.1.6-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 4: Final Integration

#### Lesson 1: Access Control and Documentation
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Introduction — final integration approach | `2.2.1-introduction.mp4` | HAVE |
| 2 | Implementing API Key Access — key generation, validation, rate limits | `2.2.2-implementing-api-key-access.mp4` | HAVE |
| 3 | Adding Developer Documentation — getting started, examples, reference | `2.2.3-adding-developer-documentation.mp4` | HAVE |
| 4 | Overview and Next Steps — feature roadmap, scaling considerations | `2.2.4-overview-and-next-steps.mp4` | HAVE |
| 5 | Course Conclusion — SaaS MVP patterns recap | `2.2.5-course-conclusion.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Course 20: AI Engineering Capstone: Serverless Multi-Model Systems

> **STATUS: NEED TRANSCRIPTION** — 9 videos in `2025-Courses/Capstone-AWS-AI`, 0 SRTs

Final capstone integrating skills from all nineteen preceding courses. Build serverless AI
systems that route between multiple models using Amazon Bedrock. Implement YAML-based prompt
configurations, multi-model flow architectures, and complete Bedrock router systems. Deploy
production workloads using Cargo Lambda for Rust serverless functions, tackling challenges
that combine model selection, serverless deployment, and performance optimization.

**Learning Objectives:**
- Design multi-model flow architectures with intelligent routing
- Implement YAML-based prompt configuration systems
- Build complete Amazon Bedrock router applications
- Deploy Rust serverless functions with Cargo Lambda
- Evaluate ecosystem evolution across model providers
- Integrate serverless deployment with multi-model AI orchestration

### Module 1: Capstone Challenges

#### Lesson 1: Multi-Model Architecture
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | AI Engineering Introduction — capstone scope, integrated skills | `0.0-ai-engineering-intro.mp4` | HAVE |
| 2 | Capstone Challenge: Bedrock and Ollama — dual-model routing | `1.1-capstone-challenge-bedrock-ollama.mp4` | HAVE |
| 3 | Demo: Rust LLMs with Ollama and Bedrock — live routing demo | `1.2-demo-capstone-rust-llms-ollama-bedrock.mp4` | HAVE |
| 4 | Ecosystem Evolution Models — provider landscape, trends | `1.4-ecosystem-evolution-models.mp4` | HAVE |

#### Lesson 2: Production Patterns
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | YAML Prompts — configuration-driven prompt management | `1.6-yaml-prompts.mp4` | HAVE |
| 2 | Multi-Model Flow — orchestration graph, fallback chains | `1.8-multimodel-flow.mp4` | HAVE |
| 3 | Amazon Bedrock Router Complete — full router implementation | `1.10-amazon-bedrock-router-complete.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

### Module 2: Serverless AI Deployment

#### Lesson 1: Cargo Lambda and Serverless
> Produces: key-terms.md, reflection.md

| # | Video | File | Status |
|---|-------|------|--------|
| 1 | Cargo Lambda: Rust Serverless Challenge — function setup, local testing | `1.12-cargo-lambda-rust-serverless-challenge-seq-prime.mp4` | HAVE |
| 2 | Final Capstone: Rust Cargo Lambda Bedrock — production deployment | `1.16-final-capstone-challenge-rust-cargo-lambda-bedrock.mp4` | HAVE |

#### Critical Thinking Assessment
> Quiz + roleplay.md

---

## Deduplication Notes

### Merged Courses
- **Course 1** merges `LLMs-On-AWS` (27v) + `AWS Gen AI Services` (22v) → 32 unique videos (17 shared)
- Noah Gift duplicates dropped: `AWS Gen AI Services`, `AI Orchestration`, `Building AI Applications with Amazon Bedrock`, `CLI Automation with Amazon Q`, `Large Language Model (LLMs) on AWS`

### Cross-Course Video Overlap (minor, 1–2 videos)
- AI-Orchestration ↔ Advanced AI Analytics (1)
- AI-Orchestration ↔ CLI Automation (1)
- AI-Orchestration ↔ Natural Language AI (1)
- Advanced AI Analytics ↔ CLI Automation (2)
- Advanced AI Analytics ↔ Natural Language AI (2)
- CLI Automation ↔ Natural Language AI (2)

### Excluded
- Noah Gift "Rust Programming" (71 videos marked "old don't use", 1 new)
- Noah Gift "Vector, Graph, and DynamoDB" (1 video)
- Noah Gift "Responsible Generative AI and Local LLMs" (1 video)
- Noah Gift "MLOps Tools MLflow and Hugging Face" (51 videos — not in user's selection)
- Noah Gift "AI Engineering on AWS" (9 videos — not in user's selection)

---

## Summary

| # | Course | Modules | Lessons + CTA | Videos | SRTs | Status |
|---|--------|---------|---------------|--------|------|--------|
| 1 | Generative AI and Foundation Models on AWS | 4 | 8 + 4 CTA | 32/32 | 0 | **NEED TRANSCRIPTION** |
| 2 | Intelligent Applications with Amazon Bedrock | 3 | 6 + 3 CTA | 19/19 | 0 | **NEED TRANSCRIPTION** |
| 3 | Prompt Architecture and NLP on Amazon Bedrock | 2 | 4 + 2 CTA | 14/14 | 0 | **NEED TRANSCRIPTION** |
| 4 | AI Orchestration: From Local Models to Cloud | 4 | 8 + 4 CTA | 27/27 | 0 | **NEED TRANSCRIPTION** |
| 5 | Enterprise AIOps and Amazon Q Business | 3 | 5 + 3 CTA | 13/13 | 0 | **NEED TRANSCRIPTION** |
| 6 | AI Security and Governance on AWS | 4 | 6 + 4 CTA | 16/16 | 0 | **NEED TRANSCRIPTION** |
| 7 | AI-Powered Analytics and Performance Engineering | 2 | 4 + 2 CTA | 16/16 | 0 | **NEED TRANSCRIPTION** |
| 8 | CLI Automation with Amazon Q and CloudShell | 2 | 4 + 2 CTA | 11/11 | 0 | **NEED TRANSCRIPTION** |
| 9 | Deterministic LLM Programming and Quality Metrics | 3 | 6 + 3 CTA | 18/18 | 0 | **NEED TRANSCRIPTION** |
| 10 | Agentic AI: Actor Models and Subagent Architecture | 3 | 5 + 3 CTA | 16/16 | 0 | **NEED TRANSCRIPTION** |
| 11 | AI-Assisted Debugging and Test-Driven Fixes | 4 | 5 + 4 CTA | 25/25 | 0 | **NEED TRANSCRIPTION** |
| 12 | Multi-Modal AI: Screenshots to Production Code | 4 | 6 + 4 CTA | 28/28 | 0 | **NEED TRANSCRIPTION** |
| 13 | Privacy-Conscious Development with AI Assistants | 4 | 5 + 4 CTA | 21/21 | 0 | **NEED TRANSCRIPTION** |
| 14 | AI-Powered Data Pipelines with Deno | 3 | 4 + 3 CTA | 13/13 | 0 | **NEED TRANSCRIPTION** |
| 15 | Building Deterministic MCP Agents | 2 | 4 + 2 CTA | 13/13 | 0 | **NEED TRANSCRIPTION** |
| 16 | Conversational Bot Architecture with Rust and Deno | 2 | 4 + 2 CTA | 12/12 | 0 | **NEED TRANSCRIPTION** |
| 17 | AI Code Review Automation with GitHub Actions | 4 | 5 + 4 CTA | 28/28 | 0 | **NEED TRANSCRIPTION** |
| 18 | LLM Security: Vulnerabilities and Defense Patterns | 3 | 5 + 3 CTA | 23/23 | 0 | **NEED TRANSCRIPTION** |
| 19 | Build a Production SaaS Application with AI | 4 | 5 + 4 CTA | 30/30 | 0 | **NEED TRANSCRIPTION** |
| 20 | AI Engineering Capstone: Serverless Multi-Model Systems | 2 | 4 + 2 CTA | 9/9 | 0 | **NEED TRANSCRIPTION** |

**Totals:** 404 videos all present. 0 SRTs exist. All 20 courses need transcription.

**Artifact counts per course:** Each lesson produces key-terms.md + reflection.md. Each module ends with
Critical Thinking Assessment (quiz + roleplay.md). Total across specialization: 113 lessons × 2 artifacts +
62 CTAs × roleplay.md = 226 key-terms/reflections + 62 roleplays + 62 quizzes.
