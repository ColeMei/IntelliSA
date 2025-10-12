# LLM-IaC-SecEval

> **Research Hub** — Reducing False Positives in IaC Security Analysis with LLMs

This is the main entry point for our research project that investigates how Large Language Models can reduce false positives from static analysis tools in Infrastructure-as-Code (IaC) security scanning.

> **Note**: Local directory names use numeric prefixes (`00.`, `01.`, etc.) for sorting convenience. GitHub repository names omit these prefixes.

## 🎯 Project Overview

**Problem**: Static analysis tools generate high false positive rates, causing alert fatigue that prevents widespread adoption of security scanning.

**Solution**: Use LLM-based post-filtering to distinguish true security vulnerabilities from false alarms while maintaining high recall.

**Result**: Significant precision improvements across 4 security smell categories (hardcoded secrets, suspicious comments, weak cryptography, insecure HTTP) in Ansible, Chef, and Puppet IaC technologies.

## 📦 Project Repositories

Our research is organized across three specialized repositories:

### 1. [LLM-IaC-SecEval-Experiments](../LLM-IaC-SecEval-Experiments)
**Early-stage methodology exploration and evaluation**

- Comparative evaluation of pure LLM vs post-filter approaches
- Oracle datasets and ground truth annotations
- Pseudo-labeled dataset generation (Claude, GPT, Grok)
- Experimental results and analysis notebooks

**Use this repo if**: You want to understand our methodology selection process or replicate the initial experiments.

### 2. [LLM-IaC-SecEval-Models](../LLM-IaC-SecEval-Models)
**4-stage systematic training pipeline for encoder models**

- Stage 1: Broad candidate selection (CodeBERT, CodeT5, CodeT5+)
- Stage 2: Focused hyperparameter tuning
- Stage 3: Final optimization with threshold sweep
- Stage 4: Multi-seed stability testing

**Use this repo if**: You want to train encoder models or reproduce our model selection process.

### 3. [iacsec](../03.LLM-IaC-SecEval-Toolkit) (Toolkit)
**Production-ready CLI tool: GLITCH + [TOOLNAME]**

- Combines GLITCH static analysis with encoder-based LLM post-filter
- Supports Ansible, Chef, Puppet
- Outputs SARIF (GitHub Code Scanning), JSONL, CSV
- Ready for CI/CD integration

**Use this repo if**: You want to scan IaC repositories or integrate the tool into your security pipeline.

## 📄 Paper Materials

- **Pre-print**: `paper/preprint.pdf` (coming soon)
- **Camera-ready**: `paper/camera-ready.pdf` (after acceptance)
- **Supplementary**: `paper/supplementary/`
- **Citation**: `paper/citation.bib`

## 🔬 Artifact Reproducibility

See `artifact/release-manifest.yaml` for:
- Pinned commit SHAs used to generate paper results
- Model versions and decision thresholds
- Dataset versions and splits
- Tool versions (GLITCH, dependencies)

To reproduce paper results:
```bash
# Check out pinned versions from manifest
./artifact/checkout-pinned.sh

# Run reproduction pipeline
./artifact/reproduce-paper-results.sh
```

## 🚀 Quick Start

### For Practitioners (Use the Tool)
```bash
git clone <your-github>/iacsec
cd iacsec
python -m venv .venv && source .venv/bin/activate
pip install -e .
python -m iacsec.models.fetch codet5p-220m
iacsec --path ./examples/sample_repo --tech auto --format sarif
```

### For Researchers (Explore Methodology)
```bash
git clone <your-github>/LLM-IaC-SecEval-Experiments
cd LLM-IaC-SecEval-Experiments
# See experiments/ for Jupyter notebooks
```

### For Model Developers (Train Models)
```bash
git clone <your-github>/LLM-IaC-SecEval-Models
cd LLM-IaC-SecEval-Models
# See scripts/ for training pipeline
```

## 📊 Key Results

**Precision Improvement** (Post-filter vs Pure GLITCH):
- Hardcoded Secrets: +XX% precision
- Suspicious Comments: +XX% precision  
- Weak Cryptography: +XX% precision
- Insecure HTTP: +XX% precision

**Recall Maintenance**: 9X% average recall preserved across all categories

See `paper/` for detailed results and statistical analysis.

## 📚 Documentation

- **[Links](links.md)**: Deep links to sub-repos, issues, releases
- **Research Roadmap**: See [LLM-IaC-SecEval-Experiments/docs](../LLM-IaC-SecEval-Experiments/docs)
- **User Guide**: See [iacsec/docs/USER_HANDBOOK.md](../03.LLM-IaC-SecEval-Toolkit/docs/USER_HANDBOOK.md)
- **Architecture**: See [iacsec/docs/DEVELOPMENT_REPORT.md](../03.LLM-IaC-SecEval-Toolkit/docs/DEVELOPMENT_REPORT.md)

## 🏷️ Releases & Tags

All repos use synchronized tags for paper releases:
- `v1.0-paper` - Camera-ready artifact (pinned in manifest)
- `v1.1-extended` - Extended experiments (if applicable)

## 📧 Contact

- **Lead Researcher**: [Your Name]
- **Institution**: University of Melbourne
- **Questions**: Open an issue in the relevant repository

## 📜 License

- **Research code**: Apache 2.0 (see individual repo licenses)
- **GLITCH**: Original license retained in toolkit `packages/glitch_core/`

## 🎓 Citation

If you use this work, please cite:

```bibtex
@article{llm-iac-seceval-2024,
  title={Reducing False Positives in IaC Security Analysis with Large Language Models},
  author={Your Name et al.},
  journal={Conference/Journal Name},
  year={2024}
}
```

---

**Project Status**: 📝 Paper submission in progress  
**Last Updated**: October 2024
