#!/usr/bin/env bash
set -euo pipefail

IXION_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PLUGINS_DIR="$IXION_DIR/plugins"

BKIT_DIR="$PLUGINS_DIR/bkit"
TEMPLATES_DIR="$IXION_DIR/templates"
DOCS_DIR="$IXION_DIR/docs"

if [[ ! -d "$BKIT_DIR/templates" ]]; then
  echo "[sync] ERROR: bkit templates not found: $BKIT_DIR/templates" >&2
  exit 1
fi

# Ensure expected directories exist (idempotent).
mkdir -p "$TEMPLATES_DIR/pipeline" "$TEMPLATES_DIR/shared"
mkdir -p "$DOCS_DIR/01-plan/features" "$DOCS_DIR/02-design/features" "$DOCS_DIR/02-design/mockup" "$DOCS_DIR/02-design/api"
mkdir -p "$DOCS_DIR/03-analysis" "$DOCS_DIR/04-report" "$DOCS_DIR/decisions"

# Sync bkit templates -> ixion templates (derived copy).
cp -f "$BKIT_DIR/templates/"*.template.md "$TEMPLATES_DIR/"
cp -f "$BKIT_DIR/templates/_INDEX.template.md" "$TEMPLATES_DIR/"
cp -f "$BKIT_DIR/templates/TEMPLATE-GUIDE.md" "$TEMPLATES_DIR/"
cp -f "$BKIT_DIR/templates/pipeline/"*.template.md "$TEMPLATES_DIR/pipeline/"
cp -f "$BKIT_DIR/templates/shared/"*.md "$TEMPLATES_DIR/shared/"

# Write plugin versions snapshot (best-effort).
VERSIONS_FILE="$IXION_DIR/PLUGIN-VERSIONS.md"
GENERATED_AT="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

plugin_row() {
  local name="$1"
  local dir="$2"
  local path_for_display="$3"
  local origin rev desc
  origin="$(git -C "$dir" remote get-url origin 2>/dev/null || echo "-")"
  rev="$(git -C "$dir" rev-parse --short HEAD 2>/dev/null || echo "-")"
  desc="$(git -C "$dir" describe --tags --always --dirty 2>/dev/null || echo "-")"
  printf '| %s | `%s` | `%s` | `%s` | `%s` |\n' "$name" "$path_for_display" "$origin" "$rev" "$desc"
}

{
  echo "# Plugin Versions"
  echo
  echo "Generated: \`$GENERATED_AT\`"
  echo
  echo "| Plugin | Path | Origin | Rev | Describe |"
  echo "|---|---|---|---|---|"
  plugin_row "bkit" "$PLUGINS_DIR/bkit" ".codex/.ixion/plugins/bkit"
  plugin_row "oh-my-claudecode" "$PLUGINS_DIR/oh-my-claudecode" ".codex/.ixion/plugins/oh-my-claudecode"
  plugin_row "everything-claude-code" "$PLUGINS_DIR/everything-claude-code" ".codex/.ixion/plugins/everything-claude-code"
} > "$VERSIONS_FILE"

echo "[sync] OK: templates synced + versions written to $VERSIONS_FILE"
