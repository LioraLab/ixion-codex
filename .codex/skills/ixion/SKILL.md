---
name: ixion
description: 익션 허브. 요청을 오케스트레이션/문서화/검증/리뷰/보안/TDD/학습으로 라우팅해 Codex에서 자동화-우선 개발을 수행한다.
metadata:
  short-description: Ixion hub router
---

# Ixion (Hub)

## 목적
bkit + oh-my-claudecode + everything-claude-code의 장점을 Codex 방식(스킬 + 멀티 에이전트)으로 통합한 “익션(Extension) 스위트”의 진입점이다.

## 원문 참고(SSOT)
- bkit(문서/템플릿 + 개발 파이프라인/레벨 프리셋/에이전트): `.codex/.ixion/plugins/bkit/templates/`, `.codex/.ixion/plugins/bkit/skills/`, `.codex/.ixion/plugins/bkit/agents/`, `.codex/.ixion/plugins/bkit/output-styles/`, `.codex/.ixion/plugins/bkit/bkit-system/`
- OMC(오케스트레이션/에이전트 프롬프트): `.codex/.ixion/plugins/oh-my-claudecode/skills/`, `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/`
- ECC(장기 운영 규칙/검증/학습 + 에이전트 프롬프트): `.codex/.ixion/plugins/everything-claude-code/skills/`, `.codex/.ixion/plugins/everything-claude-code/rules/`, `.codex/.ixion/plugins/everything-claude-code/agents/`

플러그인 매핑/업데이트: `.codex/.ixion/PLUGINS.md`

## 메모리(Assistant Memory)
- 새 작업/새 프로젝트 시작 시 NotebookLM `Assistant Memory`를 먼저 조회해 사용자 선호/결정/리소스를 확인한다.

## 기본 전략 (추천)
- 프롬프트(요청문) 생성: `$ixion-prompt`
- 역할 기반 엔트리포인트(옵트인): 사용자가 “에이전트로/agent mode/agent로”를 **명시**했을 때만 `$ixion-agent-executor`
- bkit 맵/탐색(선택): `$ixion-bkit-system`
- 계획/요구사항 수렴(인터뷰/합의형): `$ixion-pdca` (Plan 작성 모드)
- 원인 분석(코드 변경 없이): `$ixion-analyze`
- 코드베이스 문서화(AGENTS.md): `$ixion-deepinit`
- Git 작업(커밋/리베이스/브랜치): `$ixion-git-master`
- 리서치(내부 코드 + 외부 문서): `$ixion-research`
- UI/UX(프론트엔드): `$ixion-frontend-ui-ux`
- 개발 파이프라인(Phase): `$ixion-development-pipeline`
- Zero Script QA(로그 기반 검증): `$ixion-zero-script-qa`
- 레벨 프리셋(선택): `$ixion-presets` (Starter/Dynamic/Enterprise)
- bkend.ai(BaaS) 통합(선택): `$ixion-bkend`
- 도메인 프리셋: `$ixion-domains` (Web/App/Software/CV/Shopify)
- 패턴/체크리스트(선택):
  - API/DB/Postgres/Docker/배포 패턴: `$ixion-patterns`
  - Playwright(E2E + 브라우저 자동화): `$ixion-playwright`
- 코드 위치/흐름 파악(읽기 전용): `$ixion-analyze` (Deep Search 모드)
- 빌드/타입 에러 최소 수정: `$ixion-build-fix`
- 큰 작업/불확실: `$ixion-orchestrator`
- 기능 개발 문서화: `$ixion-pdca`
- 완료 전 검증: `$ixion-verify`
- 코드 품질 점검: `$ixion-review`
- 보안 점검: `$ixion-security`
- 테스트 주도: `$ixion-tdd`
- 작업 후 학습/자산화: `$ixion-learn`
- 환경/프로젝트 진단: `$ixion-doctor`

