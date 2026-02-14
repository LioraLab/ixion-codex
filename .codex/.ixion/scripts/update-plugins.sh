#!/usr/bin/env bash
set -euo pipefail

IXION_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PLUGINS_DIR="$IXION_DIR/plugins"

update_one() {
  local name="$1"
  local dir="$2"

  if [[ ! -d "$dir" ]]; then
    echo "[update] SKIP: missing $name ($dir)"
    return 0
  fi
  if [[ ! -d "$dir/.git" ]]; then
    echo "[update] SKIP: not a git repo $name ($dir)"
    return 0
  fi

  echo "[update] pulling $name ..."
  git -C "$dir" pull --rebase
}

update_one "bkit" "$PLUGINS_DIR/bkit"
update_one "oh-my-claudecode" "$PLUGINS_DIR/oh-my-claudecode"
update_one "everything-claude-code" "$PLUGINS_DIR/everything-claude-code"

bash "$IXION_DIR/scripts/sync-from-plugins.sh"

