# OMC 에이전트 적용 맵 (Ixion)

목표: oh-my-claudecode(OMC)의 agent 프롬프트를 Codex(ixion)에서 재사용 가능한 “에이전트형 스킬”로 적용한다.

## 기본 전략: Agent-as-Skill
- Codex에는 Claude Code처럼 “고정된 agent 타입”이 없으므로, ixion에서는 **스킬 이름에 `agent`를 붙여** 역할 엔트리포인트를 만든다.
- 에이전트형 엔트리포인트는 **옵트인**이다: 사용자가 “에이전트로/agent mode/agent로”를 명시했거나 `ixion-agent-*`를 직접 호출하는 경우에만 사용한다(기본은 기능 기반 ixion 스킬 라우팅).
- 규칙:
  - `ixion-agent-*`: 역할 기반 엔트리포인트(탐색/설계/구현/리뷰/검증 등). 필요 시 내부에서 ixion 기능 스킬을 선택/조합한다.
  - `ixion-*`: 기능/워크플로우 스킬(도메인 프리셋, 빌드픽스, 검증, 보안 등).

## OMC agents -> Ixion agent skills (2026-02-14)

| OMC agent | Ixion agent skill | 비고 |
|---|---|---|
| explore | `ixion-agent-explore` | 읽기 전용 탐색(위치/흐름 맵) |
| architect | `ixion-agent-architect` | 코드 변경 없이 분석/권고 |
| executor | `ixion-agent-executor` | 실행 라우터(주 익션 + 동반 익션 조합) |
| build-fixer | `ixion-agent-build-fixer` | 최소 변경 빌드/타입 해결 |
| code-reviewer | `ixion-agent-code-reviewer` | 회귀/리스크 중심 리뷰 |
| security-reviewer | `ixion-agent-security-reviewer` | OWASP 관점 보안 점검(읽기 전용) |
| verifier | `ixion-agent-verifier` | 근거 기반 검증/판정 |
| planner | `ixion-agent-planner` | 요구사항 수렴/계획(코드 작성 없음) |
| analyst | `ixion-agent-analyst` | 요구사항 갭/성공조건 정제 |
| critic | `ixion-agent-critic` | 계획/문서 품질 게이트 |
| writer | `ixion-agent-writer` | 문서 작성/검증 |
| designer | `ixion-agent-designer` | UI/UX 설계+구현 |
| researcher | `ixion-agent-researcher` | 외부 문서 조사(링크/버전) |
| git-master | `ixion-agent-git-master` | git 안전 작업 |

## SSOT 경로
- OMC Codex 변환본: `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/*.md`
- 각 ixion-agent 스킬은 해당 SSOT 파일을 참조한다.
