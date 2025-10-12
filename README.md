# LLM-IaC-SecEval

> Research hub for reducing false positives in IaC security analysis with LLMs

This is the main entry point for our research on using Large Language Models to reduce false positives from static analysis tools in Infrastructure-as-Code (IaC) security scanning.

## Overview

**Problem**: Static analysis tools generate high false positive rates, causing alert fatigue and preventing widespread adoption.

**Solution**: LLM-based post-filtering to distinguish true security vulnerabilities from false alarms while maintaining high recall.

**Target**: 4 security smell categories (hardcoded secrets, suspicious comments, weak cryptography, insecure HTTP) across Ansible, Chef, and Puppet.

## Repositories

### 1. LLM-IaC-SecEval-Experiments
Early-stage methodology exploration and evaluation.

- Comparative evaluation of pure LLM vs post-filter approaches
- Oracle datasets and ground truth annotations
- Pseudo-labeled dataset generation
- Experimental results and analysis

**GitHub**: `LLM-IaC-SecEval-Experiments`

### 2. LLM-IaC-SecEval-Models
4-stage systematic training pipeline for encoder models.

- Stage 1: Broad candidate selection
- Stage 2: Focused hyperparameter tuning
- Stage 3: Final optimization with threshold sweep
- Stage 4: Multi-seed stability testing

**GitHub**: `LLM-IaC-SecEval-Models`

### 3. iacsec

Production-ready CLI tool combining GLITCH + encoder LLM.

- Post-filters GLITCH detections using CodeT5p-220M
- Supports Ansible, Chef, Puppet
- Outputs SARIF, JSONL, CSV formats
- Ready for CI/CD integration

**GitHub**: iacsec 

## Paper Materials

- Pre-print: `paper/preprint.pdf`
- Camera-ready: `paper/camera-ready.pdf`
- Supplementary: `paper/supplementary/`
- Citation: `paper/citation.bib`

## Artifact Reproducibility

See `artifact/release-manifest.yaml` for pinned commit SHAs, model versions, dataset versions, and tool dependencies used to generate paper results.

Reproduction scripts:
```bash
./artifact/checkout-pinned.sh
./artifact/reproduce-paper-results.sh
```

## Quick Start

**For practitioners** (use the tool):
```bash
git clone <github-url>/iacsec
cd iacsec && pip install -e .
python -m iacsec.models.fetch codet5p-220m
iacsec --path ./repo --tech auto --format sarif
```

**For researchers** (explore methodology):
```bash
git clone <github-url>/LLM-IaC-SecEval-Experiments
cd LLM-IaC-SecEval-Experiments
# See experiments/ for notebooks
```

**For model developers** (train models):
```bash
git clone <github-url>/LLM-IaC-SecEval-Models
cd LLM-IaC-SecEval-Models
# See scripts/ for training pipeline
```

## Documentation

- [Links](links.md) - Deep links to sub-repos and resources
- Research roadmap: `LLM-IaC-SecEval-Experiments/docs/`
- User guide: `iacsec/docs/USER_HANDBOOK.md`
- Architecture: `iacsec/docs/DEVELOPMENT_REPORT.md`

## Releases

All repositories use synchronized tags:
- `v1.0-paper` - Camera-ready artifact
- `v1.1-extended` - Extended experiments (if applicable)

## License

Research code: Apache 2.0 (see individual repo licenses)

## Citation

```bibtex
placeholder
```
