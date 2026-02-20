# GenAI-Assisted COBOL to Java Modernization (PoC)

## Overview

This proof-of-concept demonstrates how generative AI can assist in modernizing legacy COBOL systems by:

- Translating COBOL programs into clean, object-oriented Java code.
- Automatically generating Javadoc-style technical documentation.
- Evaluating translation quality using BLEU scores.

The goal is to accelerate legacy modernization, reduce manual effort, and provide a reproducible AI-assisted workflow.

---

## Features

- COBOL → Java Translation: Converts procedural COBOL programs into functional, object-oriented Java classes with proper field mapping and methods.
- Documentation Generation: Produces Javadoc for classes, fields, methods, and usage examples.
- Quality Evaluation: Uses BLEU scores to compare AI-generated Java against reference implementations.

---

## Requirements

- Python
- transformers
- langchain_huggingface
- sacrebleu
- logging

---

## Usage

- Set up the LLM pipeline (Salesforce/codegen-350M-mono used in PoC).
- Prepare COBOL code as a string input.
- Run the pipeline to:
	- Translate COBOL → Java
	- Generate documentation
	- Evaluate BLEU score

---

## Output

- Java Code: Fully functional, object-oriented Java class.
- Documentation: Javadoc-style documentation for the translated code.
- BLEU Score: Quantitative evaluation of translation quality.

---

## Conclusion

This PoC demonstrates the potential of generative AI in legacy system modernization, providing automated code translation, documentation, and quality evaluation, significantly reducing manual effort and accelerating migration projects
