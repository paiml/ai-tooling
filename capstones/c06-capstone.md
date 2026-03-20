# Capstone: AI Security and Governance on AWS

## Project Overview

Design a comprehensive AI security architecture that implements defense-in-depth for Bedrock-powered applications, combining IAM authentication patterns, Bedrock guardrails for input and output safety, CloudTrail audit visualization, and responsible AI practices with SageMaker Clarify. The project produces a hardened AI application with documented security controls and a governance framework.

## Deliverables

### 1. Defense-in-Depth Security Architecture
Implement a layered security architecture for a Bedrock application including IAM-based authentication with least-privilege policies, network-level controls, and Rust-based security tooling for memory-safe AI infrastructure. Configure CloudTrail logging for all Bedrock API invocations and build a visualization dashboard that identifies usage patterns and anomalies in audit data. Document the complete security architecture with a threat model.

### 2. Bedrock Guardrails with Adversarial Testing
Configure Bedrock guardrails with input validation (content filtering, topic denial, sensitive information detection) and output safety controls (response filtering, safety boundaries). Define guardrail policies for at least two different risk levels. Build an adversarial test suite that probes edge cases including prompt injection attempts, boundary condition inputs, and policy bypass techniques. Document which attacks succeed and which are blocked.

### 3. Responsible AI Governance Report
Deploy Amazon Q with security-appropriate access controls and data source permissions. Use SageMaker Clarify to perform bias detection and generate model explainability reports on a sample dataset. Produce a governance report that synthesizes the security architecture, guardrail configurations, CloudTrail audit analysis, Amazon Q access controls, and SageMaker Clarify findings into an actionable compliance framework.

## Evaluation Criteria

### Distinction
- Security architecture includes documented threat model with mitigations mapped to specific AWS security controls
- Adversarial test suite covers at least ten attack patterns with pass/fail analysis and defense effectiveness metrics
- Governance report includes quantitative bias detection results and actionable compliance recommendations

### Proficient
- IAM policies, CloudTrail logging, and guardrails are configured with basic security documentation
- Adversarial testing covers prompt injection and content policy bypass with documented results
- Governance report addresses security architecture, guardrails, and responsible AI with SageMaker Clarify analysis

### Developing
- Security controls are partially implemented without a comprehensive architecture document
- Guardrails are configured but lack adversarial testing or edge case analysis
- Governance report covers some aspects but lacks quantitative analysis or compliance framework

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "AI Security and Governance on AWS — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository
