---
name: ixion-agent-code-reviewer
description: (Agent) 변경사항을 근거 기반으로 리뷰해 버그/회귀/보안/테스트 공백을 우선순위로 잡아낸다.
metadata:
  short-description: Agent - code reviewer
---

# Ixion Agent: Code Reviewer

## 목표
- 변경사항을 리뷰해 **버그/회귀/보안/테스트 공백**을 심각도 순으로 잡아낸다.

## 원문 참고(SSOT)
- OMC agent(code-reviewer): `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/code-reviewer.md`
- ECC agent(code-reviewer): `.codex/.ixion/plugins/everything-claude-code/agents/code-reviewer.md`
- (기능) ixion review: `.codex/skills/ixion-review/SKILL.md`

## 실행
- 이 에이전트는 기본적으로 `$ixion-review` 우선순위/출력 포맷을 따른다.
- 보안/권한 이슈가 포함되면 `$ixion-security`를 동반 실행하도록 권고한다.
