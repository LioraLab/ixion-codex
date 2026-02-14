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
- bkit(문서/PDCA 템플릿): `.codex/.ixion/plugins/bkit/templates/`
- OMC(오케스트레이션/에이전트 프롬프트): `.codex/.ixion/plugins/oh-my-claudecode/skills/`, `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/`
- ECC(장기 운영 규칙/검증/학습 + 에이전트 프롬프트): `.codex/.ixion/plugins/everything-claude-code/skills/`, `.codex/.ixion/plugins/everything-claude-code/rules/`, `.codex/.ixion/plugins/everything-claude-code/agents/`

플러그인 매핑/업데이트: `.codex/.ixion/PLUGINS.md`

## 메모리(Assistant Memory)
- 새 작업/새 프로젝트 시작 시 NotebookLM `Assistant Memory`를 먼저 조회해 사용자 선호/결정/리소스를 확인한다.

## 기본 전략 (추천)
- 프롬프트(요청문) 생성: `$ixion-prompt`
- 역할 기반 엔트리포인트(옵트인): 사용자가 “에이전트로/agent mode/agent로”를 **명시**했을 때만 `$ixion-agent-*` (explore/architect/executor/reviewer/verifier 등)
- 계획/요구사항 수렴(인터뷰/합의형): `$ixion-plan`
- 원인 분석(코드 변경 없이): `$ixion-analyze`
- 코드베이스 문서화(AGENTS.md): `$ixion-deepinit`
- Git 작업(커밋/리베이스/브랜치): `$ixion-git-master`
- 리서치(내부 코드 + 외부 문서): `$ixion-research`
- UI/UX(프론트엔드): `$ixion-frontend-ui-ux`
- 도메인 프리셋:
  - 웹 개발: `$ixion-web`
  - 앱 개발: `$ixion-app`
  - 소프트웨어/CLI: `$ixion-software`
  - 컴퓨터비전: `$ixion-cv`
  - Shopify 테마: `$ixion-shopify`
- 패턴/체크리스트(선택):
  - API 설계: `$ixion-api-design`
  - DB 마이그레이션: `$ixion-database-migrations`
  - PostgreSQL 패턴: `$ixion-postgres-patterns`
  - Docker 패턴: `$ixion-docker-patterns`
  - 배포 패턴: `$ixion-deployment-patterns`
  - E2E 테스트: `$ixion-e2e-testing`
  - 브라우저 자동화(Playwright CLI): `$ixion-playwright-cli`
- 코드 위치/흐름 파악(읽기 전용): `$ixion-deepsearch`
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
  역할 힌트가 있으면 해당 엔트리포인트로 라우팅: explore/architect/executor/build-fixer/go-build-resolver/code-reviewer/go-reviewer/python-reviewer/security-reviewer/verifier/planner/analyst/critic/writer/designer/researcher/git-master/database-reviewer/doc-updater/e2e-runner/refactor-cleaner/tdd-guide -> `$ixion-agent-*`
- “프롬프트/prompt/요청문/템플릿” -> `$ixion-prompt`
- “plan/계획/요구사항/스펙/범위 정리/consensus/ralplan” -> `$ixion-plan`
- “analyze/분석/investigate/원인/왜 이래/왜 이러지/root cause” -> `$ixion-analyze`
- “AGENTS.md/deepinit/온보딩 문서/디렉토리 문서” -> `$ixion-deepinit`
- “git/커밋/commit/rebase/squash/브랜치/merge/cherry-pick” -> `$ixion-git-master`
- “리서치/research/조사/근거/비교/문서 읽고 정리” -> `$ixion-research`
- “UI/UX/디자인/스타일/컴포넌트 UI/반응형/접근성” -> `$ixion-frontend-ui-ux`
- “API 설계/REST/endpoint/응답 포맷/페이지네이션/버전” -> `$ixion-api-design`
- “마이그레이션/migration/스키마 변경/DDL/백필/backfill” -> `$ixion-database-migrations`
- “Postgres/SQL/인덱스/index/RLS/lock/데드락” -> `$ixion-postgres-patterns`
- “Docker/dockerfile/컨테이너/이미지 빌드” -> `$ixion-docker-patterns`
- “배포/deploy/release/rollback/CI/CD” -> `$ixion-deployment-patterns`
- “E2E/Playwright 테스트/Cypress” -> `$ixion-e2e-testing`
- “playwright-cli/playwright/브라우저 자동화/웹 스크린샷/폼 자동 입력/웹 데이터 추출” -> `$ixion-playwright-cli`
- “빌드/컴파일/타입 에러/tsc/build fail” -> `$ixion-build-fix`
- “어디서/찾아줘/검색/구조/흐름/연결” -> `$ixion-deepsearch`
- “쇼피파이/Shopify/Liquid/theme/테마” -> `$ixion-shopify`
- “컴퓨터비전/CV/OpenCV/YOLO/Segmentation/Detection” -> `$ixion-cv`
- “모바일/React Native/Flutter/iOS/Android/Electron/Tauri” -> `$ixion-app`
- “웹/프론트/백엔드/API/Next.js/React/Vue/Svelte” -> `$ixion-web`
- “CLI/라이브러리/SDK/패키징/릴리즈” -> `$ixion-software`
- “만들어줘/고쳐줘/리팩터링” -> `$ixion-orchestrator`
- “기획/설계/문서/정리” -> `$ixion-pdca`
- “테스트/빌드/린트/검증/ultraqa/통과할때까지” -> `$ixion-verify`
- “리뷰해줘” -> `$ixion-review`
- “취약점/보안/권한” -> `$ixion-security`
- “TDD/테스트부터” -> `$ixion-tdd`
- “패턴 저장/재사용/학습” -> `$ixion-learn`
- “진단/왜 안 돼/설정” -> `$ixion-doctor`
