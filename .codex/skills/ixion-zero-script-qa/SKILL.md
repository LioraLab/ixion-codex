---
name: ixion-zero-script-qa
description: 테스트 코드 없이 구조화 로그와 실시간 모니터링으로 기능을 검증하는 “Zero Script QA” 방법을 적용한다.
metadata:
  short-description: Log-based QA without test scripts
---

# Ixion Zero Script QA

## 목표
- 테스트 코드 작성/유지 비용이 큰 구간을, “구조화 로그 + 실제 조작(수동 UX) + 로그 분석”으로 검증한다.
- 단위테스트/E2E를 대체하기보단, 빠른 피드백 루프로 보완한다.

## 원문 참고(SSOT)
- bkit zero-script-qa: `.codex/.ixion/plugins/bkit/skills/zero-script-qa/SKILL.md`
- bkit qa-monitor agent: `.codex/.ixion/plugins/bkit/agents/qa-monitor.md`

## 핵심 규칙(최소)
- 모든 요청에 `request_id`(또는 trace id)를 붙이고, 같은 id로 end-to-end 흐름을 추적한다.
- 로그는 JSON(구조화)로 남기고, 필드 스키마를 고정한다(timestamp, level, service, request_id, message, data).
- 성공(200)도 로그를 남겨 “정상 흐름”을 근거로 확인한다.

## 실전 커맨드(예시)
- Docker compose:
  - `docker compose logs -f --tail=200`
  - `docker compose logs -f --tail=200 <service>`
- Docker:
  - `docker logs -f --tail=200 <container>`

## 산출물(권장)
- `.codex/.ixion/docs/03-analysis/zero-script-qa-YYYYMMDD.md`

## 같이 쓰기(권장)
- 계약/에러 포맷을 먼저 고정해야 하면 `$ixion-patterns` (REST API Design)
- 실제 브라우저 조작/스크린샷이 필요하면 `$ixion-playwright`
