# Capstone: AI Code Review Automation with GitHub Actions

## Project Overview

Build and deploy an AI-powered code review GitHub Action that automatically analyzes pull requests using Large Language Models, provides contextual feedback on code changes, and publishes to the GitHub Marketplace. The project covers the complete lifecycle from defining review criteria and prompt strategy through local testing, deployment, and documentation for open-source distribution.

## Deliverables

### 1. AI Code Review GitHub Action
Build a custom GitHub Action that triggers on pull request events, extracts code diffs, sends them to an LLM for analysis, and posts review comments back to the pull request. Define review criteria that guide the AI analysis, crafted through iterative prompt engineering. Integrate pmat for code quality metrics that supplement AI-generated review feedback. Include an action.yml with clear inputs, outputs, and configuration options.

### 2. Testing and Deployment Pipeline
Create a testing strategy for the GitHub Action including local testing with tools like act, automated test suites that validate action behavior against sample pull requests, and strategies for handling generative AI challenges such as hallucination and inconsistent output. Deploy the action to a GitHub repository, demonstrate it reviewing at least three real pull requests, and document the results including both accurate findings and any false positives.

### 3. Documentation and GitHub Marketplace Publishing
Write comprehensive action documentation including README with usage examples, configuration guide, and best practices for review criteria customization. Publish the action to the GitHub Marketplace with proper versioning and release management. Produce an evaluation report comparing AI-automated code review against manual human review across review thoroughness, consistency, and time to feedback, with recommendations for when AI review augments versus replaces human review.

## Evaluation Criteria

### Distinction
- Action produces contextual, actionable review feedback on at least three pull requests with hallucination rate below 20%
- Testing pipeline includes local testing, automated validation, and documented hallucination mitigation strategies
- Marketplace-published action includes comprehensive documentation with quantitative human-versus-AI review comparison

### Proficient
- Action triggers on pull requests, analyzes diffs with an LLM, and posts relevant review comments
- Local testing validates action behavior with at least one deployment to a real repository
- Documentation is published with usage examples and the action is available on GitHub Marketplace

### Developing
- Action runs but review feedback lacks contextual relevance or actionable suggestions
- Testing is manual without local testing tooling or automated validation
- Documentation is incomplete or the action is not published to Marketplace

## Share Your Work

Add this capstone to your LinkedIn profile as a portfolio project:

1. Go to your LinkedIn profile and select **Add profile section** > **Projects**
2. Title: "AI Code Review Automation with GitHub Actions — Applied AI Engineering Specialization"
3. Description: Summarize the project deliverables and key skills demonstrated
4. Link: Include the URL to your completed GitHub repository
