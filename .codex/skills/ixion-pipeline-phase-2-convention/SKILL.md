---
name: ixion-pipeline-phase-2-convention
description: (Pipeline Phase 2) 코드 작성 규칙(네이밍/폴더/에러/환경변수)을 문서로 고정해 AI가 일관되게 코드를 쓰게 만든다.
metadata:
  short-description: Pipeline phase 2 - conventions
---

# Pipeline Phase 2: Coding Convention

## 목표
- 네이밍/폴더 구조/에러 처리/환경변수 규칙을 “문서로” 고정한다.
- AI가 코드를 써도 스타일이 흔들리지 않게 기준점을 만든다.

## 원문 참고(SSOT)
- bkit phase-2-convention: `.codex/.ixion/plugins/bkit/skills/phase-2-convention/SKILL.md`
- 템플릿: `.codex/.ixion/templates/pipeline/phase-2-convention.template.md`
- 네이밍 참고: `.codex/.ixion/templates/shared/naming-conventions.md`
- 컨벤션 템플릿(범용): `.codex/.ixion/templates/convention.template.md`

## 권장 산출물(예시)
- `CONVENTIONS.md` (레포 루트, 팀/AI가 항상 보는 위치)
- `.codex/.ixion/docs/01-plan/naming.md`
- `.codex/.ixion/docs/01-plan/env.md` (+ `.env.example` 정책)
- `.codex/.ixion/docs/01-plan/structure.md`

## 체크리스트(최소)
- 네이밍: PascalCase/camelCase/UPPER_SNAKE_CASE/파일 규칙
- 환경변수: client 공개 prefix(예: `NEXT_PUBLIC_`)와 비밀정보 분리
- 에러 포맷: 공통 error code / message / details 규칙
- 폴더 구조: feature 단위 분리 기준, “어디에 둬야 하나” 규칙

## 다음
- Phase 3(목업): `$ixion-pipeline-phase-3-mockup`