## 라우팅 규칙
요청을 받으면 아래 중 하나로 즉시 라우팅한다(질문은 “지금 안 물으면 실패”할 때만 1-2개).
- “에이전트로/agent mode/agent로” -> 역할 힌트가 없으면 `$ixion-agent-executor`
- “프롬프트/prompt/요청문/템플릿” -> `$ixion-prompt`
- “bkit” -> `$ixion-bkit-system`
- “개발 파이프라인/development pipeline/phase/뭐부터/어디서부터/순서/where to start” -> `$ixion-development-pipeline`
- “zero script qa/제로 스크립트 QA/로그 기반 QA/로그로 검증” -> `$ixion-zero-script-qa`
- “phase-1/phase 1/schema/terminology/용어/용어집/glossary” -> `$ixion-development-pipeline` (Phase 1)
- “phase-2/phase 2/convention/컨벤션/코딩 규칙/환경변수 규칙” -> `$ixion-development-pipeline` (Phase 2)
- “phase-3/phase 3/mockup/목업/prototype/와이어프레임” -> `$ixion-development-pipeline` (Phase 3)
- “phase-4/phase 4/zero script qa/api 구현(phase)” -> `$ixion-development-pipeline` (Phase 4)
- “phase-5/phase 5/design system/디자인 시스템(phase)” -> `$ixion-development-pipeline` (Phase 5)
- “phase-6/phase 6/ui integration/UI 구현(phase)” -> `$ixion-development-pipeline` (Phase 6)
- “phase-7/phase 7/seo/security/검색 최적화” -> `$ixion-development-pipeline` (Phase 7)
- “phase-8/phase 8/gap analysis/아키텍처 리뷰/컨벤션 리뷰” -> `$ixion-development-pipeline` (Phase 8)
- “phase-9/phase 9/deployment/배포 준비” -> `$ixion-development-pipeline` (Phase 9)
- “starter/초보/비개발자” -> `$ixion-presets` (Starter)
- “정적 웹/포트폴리오/랜딩페이지” -> `$ixion-domains` (Web) (초보/비개발자면 `$ixion-presets`(Starter)도 선택)
- “bkend/bkend.ai/BaaS/mcp__bkend” -> `$ixion-bkend`
- “dynamic/MVP/운영 최소 풀스택” -> `$ixion-presets` (Dynamic)
- “enterprise/엔터프라이즈/microservices/kubernetes/terraform” -> `$ixion-presets` (Enterprise)
- “plan/계획/요구사항/스펙/범위 정리/consensus/ralplan” -> `$ixion-pdca` (Plan 작성 모드)
- “analyze/분석/investigate/원인/왜 이래/왜 이러지/root cause” -> `$ixion-analyze`
- “AGENTS.md/deepinit/온보딩 문서/디렉토리 문서” -> `$ixion-deepinit`
- “git/커밋/commit/rebase/squash/브랜치/merge/cherry-pick” -> `$ixion-git-master`
- “리서치/research/조사/근거/비교/문서 읽고 정리” -> `$ixion-research`
- “UI/UX/디자인/스타일/컴포넌트 UI/반응형/접근성” -> `$ixion-frontend-ui-ux`
- “API 설계/REST/endpoint/응답 포맷/페이지네이션/버전” -> `$ixion-patterns` (REST API Design)
- “마이그레이션/migration/스키마 변경/DDL/백필/backfill” -> `$ixion-patterns` (DB Migrations)
- “Postgres/SQL/인덱스/index/RLS/lock/데드락” -> `$ixion-patterns` (Postgres Patterns)
- “Docker/dockerfile/컨테이너/이미지 빌드” -> `$ixion-patterns` (Docker Patterns)
- “배포/deploy/release/rollback/CI/CD” -> `$ixion-patterns` (Deployment Patterns)
- “E2E/Playwright 테스트/Cypress” -> `$ixion-playwright`
- “playwright-cli/playwright/브라우저 자동화/웹 스크린샷/폼 자동 입력/웹 데이터 추출” -> `$ixion-playwright`
- “빌드/컴파일/타입 에러/tsc/build fail” -> `$ixion-build-fix`
- “어디서/찾아줘/검색/구조/흐름/연결” -> `$ixion-analyze` (Deep Search 모드)
- “쇼피파이/Shopify/Liquid/theme/테마” -> `$ixion-domains` (Shopify)
- “컴퓨터비전/CV/OpenCV/YOLO/Segmentation/Detection” -> `$ixion-domains` (CV)
- “모바일/React Native/Flutter/iOS/Android/Electron/Tauri” -> `$ixion-domains` (App)
- “웹/프론트/백엔드/API/Next.js/React/Vue/Svelte” -> `$ixion-domains` (Web)
- “CLI/라이브러리/SDK/패키징/릴리즈” -> `$ixion-domains` (Software)
- “만들어줘/고쳐줘/리팩터링” -> `$ixion-orchestrator`
- “기획/설계/문서/정리” -> `$ixion-pdca`
- “테스트/빌드/린트/검증/ultraqa/통과할때까지” -> `$ixion-verify`
- “리뷰해줘” -> `$ixion-review`
- “취약점/보안/권한” -> `$ixion-security`
- “TDD/테스트부터” -> `$ixion-tdd`
- “패턴 저장/재사용/학습” -> `$ixion-learn`
- “진단/왜 안 돼/설정” -> `$ixion-doctor`
