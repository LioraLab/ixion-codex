---
name: ixion-pipeline-phase-6-ui-integration
description: (Pipeline Phase 6) 실제 화면을 구현하고 API 클라이언트/상태관리/에러 처리를 통합한다.
metadata:
  short-description: Pipeline phase 6 - UI integration
---

# Pipeline Phase 6: UI Implementation + API Integration

## 목표
- Phase 5의 컴포넌트로 실제 페이지/플로우를 구현하고 API와 통합한다.

## 원문 참고(SSOT)
- bkit phase-6-ui-integration: `.codex/.ixion/plugins/bkit/skills/phase-6-ui-integration/SKILL.md`
- 템플릿: `.codex/.ixion/templates/pipeline/phase-6-ui.template.md`

## 체크리스트(최소)
- 컴포넌트 → hooks → services → apiClient 같은 계층 유지(직접 fetch 남발 금지)
- 로딩/에러/빈 상태를 화면에 “기본값”으로 포함
- 타입/계약: Phase 4의 API spec과 클라이언트 타입 불일치 금지

## 다음
- Phase 7(SEO/보안): `$ixion-pipeline-phase-7-seo-security`

