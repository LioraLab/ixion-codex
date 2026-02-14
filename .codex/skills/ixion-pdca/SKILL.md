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
