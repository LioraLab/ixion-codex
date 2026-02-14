---
name: ixion-pipeline-phase-9-deployment
description: (Pipeline Phase 9) 배포 전략/환경변수/롤백/운영 검증까지 포함해 프로덕션에 릴리즈한다.
metadata:
  short-description: Pipeline phase 9 - deployment
---

# Pipeline Phase 9: Deployment

## 목표
- 프로덕션 배포를 “재현 가능하고 되돌릴 수 있게” 만든다.

## 원문 참고(SSOT)
- bkit phase-9-deployment: `.codex/.ixion/plugins/bkit/skills/phase-9-deployment/SKILL.md`
- 템플릿: `.codex/.ixion/templates/pipeline/phase-9-deployment.template.md`

## 연결(권장)
- 배포 패턴/롤백은 `$ixion-deployment-patterns`
- 배포 직전 체크는 `$ixion-verify`

