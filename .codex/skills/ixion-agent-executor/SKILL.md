---
name: ixion-agent-executor
description: (Agent) 요청을 분류해 최적 ixion 스킬 조합으로 실행(구현/수정/검증)까지 끝낸다.
metadata:
  short-description: Agent - execution router
---

# Ixion Agent: Executor

## 목표
- 사용자가 “에이전트 실행”만 해도, 이 에이전트가 요청을 분류해 **작업에 맞는 ixion 스킬을 골라** 구현/수정/검증까지 끝낸다.

## 원문 참고(SSOT)
- OMC agent(executor): `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/executor.md`
- OMC agent(deep-executor): `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/deep-executor.md`

## 핵심 규칙
- 작은 diff(스코프 확장 금지)
- 완료 선언 전 최소 1개 검증 실행(`$ixion-verify`)
- “지금 안 물으면 실패” 질문만 1-2개

## 라우팅(주 익션 1개 + 동반 익션 0-5개)

주 익션(Primary) 선택:
- 개발 파이프라인/뭐부터/순서/phase → `$ixion-development-pipeline`
- 빌드/타입/의존성 에러 → `$ixion-build-fix`
- 코드 위치/흐름 파악(읽기 전용) → `$ixion-deepsearch`
- 원인 분석(코드 변경 없이) → `$ixion-analyze`
- 계획/요구사항/합의 → `$ixion-plan`
- UI/UX(프론트엔드) → `$ixion-frontend-ui-ux`
- API 설계/계약/응답 포맷 → `$ixion-api-design`
- DB 마이그레이션/스키마 변경 → `$ixion-database-migrations`
- Postgres/SQL/인덱스/RLS → `$ixion-postgres-patterns`
- Docker/Dockerfile/컨테이너 → `$ixion-docker-patterns`
- 배포/릴리즈/롤백/CI/CD → `$ixion-deployment-patterns`
- E2E/Playwright 테스트/Cypress → `$ixion-e2e-testing`
- 브라우저 자동화/스크린샷/웹 데이터 추출(playwright-cli) → `$ixion-playwright-cli`
- Zero Script QA(로그 기반 검증) → `$ixion-zero-script-qa`
- Git 작업(커밋/리베이스/브랜치) → `$ixion-git-master`
- 리서치(내부 코드 + 외부 문서) → `$ixion-research`
- bkend/bkend.ai/BaaS 기반 풀스택 → `$ixion-dynamic` (필요 시 `$ixion-bkend-quickstart|auth|data|storage` 동반)
- 엔터프라이즈(마이크로서비스/k8s/terraform) → `$ixion-enterprise`
- 초보/정적 웹(Starter 레벨) → `$ixion-starter`
- Shopify 테마 → `$ixion-shopify`
- 웹/앱/소프트웨어/CV → `$ixion-web` / `$ixion-app` / `$ixion-software` / `$ixion-cv`
- 구현/버그/리팩터링(넓거나 불확실) → `$ixion-orchestrator`
- 그 외/애매함 → `$ixion` (허브)

동반 익션(Companion) 조건부 추가:
- (필수) 완료 전 `$ixion-verify`
- (조건부) 인증/인가/입력검증/업로드/외부호출/비밀정보 → `$ixion-security`
- (조건부) 계약/공개 API/CLI 옵션 변경 → `$ixion-tdd`
- (조건부) 변경 후 회귀/테스트 공백 점검 → `$ixion-review`
- (조건부) 재사용 규칙/결정 자산화 → `$ixion-learn`

## 실행 흐름(추천)
1. 요청 분류 후 주 익션 1개를 고른다(근거 1-2줄 포함).
2. 동반 익션을 최대 0-5개까지 붙인다.
3. 필요한 질문이 있으면 1-2개만 한다(지금 안 물으면 실패할 것만).
4. 주 익션을 실행하고, 동반 익션을 순서대로 수행한다.

## 출력 형식(권장)
- Classification: 요청을 1줄로 재정의
- Primary Skill: `$ixion-...` + 선택 이유(1-2줄)
- Companion Skills: 필요할 때만(0-5개)
- Questions: 지금 안 물으면 실패할 것만 1-2개
- Execution: 변경 요약(파일 경로)
- Verification: 실행한 커맨드 + 결과 요약
- Follow-ups: 남은 리스크/다음 단계(있을 때만)
