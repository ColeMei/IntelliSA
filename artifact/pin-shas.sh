#!/usr/bin/env bash
# Pin commit SHAs from all three repos into release-manifest.yaml
# Run this when you're ready to freeze versions for paper submission

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MANIFEST="$SCRIPT_DIR/release-manifest.yaml"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"

echo "🔍 Pinning SHAs from local repositories..."
echo "ℹ️  Note: Local dirs have numeric prefixes (01., 02., etc), GitHub repos don't"

# Define repos: key -> local directory path (with prefix)
declare -A repos=(
  [experiments]="01.LLM-IaC-SecEval-Experiments"
  [models]="02.LLM-IaC-SecEval-Models"
  [iacsec]="03.LLM-IaC-SecEval-Toolkit"
)

for key in "${!repos[@]}"; do
  repo_path="$ROOT_DIR/${repos[$key]}"
  
  if [[ ! -d "$repo_path/.git" ]]; then
    echo "⚠️  Warning: $repo_path is not a git repository, skipping"
    continue
  fi
  
  # Get current commit SHA
  sha=$(git -C "$repo_path" rev-parse HEAD)
  branch=$(git -C "$repo_path" rev-parse --abbrev-ref HEAD)
  
  echo "  ✓ $key: $sha (branch: $branch)"
  
  # Update manifest (macOS-compatible sed)
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' -E "/^\s*${key}:/,/^\s*commit:/ s|(^\s*commit: ).*|\1$sha|" "$MANIFEST"
    sed -i '' -E "/^\s*${key}:/,/^\s*branch:/ s|(^\s*branch: ).*|\1$branch|" "$MANIFEST"
  else
    sed -i -E "/^\s*${key}:/,/^\s*commit:/ s|(^\s*commit: ).*|\1$sha|" "$MANIFEST"
    sed -i -E "/^\s*${key}:/,/^\s*branch:/ s|(^\s*branch: ).*|\1$branch|" "$MANIFEST"
  fi
done

# Update generation timestamp
timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' "s|generated_utc: .*|generated_utc: $timestamp|" "$MANIFEST"
else
  sed -i "s|generated_utc: .*|generated_utc: $timestamp|" "$MANIFEST"
fi

echo "✅ Pinned SHAs written to: $MANIFEST"
echo "📋 Review the manifest before committing:"
echo "   cat $MANIFEST"
