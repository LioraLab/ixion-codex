---
name: ixion-pdca
description: 계획/설계/분석/리포트 문서화를 강제하는 익션. 장기 유지에 필요한 합의와 흔적을 남긴다.
metadata:
  short-description: PDCA docs + templates
---

# Ixion PDCA

## 목표
- AI가 코드를 써도 프로젝트가 흔들리지 않게 문서를 남긴다.
- 문서는 읽고 끝이 아니라, 바로 실행 가능한 체크리스트 형태로 만든다.

## 원문 참고(SSOT)
- bkit 템플릿 원본: `.codex/.ixion/plugins/bkit/templates/`
- 현재 익션 템플릿은 원본을 `.codex/.ixion/templates/`로 그대로 복사해 사용한다(가능하면 수정하지 않는다).

## 경로 주의
- bkit 원문은 `docs/` 경로를 예시로 들 수 있지만, 이 리포에서는 문서 루트가 `.codex/.ixion/docs/`다.
- 대신 폴더 구조(01-plan/02-design/03-analysis/04-report)는 bkit 템플릿 기준으로 동일하게 유지한다.

## 기본 문서 구조 (권장)
- `.codex/.ixion/docs/01-plan/`
- `.codex/.ixion/docs/02-design/`
- `.codex/.ixion/docs/03-analysis/`
- `.codex/.ixion/docs/04-report/`

## 문서 생성 규칙
- 새 기능/큰 변경이면 Plan부터 만든다.
- Plan이 합의되면 Design을 만든다.
- 구현 후에는 Analysis(갭/리스크)와 Report(결과/검증)를 남긴다.

## Plan 작성 모드(요구사항/범위 합의)

아래 상황이면 PDCA에서 **Plan 문서만** 먼저 만든다.
- 요청이 넓고 애매해서 지금 바로 구현하면 스코프가 터질 때
- 여러 선택지(아키텍처/라이브러리/API 설계) 중 결정을 내려야 할 때
- 실패 비용이 큰 작업(결제/보안/마이그레이션/배포)

인터뷰 규칙(중요):
- 질문은 한 번에 1개만 한다(여러 개 묶지 않기).
- “코드베이스에서 확인 가능한 사실”은 사용자에게 묻지 말고 먼저 찾아본다.
- “지금 안 물으면 실패”할 질문만 한다.

Plan 산출물(권장 체크리스트):
- Requirements Summary
- Acceptance Criteria (테스트 가능하게)
- Implementation Steps (가능하면 파일 힌트 포함)
- Risks & Mitigations
- Verification Steps (최소 1개 커맨드)

계획 승인 후 실행 연결:
- 구현: `$ixion-orchestrator`
- 완료 전 검증: `$ixion-verify`

템플릿:
- Plan: `.codex/.ixion/templates/plan.template.md`

## 템플릿
가능하면 `.codex/.ixion/templates/`의 템플릿을 복제해 사용한다.
- Plan: `.codex/.ixion/templates/plan.template.md`
- Design: `.codex/.ixion/templates/design.template.md`
- Design (Starter): `.codex/.ixion/templates/design-starter.template.md`
- Design (Enterprise): `.codex/.ixion/templates/design-enterprise.template.md`
- Analysis: `.codex/.ixion/templates/analysis.template.md`
- Report: `.codex/.ixion/templates/report.template.md`
- Do: `.codex/.ixion/templates/do.template.md`
- Iteration Report: `.codex/.ixion/templates/iteration-report.template.md`
- Convention: `.codex/.ixion/templates/convention.template.md`
- Schema: `.codex/.ixion/templates/schema.template.md`
- Pipeline: `.codex/.ixion/templates/pipeline/*.template.md`
- Guide: `.codex/.ixion/templates/TEMPLATE-GUIDE.md`

## 같이 쓰기(권장)
- “뭐부터/어떤 순서로”가 애매하면: `$ixion-development-pipeline`
- 특정 Phase를 진행 중이면: `$ixion-development-pipeline`에서 해당 Phase 체크리스트를 바로 사용한다(예: “Phase 2 컨벤션”).
