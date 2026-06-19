#!/usr/bin/env bash
#
# package-plugin.sh — build a self-contained plugin zip you can upload to Claude
# Desktop (Customize → Plugins → + → upload a custom plugin file) or hand to someone.
#
# The skills already carry committed copies of the canon they need (see scripts/sync-skills.sh),
# so they work installed from a git marketplace — on Claude Code and the sandboxed Claude Desktop
# alike. This script just refreshes those copies and zips the result for the upload-a-file path.
#
# Output: dist/eidos-plugin.zip
#
set -euo pipefail
cd "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

out="dist/eidos-plugin.zip"

echo "1/2  refreshing the skills' committed copies of the canon…"
./scripts/sync-skills.sh

echo "2/2  zipping → $out …"
mkdir -p dist
rm -f "$out"
zip -rqX "$out" . \
  -x '.git/*' '.git' \
     '.claude/*' \
     '.obsidian/*' \
     'dist/*' \
     '*.DS_Store' '*/.DS_Store'

size=$(du -h "$out" | cut -f1 | tr -d '[:space:]')
echo
echo "✓ built $out ($size)"
echo "  • Claude Desktop: Customize → Plugins → +  →  upload a custom plugin file  →  pick $out"
echo "  • Claude Code:    claude --plugin-dir $out"
