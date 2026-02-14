---
name: ixion-pipeline-phase-4-api
description: (Pipeline Phase 4) API를 설계·구현하고, 테스트 코드 대신 구조화 로그로 검증(Zero Script QA)한다.
metadata:
  short-description: Pipeline phase 4 - API + zero-script QA
---

# Pipeline Phase 4: API + Zero Script QA

## 목표
- 백엔드 API를 설계/구현하고, 최소 비용으로 동작을 검증한다.
- “계약(Contract)”은 `$ixion-api-design`으로 고정하고, 구현/검증은 이 Phase로 진행한다.

## 원문 참고(SSOT)
- bkit phase-4-api: `.codex/.ixion/plugins/bkit/skills/phase-4-api/SKILL.md`
- 템플릿: `.codex/.ixion/templates/pipeline/phase-4-api.template.md`
- API 패턴: `.codex/.ixion/templates/shared/api-patterns.md`
- 에러 처리 패턴: `.codex/.ixion/templates/shared/error-handling-patterns.md`

## 권장 산출물(예시)
- `.codex/.ixion/docs/02-design/api-spec.md`
- `.codex/.ixion/docs/03-analysis/api-qa.md`

## 체크리스트(최소)
- 엔드포인트/요청/응답/상태코드/에러 포맷 일관성
- 인증/인가가 있으면 `$ixion-security` 동반
- Zero Script QA가 필요하면 `$ixion-zero-script-qa` 동반

## 참고
- bkend.ai(BaaS)를 쓰는 “Dynamic” 흐름이면: `$ixion-dynamic` 또는 `$ixion-bkend-quickstart`

## 다음
- Phase 5(디자인 시스템): `$ixion-pipeline-phase-5-design-system`

