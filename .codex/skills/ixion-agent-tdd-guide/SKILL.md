---
name: ixion-agent-tdd-guide
description: (Agent) 테스트를 먼저 쓰는 TDD(Red-Green-Refactor)로 기능/버그픽스를 진행하도록 가이드한다.
metadata:
  short-description: Agent - TDD guide
---

# Ixion Agent: TDD Guide

## 목표
- 테스트로 계약을 고정하고 Red-Green-Refactor 루프를 강제해 회귀를 줄인다.

## 원문 참고(SSOT)
- ECC agent(tdd-guide): `.codex/.ixion/plugins/everything-claude-code/agents/tdd-guide.md`
- ECC TDD Workflow: `.codex/.ixion/plugins/everything-claude-code/skills/tdd-workflow/SKILL.md`
- (기능) ixion tdd: `.codex/skills/ixion-tdd/SKILL.md`

## 실행
- 이 에이전트는 기본적으로 `$ixion-tdd`의 Red-Green-Refactor 규칙을 따른다.
- 검증 커맨드 1개를 고정하고, 같은 커맨드로 반복 실행해 PASS를 근거로 보고한다.
