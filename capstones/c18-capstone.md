# Capstone: LLM Security: Vulnerabilities and Defense Patterns

## Project Overview

Conduct a comprehensive security assessment of an LLM-powered application, systematically testing it against the full taxonomy of LLM vulnerabilities including prompt injection, insecure output handling, model theft, sensitive information disclosure, and insecure plugin design. Implement defense patterns at every layer and produce a security audit report with actionable remediation guidance.

## Deliverables

### 1. LLM Vulnerability Assessment
Build a test application that integrates an LLM through both API-based and embedded model architectures. Systematically test the application against at least six vulnerability categories: prompt injection (direct and indirect), insecure output handling, model theft through extraction queries, sensitive information disclosure, insecure plugin design, and excessive agency. Document each attack technique, its success or failure, and the root cause of each vulnerability.

### 2. Defense Pattern Implementation
Implement defense-in-depth patterns for each identified vulnerability: input sanitization and prompt/data separation for injection defense, output validation and sandboxing for insecure output handling, rate limiting and output perturbation for model theft prevention, data classification and output filtering for information disclosure, and permission boundaries for plugin security. Test each defense against the original attack vectors and document the residual risk that remains.

### 3. Multi-Model Security Architecture Analysis
Analyze the security implications of multi-model application architectures where multiple AI models are chained in a pipeline. Document how compound vulnerability surfaces emerge when models are orchestrated together. Evaluate the security differences between API-based, embedded model, and multi-model application types. Produce a security audit report suitable for a technical leadership audience that includes a threat model, vulnerability findings, defense implementations, residual risks, and prioritized remediation recommendations.

## Evaluation Criteria

### Distinction
- Assessment covers at least six vulnerability categories with documented attack techniques and root cause analysis
- Defense patterns demonstrate measurable reduction in attack success rate with residual risk quantification
- Audit report includes threat model, multi-model analysis, and prioritized remediations suitable for executive review

### Proficient
- At least four vulnerability categories are tested with documented results and defense implementations
- Defense patterns address the highest-severity vulnerabilities with basic testing verification
- Audit report covers findings, defenses, and recommendations for the assessed application

### Developing
- Assessment covers prompt injection and one or two additional categories without systematic methodology
- Defenses are proposed but not implemented or tested against attack vectors
- Report documents vulnerabilities without defense pattern analysis or prioritized remediations

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "LLM Security: Vulnerabilities and Defense Patterns — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository
