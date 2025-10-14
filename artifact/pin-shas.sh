#!/usr/bin/env bash
# Records git versions from GitHub (remote), not local uncommitted work

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MANIFEST="$SCRIPT_DIR/release-manifest.yaml"
ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

echo "Recording git versions from GitHub remotes..."
echo ""

# Fetch latest from remotes (doesn't change local files)
echo "Fetching latest from GitHub..."
git -C "$ROOT/01.IntelliSA-Experiments" fetch origin main 2>/dev/null
git -C "$ROOT/02.IntelliSA-Models" fetch origin main 2>/dev/null
git -C "$ROOT/03.iacsec" fetch origin main 2>/dev/null
echo ""

# Get commit SHAs from remote branches (what's on GitHub)
EXPERIMENTS_SHA=$(git -C "$ROOT/01.IntelliSA-Experiments" rev-parse origin/main 2>/dev/null || echo "not-found")
MODELS_SHA=$(git -C "$ROOT/02.IntelliSA-Models" rev-parse origin/main 2>/dev/null || echo "not-found")
IACSEC_SHA=$(git -C "$ROOT/03.iacsec" rev-parse origin/main 2>/dev/null || echo "not-found")
TIMESTAMP=$(date -u +"%Y-%m-%d")

echo "Remote (GitHub) versions:"
echo "  Experiments: $EXPERIMENTS_SHA"
echo "  Models:      $MODELS_SHA"
echo "  iacsec:      $IACSEC_SHA"
echo "  Date:        $TIMESTAMP"
echo ""

# Check if local has unpushed commits
echo "Checking for unpushed local changes..."
for repo in "01.IntelliSA-Experiments" "02.IntelliSA-Models" "03.iacsec"; do
  cd "$ROOT/$repo"
  LOCAL=$(git rev-parse HEAD 2>/dev/null)
  REMOTE=$(git rev-parse origin/main 2>/dev/null)
  if [ "$LOCAL" != "$REMOTE" ]; then
    echo "  ⚠️  $repo: Local differs from GitHub (unpushed commits?)"
  fi
done
echo ""

# Write new manifest with filled values
cat > "$MANIFEST" << EOF
# IntelliSA Paper Artifact - Version Record
# Records exact versions used to generate paper results

paper_title: "IntelliSA: An Intelligent Analyzer for IaC Security Smell Detection via Rule and Neural Inference"
paper_tag: v1.0-paper
generated_date: $TIMESTAMP

# Repository versions (recorded from GitHub remotes)
repositories:
  experiments:
    github: https://github.com/ColeMei/IntelliSA-Experiments
    commit: $EXPERIMENTS_SHA
  
  models:
    github: https://github.com/ColeMei/IntelliSA-Models
    commit: $MODELS_SHA
  
  iacsec:
    github: https://github.com/ColeMei/iacsec
    commit: $IACSEC_SHA

# Model used
model:
  name: codet5p-220m
  threshold: 0.61
  huggingface: https://huggingface.co/colemei/IntelliSA-220m

# Dataset sizes
datasets:
  train: 1840
  validation: 230
  test: 230
  technologies: [ansible, chef, puppet]
EOF

echo "Updated: $MANIFEST"
echo "These are the versions currently on GitHub."
