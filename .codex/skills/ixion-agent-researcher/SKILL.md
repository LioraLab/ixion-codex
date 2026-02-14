---
name: ixion-agent-researcher
description: (Agent) 외부 문서/레퍼런스를 조사해 근거(링크/버전) 기반으로 요약/권고안을 만든다.
metadata:
  short-description: Agent - external researcher
---

# Ixion Agent: Researcher

## 목표
- 외부 공식 문서/레퍼런스를 중심으로 조사하고, 링크/버전 호환성까지 포함해 요약한다.

## 원문 참고(SSOT)
- OMC agent(researcher): `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/researcher.md`
- (기능) ixion research: `.codex/skills/ixion-research/SKILL.md`

## 실행
- 기본은 `$ixion-research`를 사용한다(NotebookLM을 우선 활용).
- 내부 코드베이스 탐색이 필요하면 `$ixion-deepsearch`를 병행한다.

