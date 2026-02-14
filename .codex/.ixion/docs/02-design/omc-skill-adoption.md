# OMC 스킬 적용 맵 (Ixion)

목표: oh-my-claudecode(OMC)의 “좋은 스킬들”을 ixion(Codex)에서 실제로 쓸 수 있게, 중복은 흡수하고 필요한 건 포팅한다.

## 적용 전략
- 흡수: 이미 ixion에 있는 기능이면, 새 스킬을 만들지 않고 기존 ixion 스킬/문서에 SSOT로만 연결한다.
- 래퍼: Codex 환경에서 바로 쓰고 싶은 기능이면, ixion 네이밍으로 얇은 래퍼 스킬을 추가한다.
- 보류: Claude Code 전용 도구/훅/MCP에 강하게 의존하거나, ixion 목적과 거리가 있으면 보류한다.

## OMC -> Ixion 매핑 (2026-02-14 기준)

| OMC skill | Ixion 대응 | 적용 방식 | 비고 |
|---|---|---|---|
| analyze | ixion-analyze | 래퍼 | Codex에서 “코드 변경 없이 분석” 전용으로 사용 |
| autopilot | ixion-orchestrator | 흡수 | 개념/스테이징을 SSOT로 참고 |
| build-fix | ixion-build-fix | 흡수 | 최소 변경 빌드/타입 해결 |
| cancel | 해당 없음 | 보류 | Claude Code 커맨드 성격 |
| code-review | ixion-review | 흡수 | ixion-review는 ECC를 SSOT로 사용, OMC는 참고용 |
| configure-discord | 해당 없음 | 보류 | ixion 범위 밖 |
| configure-telegram | 해당 없음 | 보류 | ixion 범위 밖 |
| deepinit | ixion-deepinit | 래퍼 | 계층형 AGENTS.md 생성/갱신 |
| deepsearch | ixion-deepsearch | 흡수 | 읽기 전용 흐름 파악 |
| doctor | ixion-doctor | 흡수 | 검증 커맨드 추천/프로젝트 타입 추정 |
| ecomode | 해당 없음 | 보류 | OMC 모델/비용 라우팅에 강하게 결합 |
| frontend-ui-ux | ixion-frontend-ui-ux | 래퍼 | Codex 환경(구현+검증) 기준으로 재정의 |
| git-master | ixion-git-master | 래퍼 | git 안전 작업(원자 커밋/리베이스) |
| help | 해당 없음 | 보류 | OMC 자체 도움말 |
| hud | 해당 없음 | 보류 | OMC HUD 기능 |
| learn-about-omc | 해당 없음 | 보류 | OMC 자체 설명 |
| learner | ixion-learn | 흡수 | ixion-learn은 ECC + NotebookLM(Assistant Memory) 중심 |
| mcp-setup | 해당 없음 | 보류 | OMC 설치/셋업 범주 |
| note | ixion-learn | 부분 흡수 | “작업 중 노트”가 필요하면 `ixion-note` 후보 |
| omc-setup | 해당 없음 | 보류 | OMC 설치/셋업 범주 |
| pipeline | ixion-orchestrator | 흡수 | 파이프라인/병렬화 개념 SSOT |
| plan | ixion-plan | 래퍼 | 인터뷰/직접/합의/리뷰 모드(AskUserQuestion 없이 plain Q&A로 대체) |
| project-session-manager | 해당 없음 | 보류 | OMC 세션 관리 |
| psm | 해당 없음 | 보류 | project-session-manager alias |
| ralph-init | 해당 없음 | 보류 | OMC ralph 초기화 |
| ralph | ixion-orchestrator (+ ixion-verify) | 흡수(개념) | “끝날 때까지/검증까지”를 오케스트레이터에 반영 |
| ralplan | ixion-plan | 흡수(부분) | 합의형 플래닝(Consensus) 개념을 `ixion-plan`에 포함 |
| release | 해당 없음 | 보류 | OMC 릴리즈 자동화(OMC 전용) |
| research | ixion-research | 래퍼 | 내부 코드 + 외부 문서 근거 기반 리서치 |
| review | ixion-review | 흡수 | OMC는 plan review alias |
| security-review | ixion-security | 흡수 | 보안 점검 |
| skill | 해당 없음 | 보류 | OMC 스킬 메타 |
| swarm | ixion-orchestrator | 흡수 | 멀티 에이전트 개념 |
| tdd | ixion-tdd | 흡수 | TDD 루프 |
| team | ixion-orchestrator | 흡수 | 팀 오케스트레이션 개념 |
| trace | 해당 없음 | 보류 | trace MCP 의존 |
| ultrapilot | ixion-orchestrator | 흡수(개념) | autopilot/ralph 개념 포함 |
| ultraqa | ixion-verify | 흡수 | ixion-verify에 UltraQA 모드 추가 |
| ultrawork | ixion-orchestrator | 흡수(개념) | 병렬 실행 개념 참고 |
| writer-memory | ixion-learn | 부분 흡수 | NotebookLM 기반 메모리로 대체 |

## 현재 포팅된 래퍼 스킬
- `.codex/skills/ixion-git-master/SKILL.md`
- `.codex/skills/ixion-research/SKILL.md`
- `.codex/skills/ixion-frontend-ui-ux/SKILL.md`
- `.codex/skills/ixion-deepinit/SKILL.md`
- `.codex/skills/ixion-analyze/SKILL.md`
- `.codex/skills/ixion-plan/SKILL.md`
