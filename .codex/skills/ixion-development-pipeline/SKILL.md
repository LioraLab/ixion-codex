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
1. Phase 1: Schema/Terminology
2. Phase 2: Coding Convention
3. Phase 3: Mockup
4. Phase 4: API + Zero Script QA
5. Phase 5: Design System
6. Phase 6: UI + API Integration
7. Phase 7: SEO/Security
8. Phase 8: Review(아키텍처/컨벤션/갭)
9. Phase 9: Deployment

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

---

## Phase별 상세(체크리스트)

아래는 “지금 Phase N을 진행 중”일 때 바로 가져다 쓸 수 있는 최소 체크리스트다.

### Phase 1: Schema/Terminology
- 목표: 프로젝트의 “말(용어)”과 “데이터 구조(엔티티/관계)”를 먼저 고정한다.
- 템플릿: `.codex/.ixion/templates/pipeline/phase-1-schema.template.md`
- 권장 산출물(예시)
  - `.codex/.ixion/docs/01-plan/glossary.md` (용어집)
  - `.codex/.ixion/docs/01-plan/schema.md` (스키마/엔티티)
  - `.codex/.ixion/docs/01-plan/domain-model.md` (관계/경계)
- 체크리스트(최소)
  - 용어집: 비즈니스 용어 ↔ 글로벌 표준 용어 매핑
  - 엔티티/관계: 소유권(Owner), 라이프사이클, cardinality
  - 필드: id/createdAt/updatedAt 등 공통 필드 규칙
  - 코드 네이밍: 용어집과 코드 식별자(클래스/변수/필드)의 일치

### Phase 2: Coding Convention
- 목표: 네이밍/폴더 구조/에러 처리/환경변수 규칙을 “문서로” 고정한다.
- 템플릿: `.codex/.ixion/templates/pipeline/phase-2-convention.template.md`
- 권장 산출물(예시)
  - `CONVENTIONS.md` (레포 루트)
  - `.codex/.ixion/docs/01-plan/naming.md`
  - `.codex/.ixion/docs/01-plan/env.md` (+ `.env.example` 정책)
  - `.codex/.ixion/docs/01-plan/structure.md`
- 체크리스트(최소)
  - 네이밍: PascalCase/camelCase/UPPER_SNAKE_CASE/파일 규칙
  - 환경변수: client 공개 prefix(예: `NEXT_PUBLIC_`)와 비밀정보 분리
  - 에러 포맷: 공통 error code / message / details 규칙
  - 폴더 구조: feature 단위 분리 기준, “어디에 둬야 하나” 규칙

### Phase 3: Mockup
- 목표: 구현 전에 UX/흐름을 “작동하는 프로토타입”으로 검증한다.
- 템플릿: `.codex/.ixion/templates/pipeline/phase-3-mockup.template.md`
- 권장 산출물(예시)
  - `mockup/` (pages/styles/scripts/data)
  - `.codex/.ixion/docs/02-design/mockup-spec.md`
- 체크리스트(최소)
  - 핵심 유저 여정 1-3개만 먼저
  - 데이터는 JSON으로 시뮬레이션(API 없이)
  - 컴포넌트 후보(Button/Card/Form 등) 식별
  - 접근성/모바일 터치 타겟/로딩/에러/빈 상태를 목업에 반영

### Phase 4: API + Zero Script QA
- 목표: 백엔드 API를 설계/구현하고, 최소 비용으로 동작을 검증한다.
- 템플릿: `.codex/.ixion/templates/pipeline/phase-4-api.template.md`
- 권장 산출물(예시)
  - `.codex/.ixion/docs/02-design/api-spec.md`
  - `.codex/.ixion/docs/03-analysis/api-qa.md`
- 체크리스트(최소)
  - 엔드포인트/요청/응답/상태코드/에러 포맷 일관성
  - 계약(Contract)이 흔들리면 `$ixion-patterns`의 “REST API Design”으로 먼저 고정
  - 인증/인가가 있으면 `$ixion-security` 동반
  - 테스트 코드 대신 로그 기반 검증이 필요하면 `$ixion-zero-script-qa` 동반
- 참고
  - bkend.ai(BaaS)를 쓰는 “Dynamic” 흐름이면: `$ixion-dynamic` + 필요 시 `$ixion-bkend`

### Phase 5: Design System
- 목표: 디자인 토큰(Color/Spacing/Typography 등)과 핵심 컴포넌트를 “재사용 자산”으로 만든다.
- 템플릿: `.codex/.ixion/templates/pipeline/phase-5-design-system.template.md`
- 권장 산출물(예시)
  - `.codex/.ixion/docs/02-design/design-system.md`
  - `components/ui/` (또는 프로젝트 표준 위치)
- 체크리스트(최소)
  - 토큰이 먼저(하드코딩 색상/여백 최소화)
  - 컴포넌트 변형(variant/size/state)을 API로 고정
  - 접근성(키보드/aria/라벨/포커스 링) 기본값 포함

### Phase 6: UI Implementation + API Integration
- 목표: 실제 페이지/플로우를 구현하고 API와 통합한다.
- 템플릿: `.codex/.ixion/templates/pipeline/phase-6-ui.template.md`
- 체크리스트(최소)
  - 컴포넌트 → hooks → services → apiClient 같은 계층 유지(직접 fetch 남발 금지)
  - 로딩/에러/빈 상태를 화면에 “기본값”으로 포함
  - 타입/계약: Phase 4의 API spec과 클라이언트 타입 불일치 금지

### Phase 7: SEO/Security
- 목표: 검색/공유/성능 관점의 “기본값” + OWASP 관점 보안 기본기를 적용한다.
- 템플릿: `.codex/.ixion/templates/pipeline/phase-7-seo-security.template.md`
- 연결(권장)
  - 보안 점검은 `$ixion-security`를 동반해서 진행한다.

### Phase 8: Architecture/Convention Review
- 목표: Phase 1~7 산출물이 실제 코드에 일관되게 반영됐는지 종합 점검한다.
- 템플릿: `.codex/.ixion/templates/pipeline/phase-8-review.template.md`
- 연결(권장)
  - 코드 리뷰는 `$ixion-review`
  - 보안은 `$ixion-security`
  - 검증은 `$ixion-verify`

### Phase 9: Deployment
- 목표: 프로덕션 배포를 “재현 가능하고 되돌릴 수 있게” 만든다.
- 템플릿: `.codex/.ixion/templates/pipeline/phase-9-deployment.template.md`
- 연결(권장)
  - 배포/롤백 패턴은 `$ixion-patterns`의 “Deployment Patterns”
  - 배포 직전 체크는 `$ixion-verify`
