---
name: ixion-deepinit
description: 코드베이스 전반에 계층형 AGENTS.md 문서를 생성/갱신해, 에이전트가 빠르게 맥락을 잡게 만든다.
metadata:
  short-description: Generate hierarchical AGENTS.md docs
---

# Ixion Deep Init (AGENTS.md)

## 목표
- 코드베이스 전반에 **계층형 AGENTS.md**를 생성/갱신한다.
- 각 디렉토리의 목적/핵심 파일/테스트 방법을 문서화해 “탐색 비용”을 낮춘다.
- 자동 생성 영역과 수동 메모 영역을 분리해, 재생성해도 사람이 적어둔 노트가 보존되게 한다.

## 원문 참고(SSOT)
- OMC deepinit: `.codex/.ixion/plugins/oh-my-claudecode/skills/deepinit/SKILL.md`

## 언제 쓰나
- 새 프로젝트/레포를 처음 열었을 때
- 디렉토리 구조가 커졌고, 어디에 뭐가 있는지 자주 헤맬 때
- 멀티 에이전트가 “어디를 읽어야 하는지”를 자주 놓칠 때
- 온보딩 문서가 없거나 낡았을 때

## 핵심 규칙
- (계층) 루트 `AGENTS.md`부터 만들고, 그 다음 하위 디렉토리로 내려간다(부모 → 자식).
- (부모 태그) 루트가 아닌 모든 `AGENTS.md`는 부모 참조를 포함한다:
  - `<!-- Parent: ../AGENTS.md -->` (상대 경로)
- (보존) `<!-- MANUAL -->` 아래는 재생성 시에도 보존한다.
- (스킵) 빈 디렉토리(파일/하위 폴더 없음)는 생성하지 않는다.
- (가드레일) 대량 파일 생성이 될 수 있으므로, 기본은 “루트 + 주요 디렉토리(1-3개)”부터 시작한다.
  - 전체 레포 생성이 필요하면, 생성 대상/제외 패턴/예상 생성 개수(대략)를 먼저 말하고 진행한다.
- (제외) 기본 제외: `node_modules`, `.git`, `dist`, `build`, `coverage`, `.next`, `.nuxt`, `.venv`, `__pycache__`
  - 권장 추가 제외(벤더/파생): `.codex/.ixion/plugins`, `.codex/.ixion/templates`

## AGENTS.md 템플릿(권장)

```markdown
<!-- Parent: {relative_path_to_parent}/AGENTS.md -->
<!-- Generated: {timestamp} | Updated: {timestamp} -->

# {Directory Name}

## Purpose
{이 디렉토리가 무엇을 하는지 1문단}

## Key Files
| File | Description |
|---|---|
| `file.ext` | 한 줄 설명 |

## Subdirectories
| Directory | Purpose |
|---|---|
| `subdir/` | 한 줄 설명 (see `subdir/AGENTS.md`) |

## For AI Agents

### Working In This Directory
- {수정 시 주의사항}

### Testing Requirements
- {최소 검증 커맨드 1-2개}

### Common Patterns
- {자주 쓰는 패턴/컨벤션}

## Dependencies
### Internal
- {내부 의존}

### External
- {외부 패키지/툴}

<!-- MANUAL: 아래는 사람이 추가한 메모. 재생성 시 보존 -->
```

## 워크플로우(추천)
1. 디렉토리 맵핑
   - 제외 패턴을 적용해 디렉토리 트리를 만든다.
2. 레벨별 생성 계획 수립
   - Level 0(루트) → Level 1 → Level 2… 순서로 진행한다.
3. 생성/갱신
   - 디렉토리의 파일을 읽어 목적/테스트/패턴을 요약한다.
   - 기존 `AGENTS.md`가 있으면 `<!-- MANUAL -->` 아래를 보존하며 갱신한다.
4. 검증(필수)
   - 모든 `<!-- Parent: -->` 경로가 실제로 존재하는지 확인한다.
   - orphan `AGENTS.md`가 없는지 확인한다.

## 검증 커맨드(예시)

```bash
find . -name "AGENTS.md" -type f | sort
rg -n "<!-- Parent:" --glob "AGENTS.md" .
```
