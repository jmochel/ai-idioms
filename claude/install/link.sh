#!/usr/bin/env bash
set -euo pipefail

AI_IDIOMS="${AI_IDIOMS:-$HOME/ai-idioms}"
SRC="$AI_IDIOMS/cursor/project"
DST=".cursor"

mkdir -p "$DST/rules" "$DST/rules.local"

# link shared rules (skip if a local override exists)
for f in "$SRC/rules/"*.md; do
  base="$(basename "$f")"
  if [[ ! -e "$DST/rules.local/$base" && ! -e "$DST/rules/$base" ]]; then
    ln -s "$f" "$DST/rules/$base"
  fi
done

# merge MCP configs: mcp.base.json ⊕ project.mcp.overlay.json -> mcp.json
BASE="$SRC/mcp.base.json"
OVER="$DST/project.mcp.overlay.json"
OUT="$DST/mcp.json"

if command -v jq >/dev/null 2>&1; then
  if [[ -f "$OVER" ]]; then
    jq -s 'reduce .[] as $it ({}; . * $it)' "$BASE" "$OVER" > "$OUT"
  else
    cp "$BASE" "$OUT"
  fi
else
  echo "jq is required to merge MCP configs. Install jq and re-run." >&2
  exit 1
fi

echo "✓ Cursor project links and MCP merged."
