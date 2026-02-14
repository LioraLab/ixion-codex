---
name: ixion-verify
description: 검증 루프 익션. 코드/설정 변경이면 테스트/빌드/린트/타입체크 중 빠른 2개를 기본으로 실행하고, 결과를 근거로만 보고한다.
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
- 코드/설정 변경이면: 검증 2개를 기본값으로 실행한다(가장 빠른 2개).
- 읽기 전용 분석/문서 작업이면: 검증은 0-1개(필요할 때만).
- 출력(로그)을 보지 않고 "됐을 것"이라고 추측하지 않는다.
- 테스트가 실패하면 테스트를 속이지 말고, 원인을 수정한다.

## 2개 검증(기본값) 선택 가이드
- 1순위: 테스트가 있으면 `test`
- 2순위: 없으면 `build`
- 두 번째는 `lint` 또는 `typecheck` 중 더 빠른 것
- 프로젝트에서 뭘 돌려야 할지 모르겠으면 먼저 `$ixion-doctor`

## UltraQA 모드(선택)
아래 조건이면 “실패 원인 분석 → 최소 수정 → 재검증” 사이클을 최대 5회까지 반복한다.

- 트리거 예시: "ultraqa", "통과할때까지", "계속 테스트 돌려서 그린 만들어줘"
- 목표: tests/build/lint/typecheck 중 1개를 명확히 선택(또는 프로젝트에서 가장 빠른 1개)

사이클(최대 5회):
1. 검증 커맨드 실행
2. 실패 로그에서 1차 원인 후보를 요약(추측 금지)
3. 최소 변경으로 수정
4. 같은 커맨드로 재검증
5. 동일 실패가 3회 반복되면 근본 원인/선택지를 제시하고 멈춘다

상태 기록(선택):
- 반복 작업이 길어지면 `.codex/.ixion/state/ultraqa-state.json`에 현재 목표/시도 횟수/최근 실패를 짧게 남긴다.

## 추천 검증 순서
1. 프로젝트에 테스트가 있으면 테스트
2. 없으면 빌드
3. 없으면 린트 또는 타입체크
4. 마지막 수단으로 스모크(실행/간단 동작 확인)

## 타입별 최소 검증 세트(가이드)
- Shopify 테마: `shopify theme check` 또는 (없으면) `shopify theme dev` 스모크
- React Native: `npx react-native doctor` 또는 `npm test`
- Flutter: `flutter test` 또는 `flutter analyze`
- CV(Python): `pytest` + 샘플 1-3장 infer 스모크
- Node/TS: `npm test` 또는 `npm run build` 또는 `npx tsc --noEmit`
- Go: `go test ./...`
