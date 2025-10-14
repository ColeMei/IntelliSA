#!/usr/bin/env bash
# Simple script to record current git versions of all repos

MANIFEST="$(dirname "$0")/release-manifest.yaml"
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

echo "Recording git versions for paper submission..."

# Get commit SHAs from each repo
EXPERIMENTS_SHA=$(git -C "$ROOT/01.IntelliSA-Experiments" rev-parse HEAD 2>/dev/null || echo "not-found")
MODELS_SHA=$(git -C "$ROOT/02.IntelliSA-Models" rev-parse HEAD 2>/dev/null || echo "not-found")
IACSEC_SHA=$(git -C "$ROOT/03.iacsec" rev-parse HEAD 2>/dev/null || echo "not-found")
TIMESTAMP=$(date -u +"%Y-%m-%d")

echo "  Experiments: $EXPERIMENTS_SHA"
echo "  Models:      $MODELS_SHA"
echo "  iacsec:      $IACSEC_SHA"
echo "  Date:        $TIMESTAMP"

# Update manifest file
sed -i.bak "s|commit: <auto-filled>|commit: PLACEHOLDER|g" "$MANIFEST"
sed -i.bak "0,/commit: PLACEHOLDER/s//$EXPERIMENTS_SHA/" "$MANIFEST"
sed -i.bak "0,/commit: PLACEHOLDER/s//$MODELS_SHA/" "$MANIFEST"
sed -i.bak "0,/commit: PLACEHOLDER/s//$IACSEC_SHA/" "$MANIFEST"
sed -i.bak "s|generated_date: <auto-filled by pin-shas.sh>|generated_date: $TIMESTAMP|" "$MANIFEST"
rm "$MANIFEST.bak" 2>/dev/null

echo ""
echo "Updated: $MANIFEST"
echo "Review the file to confirm versions are correct."
