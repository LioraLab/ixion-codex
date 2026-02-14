---
name: ixion-orchestrator
description: 멀티 에이전트 오케스트레이션 익션. 탐색-구현-검증을 파이프라인으로 굴려 사용자 개입을 최소화한다.
metadata:
  short-description: Multi-agent orchestration
---

# Ixion Orchestrator

## 목표
- 사용자 개입 최소화
- 병렬화로 속도 확보
- 장기 유지 가드레일(작은 diff, 검증, 기록) 유지

## 원문 참고(SSOT)
- OMC 팀 오케스트레이션(개념/스테이지): `.codex/.ixion/plugins/oh-my-claudecode/skills/team/SKILL.md`
- OMC 자동 실행 모드: `.codex/.ixion/plugins/oh-my-claudecode/skills/autopilot/SKILL.md`
- OMC 파이프라인 모드: `.codex/.ixion/plugins/oh-my-claudecode/skills/pipeline/SKILL.md`
- OMC 병렬 실행 엔진(개념): `.codex/.ixion/plugins/oh-my-claudecode/skills/ultrawork/SKILL.md`
- OMC 지속/완료 루프(개념): `.codex/.ixion/plugins/oh-my-claudecode/skills/ralph/SKILL.md`
- OMC Codex 에이전트 프롬프트(역할 정의): `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/*.md`
- ECC 반복 탐색/명료화: `.codex/.ixion/plugins/everything-claude-code/skills/iterative-retrieval/SKILL.md`

## Codex 적용(차이)
- OMC의 Claude Code 전용 Team/Task 도구는 Codex에 없으므로,
  - 탐색/분해: `functions.spawn_agent(agent_type="explorer")`
  - 구현: `functions.spawn_agent(agent_type="worker")`
  - 조율/재시도: `functions.send_input` + `functions.wait`
  로 동일한 역할을 재현한다.

## 언제 이 익션을 쓰나
- 작업이 넓거나 불확실성이 커서 탐색이 필요한 경우
- 파일/모듈이 여러 개로 나뉘는 경우
- "빨리 만들되, 검증까지 자동으로"가 중요한 경우

## 오케스트레이션 파이프라인 (기본)
1. 코어 규칙 적용
   - `$ixion-core`의 멈춤 조건과 최종 답변 형식을 그대로 따른다.
2. 탐색 단계
   - `functions.spawn_agent(agent_type="explorer")`로 코드베이스/관련 파일/리스크를 빠르게 맵핑한다.
3. 분할 단계
   - 변경을 2-5개의 독립 작업으로 쪼개고, 각 작업의 파일 소유권을 명확히 한다.
4. 구현 단계
   - `functions.spawn_agent(agent_type="worker")`를 사용해 작업 단위로 병렬 실행한다.
   - 각 worker에게는 파일 소유권(수정 가능 파일 리스트)과 성공조건을 명시한다.
5. 통합 및 검증
   - 코드/설정 변경이면 `$ixion-verify` 기준으로 빠른 검증 2개를 실행한다(기본값).
   - 읽기 전용 분석/문서 작업이면 검증은 0-1개(필요할 때만)로 둔다.
6. 기록
   - 중요한 결정/트레이드오프는 `.codex/.ixion/decisions.md`에 짧게 남긴다.
   - 실행 로그/체크포인트가 필요하면 `.codex/.ixion/state/`에 남긴다.

## 지속 모드(ralph 스타일, 선택)
아래 같은 요구가 명시되면 "완료 선언 전 검증 증거"를 더 강하게 강제한다.

- 트리거 예시: "끝날 때까지", "중단하지마", "반드시 완료", "계속 돌려서 그린 만들어줘"
- 기본 적용:
  - 병렬 작업은 최대한 병렬로 처리(ultrawork 개념)
  - 코드/설정 변경이면 완료 선언 전 `$ixion-verify`로 검증 2개를 기본값으로 실행
  - 실패가 반복되면 “동일 실패 3회”에서 근본 원인/선택지를 제시하고 사용자 확인을 받는다

## 예외 라우팅
- (현재 없음) 워크플로우/캔버스 편집 같은 특수 작업이 필요해지면 별도 익션으로 분리한다.
