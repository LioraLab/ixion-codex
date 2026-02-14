---
name: ixion-pipeline-phase-1-schema
description: (Pipeline Phase 1) 용어/도메인/스키마를 먼저 고정해, 이후 모든 설계·구현이 같은 말을 쓰게 만든다.
metadata:
  short-description: Pipeline phase 1 - schema/terminology
---

# Pipeline Phase 1: Schema/Terminology

## 목표
- 프로젝트의 “말(용어)”과 “데이터 구조(엔티티/관계)”를 먼저 고정한다.
- 반복 설명 비용을 줄이고(특히 AI 협업), 이후 API/UI/DB 설계의 기준점을 만든다.

## 원문 참고(SSOT)
- bkit phase-1-schema: `.codex/.ixion/plugins/bkit/skills/phase-1-schema/SKILL.md`
- 템플릿: `.codex/.ixion/templates/pipeline/phase-1-schema.template.md`
- 네이밍 참고: `.codex/.ixion/templates/shared/naming-conventions.md`

## 권장 산출물(예시)
- `.codex/.ixion/docs/01-plan/glossary.md` (용어집)
- `.codex/.ixion/docs/01-plan/schema.md` (스키마/엔티티)
- `.codex/.ixion/docs/01-plan/domain-model.md` (관계/경계)

## 체크리스트(최소)
- 용어집: 비즈니스 용어 ↔ 글로벌 표준 용어 매핑
- 엔티티/관계: 소유권(Owner), 라이프사이클, cardinality
- 필드: id/createdAt/updatedAt 등 공통 필드 규칙
- 코드 네이밍: 용어집과 코드 식별자(클래스/변수/필드)의 일치

## 다음
- Phase 2(컨벤션): `$ixion-pipeline-phase-2-convention`

