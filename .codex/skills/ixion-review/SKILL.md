---
name: ixion-review
description: 장기 유지 목적의 코드 리뷰 익션. 버그/리스크/회귀/테스트 누락을 우선순위로 잡아낸다.
metadata:
  short-description: Code review guardrails
---

# Ixion Review

## 목표
AI가 코드를 쓰더라도, 장기 유지에 치명적인 문제(회귀/보안/테스트 부재/설계 부채)를 빠르게 잡는다.

## 원문 참고(SSOT)
- ECC Code Reviewer Agent: `.codex/.ixion/plugins/everything-claude-code/agents/code-reviewer.md`
- (선택) OMC Code Review Skill: `.codex/.ixion/plugins/oh-my-claudecode/skills/code-review/SKILL.md`
- (선택) OMC Codex Code Reviewer: `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/code-reviewer.md`
- (선택) bkit Code Review Skill: `.codex/.ixion/plugins/bkit/skills/code-review/SKILL.md`
- (선택) bkit Phase-8 Review Template: `.codex/.ixion/templates/pipeline/phase-8-review.template.md`

## 리뷰 우선순위
1. 기능/정합성 버그 (NPE, 경계조건, race)
2. 보안/권한/데이터 노출
3. 회귀 가능성 (기존 호출부/계약 변경)
4. 테스트/검증 누락
5. 유지보수 리스크 (과도한 복잡도/숨은 전역상태)

## 리뷰 출력 형식
- Findings (심각도 순)
- Open questions (필요할 때만)
- Change summary (짧게)
- Testing gap (남은 검증)

## 실행 규칙
- “문제 없음”이면 그렇게 말하되, 남은 리스크/테스트 공백은 반드시 언급한다.
- 사소한 스타일 지적은 마지막으로 미룬다.
