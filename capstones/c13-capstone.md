# Capstone: Privacy-Conscious Development with AI Assistants

## Project Overview

Perform a comprehensive security audit of a web application using privacy-conscious AI development practices, combining multiple AI assistants (Claude Code, Windsurf, Gemini CLI) with automated security scanning tools (GHAS, Grype, Dependabot). The project identifies and remediates security vulnerabilities while evaluating the privacy implications of using different AI tools during the development process.

## Deliverables

### 1. AI-Assisted Security Code Review
Conduct a security-focused code review of a web application using Claude Code, identifying vulnerabilities across SQL injection, file handling, HTTP headers, and hardcoded secrets. Review at least ten code files using AI-assisted analysis, documenting each finding with severity classification, reproduction steps, and remediation. Apply secure prompting techniques that avoid exposing sensitive data to AI tools during the review process.

### 2. Automated Security Scanning Pipeline
Build a security scanning pipeline that integrates GitHub Advanced Security (code scanning and secret detection), Grype for container vulnerability scanning, and Dependabot for automated dependency updates. Configure the pipeline to run on every pull request and produce a unified security report. Demonstrate container scanning on at least two container images with different base images, documenting the vulnerability landscape of each.

### 3. Privacy-Conscious AI Tool Evaluation
Evaluate three AI development tools (Claude Code, Windsurf, Gemini CLI) against privacy criteria including data handling policies, context exposure, and retention practices. Document the privacy characteristics of web-based versus CLI-based AI tools. Produce a privacy assessment framework that developers can use to select AI tools based on their organization's data sensitivity requirements, including secure prompting guidelines and risk mitigation strategies for each tool category.

## Evaluation Criteria

### Distinction
- Security review identifies at least ten vulnerabilities across four categories with verified remediations
- Scanning pipeline covers code, container, and dependency layers with unified reporting and measurable coverage metrics
- Privacy evaluation includes quantitative comparison across three tools with actionable organizational adoption guidelines

### Proficient
- Security review covers SQL injection, file handling, and secrets with AI-assisted findings and remediations
- GHAS, Grype, and Dependabot are integrated into a functional scanning pipeline
- Privacy evaluation compares at least two AI tools with documented privacy characteristics

### Developing
- Security review identifies vulnerabilities but lacks systematic coverage or remediation verification
- Scanning pipeline is partially implemented without unified reporting
- Privacy evaluation is qualitative without structured comparison framework

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "Privacy-Conscious Development with AI Assistants — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository

## What to Submit

Submit the URL of one GitHub repository that contains:

1. A `reviews/` folder with one written finding for each of the at least ten code files you reviewed (severity, reproduction steps, remediation).
2. A workflow in `.github/workflows/` that runs on every pull request, modelled on [`c13/security-pipeline.yml`](c13/security-pipeline.yml): it scans at least two container images with Grype and uploads each result as SARIF, so the findings appear together in the repository's Security view (the tab is now labelled "Security and quality").
3. A `PRIVACY.md` with your three-tool assessment framework.

Notes on the pipeline: GitHub code scanning and secret scanning run for free on public repositories; private repositories need GitHub Code Security and GitHub Secret Protection (see <https://docs.github.com/en/get-started/learning-about-github/about-github-advanced-security>). Dependabot reports go to Dependabot alerts, not to code scanning, so they sit beside the SARIF results rather than inside them.
