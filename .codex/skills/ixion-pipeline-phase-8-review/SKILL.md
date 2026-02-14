---
name: ixion-pipeline-phase-8-review
description: (Pipeline Phase 8) 아키텍처/컨벤션/설계-구현 갭을 종합 점검하고 배포 전 리스크를 줄인다.
metadata:
  short-description: Pipeline phase 8 - cross-phase review
---

# Pipeline Phase 8: Architecture/Convention Review

## 목표
- Phase 1~7의 산출물이 실제 코드에 일관되게 반영됐는지 종합 점검한다.
- 회귀/취약점/테스트 공백을 “배포 전에” 최대한 줄인다.

## 원문 참고(SSOT)
- bkit phase-8-review: `.codex/.ixion/plugins/bkit/skills/phase-8-review/SKILL.md`
- 템플릿: `.codex/.ixion/templates/pipeline/phase-8-review.template.md`

## 연결(권장)
- 코드 리뷰는 `$ixion-review`
- 보안은 `$ixion-security`
- 검증은 `$ixion-verify`

## 다음
- Phase 9(배포): `$ixion-pipeline-phase-9-deployment`

