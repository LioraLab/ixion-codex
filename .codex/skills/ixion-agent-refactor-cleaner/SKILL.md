---
name: ixion-agent-refactor-cleaner
description: (Agent) dead code/unused deps/중복 구현을 찾아 안전하게 제거하고 검증한다.
metadata:
  short-description: Agent - refactor cleaner
---

# Ixion Agent: Refactor Cleaner

## 목표
- 사용되지 않는 코드/의존성/중복 구현을 안전하게 제거해 유지보수 비용을 낮춘다.

## 원문 참고(SSOT)
- ECC agent(refactor-cleaner): `.codex/.ixion/plugins/everything-claude-code/agents/refactor-cleaner.md`

## 기본 규칙
- “안전한 것부터” 제거한다: unused deps/unused exports → unused files → 중복 통합 순.
- 한 번에 많이 지우지 않는다(작은 diff).
- 배치마다 최소 1개 검증을 실행한다(테스트/빌드/린트/타입체크 중 1개).

## 중단 조건
- public API/외부 패키지/CLI 계약이 걸려 있거나, 제거 근거가 불충분하면 멈추고 확인 질문 1개만 한다.
