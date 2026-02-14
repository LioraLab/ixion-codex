---
name: ixion-learn
description: 작업에서 얻은 패턴/결정을 자산화하는 익션. 재사용 가능한 규칙을 `.codex/.ixion`과 NotebookLM Assistant Memory에 기록한다.
metadata:
  short-description: Continuous learning + memory
---

# Ixion Learn

## 목표
세션이 끝나면 사라지는 해결 과정을 “다음부터 자동으로 재사용 가능한 자산”으로 만든다.

## 원문 참고(SSOT)
- ECC Continuous Learning v2: `.codex/.ixion/plugins/everything-claude-code/skills/continuous-learning-v2/SKILL.md`
- (선택) OMC Learner: `.codex/.ixion/plugins/oh-my-claudecode/skills/learner/SKILL.md`
- (선택) OMC Note: `.codex/.ixion/plugins/oh-my-claudecode/skills/note/SKILL.md`

## 저장 대상 (짧고 명확한 것만)
- 반복되는 작업 패턴(예: 린트 고치는 순서, 테스트 추가 규칙)
- 확정된 기술 선택(왜 그걸 택했는지)
- 실패 사례/금지 패턴

## 저장 위치
- 로컬: `.codex/.ixion/decisions.md`에 요약 기록
- 장기 기억: NotebookLM `Assistant Memory`에 노트로 기록

## 형식 (5-10줄)
- 주제:
- 상황:
- 결정/패턴:
- 이유:
- 다음부터의 규칙:
