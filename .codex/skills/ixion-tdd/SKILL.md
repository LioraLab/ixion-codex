---
name: ixion-tdd
description: 테스트 주도 개발 익션. Red-Green-Refactor를 강제하고, 최소 변경으로 통과시키는 루프를 만든다.
metadata:
  short-description: TDD workflow
---

# Ixion TDD

## 목표
AI가 코드를 쓸 때 “우연히 되는 코드”를 줄이고, 계약을 테스트로 고정한다.

## 원문 참고(SSOT)
- ECC TDD Workflow: `.codex/.ixion/plugins/everything-claude-code/skills/tdd-workflow/SKILL.md`
- (선택) OMC TDD: `.codex/.ixion/plugins/oh-my-claudecode/skills/tdd/SKILL.md`

## 규칙
- 새 기능/버그픽스는 가능한 한 테스트를 먼저 만든다.
- 테스트를 속이는 방식(의미 없는 assert, mock 남발)은 금지.
- 리팩터링은 Green 이후 최소 범위로만 한다.

## 워크플로우
1. 실패하는 테스트(Red) 추가
2. 최소 구현(Green)
3. 리팩터링(필요할 때만)
4. 회귀 테스트/엣지 케이스 추가
