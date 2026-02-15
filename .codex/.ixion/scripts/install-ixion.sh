#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
ixion installer (project bootstrap)

Usage:
  bash .codex/.ixion/scripts/install-ixion.sh [TARGET_DIR] [options]

Options:
  --mode copy|symlink        Install skills by copying (default) or symlinking each skill directory.
  --plugins none|copy        Install plugins (default: none). "copy" vendors plugins into target.
  --force                    Merge/overwrite matching managed entries in target:
                            - .codex/skills: only same-name skill directories or links are replaced
                            - .codex/.ixion/{scripts,templates,archives,README/SKILL-MAP/PLUGINS}: only same-name items are replaced
  --include-decisions        Copy ixion-codex's .codex/.ixion/decisions.md into target (default: create a minimal file if missing).
  --dry-run                  Print actions without changing files.
  -h, --help                 Show this help.

Notes:
  - This script is intended to be run from the ixion-codex repo (source of truth).
  - It installs:
    - TARGET/.codex/skills/*  (skills)
    - TARGET/.codex/.ixion/*  (runtime docs/scripts/templates)
  - Project-specific outputs should live under TARGET/.codex/.ixion/docs and TARGET/.codex/.ixion/state.
EOF
}

log() { printf '%s\n' "$*"; }
die() { printf 'ERROR: %s\n' "$*" >&2; exit 1; }

DRY_RUN=0
FORCE=0
INCLUDE_DECISIONS=0
MODE="copy"
PLUGINS="none"
TARGET_DIR="."

while [[ $# -gt 0 ]]; do
  case "$1" in
    --mode)
      MODE="${2:-}"; shift 2;;
    --plugins)
      PLUGINS="${2:-}"; shift 2;;
    --force)
      FORCE=1; shift;;
    --include-decisions)
      INCLUDE_DECISIONS=1; shift;;
    --dry-run)
      DRY_RUN=1; shift;;
    -h|--help)
      usage; exit 0;;
    -*)
      die "unknown option: $1";;
    *)
      TARGET_DIR="$1"; shift;;
  esac
done

case "$MODE" in
  copy|symlink) ;;
  *) die "--mode must be 'copy' or 'symlink' (got: $MODE)";;
esac

case "$PLUGINS" in
  none|copy) ;;
  *) die "--plugins must be 'none' or 'copy' (got: $PLUGINS)";;
esac

# Source repo root: this script lives at .codex/.ixion/scripts/install-ixion.sh
SOURCE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
SOURCE_CODEX="$SOURCE_ROOT/.codex"
SOURCE_SKILLS="$SOURCE_CODEX/skills"
SOURCE_IXION="$SOURCE_CODEX/.ixion"

[[ -d "$SOURCE_SKILLS" ]] || die "source skills not found: $SOURCE_SKILLS"
[[ -d "$SOURCE_IXION" ]] || die "source ixion not found: $SOURCE_IXION"

TARGET_DIR="$(cd "$TARGET_DIR" 2>/dev/null && pwd || true)"
[[ -n "${TARGET_DIR:-}" ]] || die "target dir not found"

TARGET_CODEX="$TARGET_DIR/.codex"
TARGET_SKILLS="$TARGET_CODEX/skills"
TARGET_IXION="$TARGET_CODEX/.ixion"

run() {
  if [[ "$DRY_RUN" -eq 1 ]]; then
    log "[dry-run] $*"
    return 0
  fi
  "$@"
}

ensure_dir() { run mkdir -p "$1"; }

remove_path() {
  local path="$1"
  if [[ -e "$path" || -L "$path" ]]; then
    run rm -rf "$path"
  fi
}

copy_file() {
  local src="$1" dst="$2"
  [[ -f "$src" ]] || die "missing file: $src"
  ensure_dir "$(dirname "$dst")"
  run cp -f "$src" "$dst"
}

copy_dir() {
  local src="$1" dst="$2"
  [[ -d "$src" ]] || die "missing dir: $src"
  ensure_dir "$(dirname "$dst")"
  remove_path "$dst"
  run cp -a "$src" "$dst"
}

copy_dir_merge() {
  local src="$1" dst="$2"
  [[ -d "$src" ]] || die "missing dir: $src"
  ensure_dir "$dst"
  while IFS= read -r -d '' item; do
    local base src_item dst_item
    base="$(basename "$item")"
    src_item="$src/$base"
    dst_item="$dst/$base"
    if [[ -e "$dst_item" || -L "$dst_item" ]]; then
      if [[ "$FORCE" -eq 1 ]]; then
        remove_path "$dst_item"
      fi
    fi
    if [[ -d "$src_item" ]]; then
      ensure_dir "$dst_item"
      run cp -a "$src_item/." "$dst_item/"
    else
      run cp -a "$src_item" "$dst_item"
    fi
  done < <(cd "$src" && find . -mindepth 1 -maxdepth 1 -print0)
}

sync_skills() {
  local mode="$1"
  local action="copy"
  if [[ "$mode" == "symlink" ]]; then
    action="symlink"
  fi
  for d in "$SOURCE_SKILLS"/*; do
    [[ -d "$d" ]] || continue
    local name target
    name="$(basename "$d")"
    target="$TARGET_SKILLS/$name"
    if [[ -e "$target" || -L "$target" ]]; then
      if [[ "$FORCE" -eq 0 ]]; then
        die "target skill already exists: $target (use --force to overwrite)"
      fi
      remove_path "$target"
    fi
    if [[ "$action" == "symlink" ]]; then
      run ln -s "$d" "$target"
    else
      run cp -a "$d" "$target"
    fi
  done
}

write_minimal_decisions() {
  local path="$1"
  if [[ -f "$path" ]]; then
    return 0
  fi
  ensure_dir "$(dirname "$path")"
  if [[ "$DRY_RUN" -eq 1 ]]; then
    log "[dry-run] create $path"
    return 0
  fi
  cat >"$path" <<'EOF'
# decisions.md

이 파일은 "프로젝트별" 결정/합의 기록을 남기기 위한 로그다.

권장:
- Ixion 자체(스킬/플러그인/구조) 변화는 NotebookLM `ixion-codex` 노트북에 축적
- 프로젝트 요구사항/스펙/트레이드오프는 여기(또는 `.codex/.ixion/docs/`)에 기록
EOF
}

log "[ixion-install] source: $SOURCE_ROOT"
log "[ixion-install] target: $TARGET_DIR"
log "[ixion-install] mode: $MODE, plugins: $PLUGINS, force: $FORCE, dry-run: $DRY_RUN"

ensure_dir "$TARGET_CODEX"
ensure_dir "$TARGET_IXION"

# 1) Install skills
if [[ -e "$TARGET_SKILLS" || -L "$TARGET_SKILLS" ]]; then
  if [[ "$FORCE" -eq 1 ]]; then
    ensure_dir "$TARGET_SKILLS"
  else
    die "target skills already exist: $TARGET_SKILLS (use --force to merge and overwrite matching skill names)"
  fi
else
  ensure_dir "$TARGET_SKILLS"
fi

if [[ "$MODE" == "copy" ]]; then
  log "[ixion-install] copy matching skills -> $TARGET_SKILLS"
  sync_skills "copy"
else
  log "[ixion-install] symlink skills -> $TARGET_SKILLS"
  sync_skills "symlink"
fi

# 2) Install ixion runtime assets (avoid copying project outputs)
ensure_dir "$TARGET_IXION/scripts"
ensure_dir "$TARGET_IXION/templates"
ensure_dir "$TARGET_IXION/archives"
ensure_dir "$TARGET_IXION/docs"
ensure_dir "$TARGET_IXION/state"

copy_dir_merge "$SOURCE_IXION/scripts" "$TARGET_IXION/scripts"
copy_dir_merge "$SOURCE_IXION/templates" "$TARGET_IXION/templates"
copy_dir_merge "$SOURCE_IXION/archives" "$TARGET_IXION/archives"
copy_file "$SOURCE_IXION/README.md" "$TARGET_IXION/README.md"
copy_file "$SOURCE_IXION/SKILL-MAP.md" "$TARGET_IXION/SKILL-MAP.md"
copy_file "$SOURCE_IXION/PLUGINS.md" "$TARGET_IXION/PLUGINS.md"

if [[ "$INCLUDE_DECISIONS" -eq 1 ]]; then
  if [[ "$FORCE" -eq 1 ]]; then
    remove_path "$TARGET_IXION/decisions.md"
  fi
  copy_file "$SOURCE_IXION/decisions.md" "$TARGET_IXION/decisions.md"
else
  write_minimal_decisions "$TARGET_IXION/decisions.md"
fi

# Create docs skeleton (idempotent, do not overwrite user content)
ensure_dir "$TARGET_IXION/docs/01-plan/features"
ensure_dir "$TARGET_IXION/docs/02-design/features"
ensure_dir "$TARGET_IXION/docs/02-design/mockup"
ensure_dir "$TARGET_IXION/docs/02-design/api"
ensure_dir "$TARGET_IXION/docs/03-analysis"
ensure_dir "$TARGET_IXION/docs/04-report"
ensure_dir "$TARGET_IXION/docs/decisions"

# 3) Plugins (optional)
if [[ "$PLUGINS" == "copy" ]]; then
  if [[ -e "$TARGET_IXION/plugins" || -L "$TARGET_IXION/plugins" ]]; then
    if [[ "$FORCE" -eq 1 ]]; then
      copy_dir_merge "$SOURCE_IXION/plugins" "$TARGET_IXION/plugins"
    else
      die "target plugins already exist: $TARGET_IXION/plugins (use --force to overwrite)"
    fi
  else
    copy_dir_merge "$SOURCE_IXION/plugins" "$TARGET_IXION/plugins"
  fi

  # Best-effort sync to ensure templates match plugin snapshot (requires bkit present).
  if [[ "$DRY_RUN" -eq 1 ]]; then
    log "[dry-run] bash \"$TARGET_IXION/scripts/sync-from-plugins.sh\""
  else
    (cd "$TARGET_DIR" && bash "$TARGET_IXION/scripts/sync-from-plugins.sh") || true
  fi
else
  log "[ixion-install] plugins skipped (--plugins none)"
fi

log "[ixion-install] OK"
