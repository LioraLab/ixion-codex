---
name: ixion-verify
description: 검증 루프 익션. 테스트/빌드/린트를 최소 1개는 반드시 실행하고, 결과를 근거로만 보고한다.
metadata:
  short-description: Verification loops
---

# Ixion Verify

## 목표
자동화가 강할수록 "검증"이 실제 품질을 결정한다.

## 원문 참고(SSOT)
- ECC Verification Loop: `.codex/.ixion/plugins/everything-claude-code/skills/verification-loop/SKILL.md`
- (선택) OMC UltraQA: `.codex/.ixion/plugins/oh-my-claudecode/skills/ultraqa/SKILL.md`

## Codex 적용
- 위 원문의 단계/출력 포맷을 최대한 그대로 따른다.
- `/verify` 같은 Claude Code 커맨드는 Codex에서 “터미널 명령 실행 + 결과 요약”으로 대체한다.

## 규칙
- 완료 선언 전에 최소 1개 검증을 실행한다.
- 출력(로그)을 보지 않고 "됐을 것"이라고 추측하지 않는다.
- 테스트가 실패하면 테스트를 속이지 말고, 원인을 수정한다.

## 추천 검증 순서
1. 프로젝트에 테스트가 있으면 테스트
2. 없으면 빌드
3. 없으면 린트 또는 타입체크
4. 마지막 수단으로 스모크(실행/간단 동작 확인)
