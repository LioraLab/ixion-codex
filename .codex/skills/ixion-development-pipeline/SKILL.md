---
name: ixion-development-pipeline
description: 새 프로젝트에서 “뭐부터/어디서부터/어떤 순서로” 개발할지 9-Phase 개발 파이프라인으로 안내한다.
metadata:
  short-description: 9-phase development pipeline guide
---

# Ixion Development Pipeline

## 목표
- 초반 방향/순서가 애매할 때, 개발을 9개 Phase로 쪼개 “다음에 뭘 해야 하는지”를 명확히 만든다.
- 각 Phase 안에서 PDCA(Plan→Design→Do→Check→Act)를 1회 이상 돌리게 한다.

## 원문 참고(SSOT)
- bkit development-pipeline: `.codex/.ixion/plugins/bkit/skills/development-pipeline/SKILL.md`
- pipeline 템플릿: `.codex/.ixion/templates/pipeline/`

## 9-Phase 개요(요약)
1. Phase 1: Schema/Terminology → `$ixion-pipeline-phase-1-schema`
2. Phase 2: Coding Convention → `$ixion-pipeline-phase-2-convention`
3. Phase 3: Mockup → `$ixion-pipeline-phase-3-mockup`
4. Phase 4: API + Zero Script QA → `$ixion-pipeline-phase-4-api`
5. Phase 5: Design System → `$ixion-pipeline-phase-5-design-system`
6. Phase 6: UI + API Integration → `$ixion-pipeline-phase-6-ui-integration`
7. Phase 7: SEO/Security → `$ixion-pipeline-phase-7-seo-security`
8. Phase 8: Review(아키텍처/컨벤션/갭) → `$ixion-pipeline-phase-8-review`
9. Phase 9: Deployment → `$ixion-pipeline-phase-9-deployment`

## 언제 쓰나
- “뭐부터 해야 돼?” “개발 순서 알려줘” “phase로 나눠줘”
- 새 프로젝트 킥오프(스택/문서/검증 루프가 아직 없음)
- 비개발자/초보 개발자에게 단계 안내가 필요할 때

## 산출물(권장)
- 문서가 필요하면 `.codex/.ixion/docs/` 아래에 남긴다.
  - Plan/Design: `.codex/.ixion/docs/01-plan/`, `.codex/.ixion/docs/02-design/`
  - Analysis/Report: `.codex/.ixion/docs/03-analysis/`, `.codex/.ixion/docs/04-report/`

## 연결(권장)
- 큰 기능이면 먼저 `$ixion-pdca`로 Plan/Design을 고정한다.
- 실제 구현은 `$ixion-orchestrator` 또는 도메인 프리셋(`$ixion-web|app|software|shopify|cv`)로 진행한다.
- 완료 선언 전 `$ixion-verify`로 최소 1개 검증을 실행한다.

