---
name: ixion-build-fix
description: 빌드/타입/의존성 에러를 최소 변경으로 빠르게 그린 상태로 만든다.
metadata:
  short-description: Build/type error fixer
---

# Ixion Build Fix

## 목표
- "되게 만드는" 것만 한다. 리팩터링/개선/확장은 금지.
- 에러 재현 → 1개씩 해결 → 재검증 루프를 강제한다.

## 언제 쓰나
- 빌드 실패, TypeScript 타입 에러, import/모듈 해석 실패
- 테스트가 돌기 전에 컴파일 단계에서 막힐 때
- 의존성 버전 충돌/락파일 이슈

## 워크플로우
1. 가장 빠른 재현 커맨드 1개를 고른다(예: `npm run build`, `npx tsc --noEmit`, `pytest`).
2. 에러를 파일 단위로 묶고, 치명도 순으로 1개씩 처리한다.
3. 수정은 최소 diff로만 한다(타입 주석, null 처리, import 경로, config 보정).
4. 매 수정마다 같은 커맨드로 재검증한다.
5. 같은 에러가 3번 반복되면 "근본 원인"으로 보고 멈추고 원인/선택지를 제시한다.

## 금지
- "김에" 리팩터링
- 기능 추가/행동 변경(에러 해결에 필요한 범위를 초과)
- 테스트를 속이는 변경(의미없는 assert, skip 남발)

## 참고(SSOT)
- ECC build-error-resolver: `.codex/.ixion/plugins/everything-claude-code/agents/build-error-resolver.md`
- ECC build-fix command: `.codex/.ixion/plugins/everything-claude-code/.cursor/commands/build-fix.md`

