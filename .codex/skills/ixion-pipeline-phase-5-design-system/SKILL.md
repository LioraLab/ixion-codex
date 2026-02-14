---
name: ixion-pipeline-phase-5-design-system
description: (Pipeline Phase 5) 디자인 토큰과 재사용 컴포넌트 라이브러리를 만들어 UI 일관성과 개발 속도를 확보한다.
metadata:
  short-description: Pipeline phase 5 - design system
---

# Pipeline Phase 5: Design System

## 목표
- 디자인 토큰(Color/Spacing/Typography 등)과 핵심 컴포넌트(Button/Input/Card 등)를 “재사용 자산”으로 만든다.

## 원문 참고(SSOT)
- bkit phase-5-design-system: `.codex/.ixion/plugins/bkit/skills/phase-5-design-system/SKILL.md`
- 템플릿: `.codex/.ixion/templates/pipeline/phase-5-design-system.template.md`

## 권장 산출물(예시)
- `.codex/.ixion/docs/02-design/design-system.md`
- `components/ui/` (또는 프로젝트 표준 위치)

## 체크리스트(최소)
- 토큰이 먼저(하드코딩 색상/여백 최소화)
- 컴포넌트 변형(variant/size/state)을 API로 고정
- 접근성(키보드/aria/라벨/포커스 링) 기본값 포함

## 다음
- Phase 6(UI 통합): `$ixion-pipeline-phase-6-ui-integration`

