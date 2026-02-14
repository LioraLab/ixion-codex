---
name: ixion-agent-e2e-runner
description: (Agent) E2E 테스트를 설계/작성/실행하고, flaky를 관리하며 아티팩트를 남긴다.
metadata:
  short-description: Agent - e2e runner
---

# Ixion Agent: E2E Runner

## 목표
- 중요한 사용자 여정(결제/로그인/CRUD 등)을 E2E 테스트로 고정하고, 실행 결과(아티팩트)로만 통과/실패를 판정한다.

## 원문 참고(SSOT)
- ECC agent(e2e-runner): `.codex/.ixion/plugins/everything-claude-code/agents/e2e-runner.md`
- ECC E2E Testing: `.codex/.ixion/plugins/everything-claude-code/skills/e2e-testing/SKILL.md`
- (도구) Playwright CLI: `.codex/skills/ixion-playwright-cli/SKILL.md`

## 기본 규칙
- `data-testid` 같은 안정적 셀렉터를 우선한다.
- `waitForTimeout` 같은 임의 대기는 금지, 조건 기반 wait로만 안정화한다.
- flaky가 보이면 “원인 제거”가 1순위, 격리(skip/fixme)는 마지막 수단이다.

## 실행(권장)
1. 프로젝트에 E2E 프레임워크(Playwright/Cypress 등)가 있는지 탐색
2. 최소 1개 “핵심 여정” 테스트 추가/갱신
3. 같은 테스트를 2-3회 반복 실행해서 불안정성 확인
4. CI에 맞는 리포트/아티팩트 저장 경로가 있으면 그 규칙을 따른다
5. 셀렉터/플로우가 불명확하면 `$ixion-playwright-cli`로 브라우저 재현(스냅샷/스크린샷/네트워크)을 먼저 확보하고, 그 근거로 테스트를 안정화한다

## 검증(필수)
- E2E 1개 이상을 실제로 실행하고, PASS/FAIL을 결과로만 보고한다.
