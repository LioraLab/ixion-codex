# ECC 에이전트 적용 맵 (Ixion)

목표: everything-claude-code(ECC)의 `agents/*.md`를 Codex(ixion)에서 재사용 가능한 “에이전트형 스킬(Agent-as-Skill)”로 적용한다.

## 기본 전략: Agent-as-Skill (옵트인)
- Codex에는 Claude Code처럼 “고정된 agent 타입”이 없으므로, ixion에서는 **스킬 이름에 `agent`를 붙여** 역할 엔트리포인트를 만든다.
- 에이전트형 엔트리포인트는 **옵트인**이다:
  - 사용자가 “에이전트로/agent mode/agent로”를 명시했거나
  - `$ixion-agent-*`를 직접 호출하는 경우에만 사용한다.

## ECC agents -> Ixion agent skills (2026-02-14)

| ECC agent | Ixion agent skill | 비고 |
|---|---|---|
| architect | `ixion-agent-architect` | 기존(OMC) 역할에 ECC SSOT 추가 |
| build-error-resolver | `ixion-agent-build-fixer` | 기존(OMC) 역할에 ECC SSOT 추가(주로 TS 빌드/타입) |
| code-reviewer | `ixion-agent-code-reviewer` | 기존(OMC) 역할에 ECC SSOT 추가 |
| security-reviewer | `ixion-agent-security-reviewer` | 기존(OMC) 역할에 ECC SSOT 추가 |
| planner | `ixion-agent-planner` | 기존(OMC) 역할에 ECC SSOT 추가 |
| database-reviewer | `ixion-agent-database-reviewer` | 신규 |
| doc-updater | `ixion-agent-doc-updater` | 신규 |
| e2e-runner | `ixion-agent-e2e-runner` | 신규 |
| refactor-cleaner | `ixion-agent-refactor-cleaner` | 신규 |
| go-build-resolver | `ixion-agent-go-build-resolver` | 신규 |
| go-reviewer | `ixion-agent-go-reviewer` | 신규 |
| python-reviewer | `ixion-agent-python-reviewer` | 신규 |
| tdd-guide | `ixion-agent-tdd-guide` | 신규 |

## SSOT 경로
- ECC agent SSOT: `.codex/.ixion/plugins/everything-claude-code/agents/*.md`
- 매핑/운영 규칙: `.codex/.ixion/PLUGINS.md`
