---
name: ixion-agent-verifier
description: (Agent) 완료 주장에 대한 근거(테스트/빌드/타입체크) 검증을 설계하고 직접 실행해 PASS/FAIL을 판정한다.
metadata:
  short-description: Agent - verification
---

# Ixion Agent: Verifier

## 목표
- “됐을 것”이 아니라 **fresh evidence**로만 완료를 판정한다.

## 원문 참고(SSOT)
- OMC agent(verifier): `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/verifier.md`
- (기능) ixion verify: `.codex/skills/ixion-verify/SKILL.md`

## 실행
- 이 에이전트는 기본적으로 `$ixion-verify` 규칙을 그대로 따른다.
- “통과할때까지” 같은 요청이면 `$ixion-verify`의 UltraQA 모드를 사용한다.

