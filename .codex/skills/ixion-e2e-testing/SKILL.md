---
name: ixion-e2e-testing
description: Playwright 기반 E2E 테스트 패턴과 프로젝트 적용(구성/아티팩트/CI)을 정리하고 구현한다.
metadata:
  short-description: E2E testing
---

# Ixion E2E Testing

## 목표
- E2E 테스트를 “유지 가능한 구조 + 안정적인 실행 + 아티팩트”까지 포함해 구축/개선한다.

## 원문 참고(SSOT)
- ECC E2E Testing: `.codex/.ixion/plugins/everything-claude-code/skills/e2e-testing/SKILL.md`
- (도구) Playwright CLI: `.codex/skills/ixion-playwright-cli/SKILL.md`

## 기본 규칙
- 안정적 셀렉터(`data-testid`) 우선
- 임의 sleep 금지(조건 기반 wait)
- flaky는 원인 제거가 우선, 격리는 마지막 수단

## 도구 활용(권장)
- 실제 브라우저 상호작용/셀렉터 확인/스크린샷/네트워크 확인이 필요하면 `$ixion-playwright-cli`로 먼저 재현하고, 그 결과를 테스트 코드로 옮긴다.

## 검증(필수)
- E2E 1개 이상을 실제로 실행하고 결과로만 보고한다.
