# Deep Links

Quick navigation to specific resources across all repositories.

## Repository Links

### LLM-IaC-SecEval-Experiments (Methodology Exploration)
- **Main**: `../LLM-IaC-SecEval-Experiments`
- **Issues**: (will be GitHub URL after push)
- **Releases**: (will be GitHub URL after push)
- **Key locations**:
  - Oracle datasets: `data/oracle-dataset-*/`
  - Pseudo-labeled datasets: `data/iac_filter_training/datasets/`
  - Pure LLM evaluation: `experiments/llm_pure/`
  - Post-filter evaluation: `experiments/llm_postfilter/`
  - Results: `results/`

### LLM-IaC-SecEval-Models (Training Pipeline)
- **Main**: `../LLM-IaC-SecEval-Models`
- **Issues**: (will be GitHub URL after push)
- **Releases**: (will be GitHub URL after push)
- **Key locations**:
  - Training configs: `configs/encoder/`
  - Evaluation configs: `configs/eval/`
  - Champion configs: `configs/champion/`
  - Training scripts: `scripts/batch_train_models.py`
  - Results analysis: `local/evaluation/`
  - Model checkpoints: `models/` (not synced to git)

### iacsec (Toolkit)
- **Main**: `../iacsec`
- **Issues**: (will be GitHub URL after push)
- **Releases**: (will be GitHub URL after push)
- **Key locations**:
  - CLI entrypoint: `apps/cli/`
  - Core packages: `packages/`
  - Model registry: `models/registry.yaml`
  - Documentation: `docs/`
  - Tests: `tests/`
  - Examples: `examples/sample_repo/`

## Documentation

### User Guides
- **Toolkit User Handbook**: `../iacsec/docs/USER_HANDBOOK.md`
- **Toolkit Development**: `../iacsec/docs/DEVELOPMENT_REPORT.md`
- **Research Roadmap**: `../iacsec/docs/ROADMAP.md`

### Technical References
- **Data Schema**: `../iacsec/docs/SCHEMA.md`
- **Model Training**: `../LLM-IaC-SecEval-Models/README.md`
- **Experiments Overview**: `../LLM-IaC-SecEval-Experiments/README.md`

## Paper Materials

- **Pre-print**: `paper/preprint.pdf`
- **Camera-ready**: `paper/camera-ready.pdf`
- **Supplementary Materials**: `paper/supplementary/`
- **Citation BibTeX**: `paper/citation.bib`
- **Figures**: `paper/figures/`
- **Tables**: `paper/tables/`

## Artifact Reproducibility

- **Release Manifest**: `artifact/release-manifest.yaml`
- **Pinning Helper**: `artifact/pin-shas.sh`
- **Checkout Script**: `artifact/checkout-pinned.sh`
- **Reproduction Pipeline**: `artifact/reproduce-paper-results.sh`

## External Resources

### Models
- **Hugging Face Models**: (will add after model upload)
- **Model Cards**: `../LLM-IaC-SecEval-Models/models/`

### Related Tools
- **GLITCH**: [placeholder]
- **Original Paper**: (reference to GLITCH paper)

### Datasets
- **Oracle Datasets**: `../LLM-IaC-SecEval-Experiments/data/oracle-dataset-*/`
- **Training Datasets**: `../LLM-IaC-SecEval-Experiments/data/iac_filter_training/datasets/`

