---
name: ixion-prompt
description: "사용자 요청을 ixion 전체 기능(도메인 프리셋 + 오케스트레이션/문서화/검증/리뷰/보안/TDD/학습/진단/딥서치/빌드픽스) 중 '최적 경로'로 태우는 붙여넣기 가능한 작업 프롬프트(요청문)를 생성한다. Triggers: 프롬프트 만들어줘, prompt, 요청문, 프롬프트 템플릿, prompt engineer, ixion 프롬프트."
---

# Ixion Prompt

## Goal

- 사용자의 대략적인 요청을 "실행 가능한 프롬프트"로 재작성한다.
- 프롬프트는 ixion 워크플로우(작은 diff, 검증, 기록)와 ixion 전체 스킬(기능) 맵을 전제로 한다.

## What To Output

- 최종 결과는 단일 코드블록 1개로 출력한다.
- 코드블록 첫 줄은 항상 스킬 호출로 시작한다: `$ixion` 또는 `$ixion-...`
- 프롬프트에는 최소한 아래가 들어가야 한다.
  - 목적
  - 주 익션 선택 이유(1-2줄)
  - In scope / Out of scope
  - 제약/리스크(있으면)
  - 성공 조건(관찰 가능하게)
  - 검증(상황별: 코드/설정 변경이면 기본 2개, 읽기 전용 분석/문서면 0-1개)

## Non-Negotiables (Guardrails)

- (추천 1개) "주 익션(Primary skill)"은 반드시 1개만 고른다.
- (동반 익션) 필요하면 "동반 익션(Companion skills)"을 조건부로 붙인다.
  - 권장: 0-3개(프롬프트 과다 분량 방지)
  - 예외: 보안/검증/TDD/리뷰/학습이 전부 필요한 경우는 0-5개까지 허용
- (질문) 추측으로 메우지 말고, "지금 안 물으면 실패"할 질문만 1-2개 포함한다.
- (작은 diff) 스코프 확장(김에 수정) 금지.
- (검증) 코드/설정 변경이면 검증 2개를 기본값으로 포함한다(테스트/빌드/린트/타입체크/스모크 중 빠른 2개).
  - 읽기 전용 분석/문서 작업이면 검증은 0-1개(필요할 때만)로 둔다.

## Skill Awareness (중요)

`ixion-prompt`는 “미리 적어둔 치트시트”를 참고하되, **실제 사용 가능한 스킬 목록을 소스 오브 트루스로** 취급한다.

- 세션 컨텍스트에 “Available skills” 목록이 제공되면, 그 목록을 기준으로만 스킬명을 선택한다(존재하지 않는 스킬명 발명 금지).
- 목록이 없거나 확신이 없으면 아래 파일을 우선 확인해 라우팅을 맞춘다.
  - 한눈에 선택표(치트시트): `.codex/.ixion/SKILL-MAP.md`
  - 허브 라우팅: `.codex/skills/ixion/SKILL.md`
  - 전체 매핑/벤더링: `.codex/.ixion/PLUGINS.md`
  - 사용자용 인덱스: `.codex/.ixion/README.md`

## Ixion 기능 맵 (Cheat Sheet)

- 기본 규칙/가드레일: `$ixion-core`
  - 보통은 "직접 호출"보다, 프롬프트의 제약/성공조건/검증 항목에 반영한다.
- 스킬 확장(설치 가능한 스킬 탐색/설치): `$find-skills`
  - “이거 할 수 있는 스킬 있나?” 같은 요청이면 `npx skills find/add`로 먼저 찾아본다.
- 계획/요구사항 수렴(인터뷰/합의형): `$ixion-pdca` (Plan 작성 모드)
  - 바로 구현하면 스코프가 터지거나, 결정을 내려야 해서 계획이 먼저 필요한 경우.
- 원인 분석(코드 변경 없이): `$ixion-analyze`
  - “왜 이런 현상이 나오는지”를 코드 변경 없이 근거 기반으로 분석할 때.
- 코드베이스 문서화(AGENTS.md): `$ixion-deepinit`
  - 레포/디렉토리 구조 온보딩 문서를 계층형 AGENTS.md로 생성/갱신할 때.
- Git 작업(커밋/리베이스/브랜치): `$ixion-git-master`
  - 원자 커밋, rebase/squash, 브랜치/히스토리 정리 같은 git 작업이 목적일 때.
- 리서치(내부 코드 + 외부 문서): `$ixion-research`
  - 근거(코드 현실 + 문서)를 모아 결론/권고안을 내야 할 때.
- UI/UX(프론트엔드): `$ixion-frontend-ui-ux`
  - UI/UX 작업을 접근성/반응형/상태(로딩/에러/빈상태)까지 포함해 끝낼 때.
- 패턴/체크리스트(묶음): `$ixion-patterns`
  - API 설계/DB 마이그레이션/Postgres/Docker/배포 패턴을 “필요한 것만” 골라 적용할 때.
- E2E 테스트(Playwright): `$ixion-playwright`
  - 핵심 여정을 E2E로 고정하고 CI에서 아티팩트까지 남겨야 할 때.
- 브라우저 자동화(Playwright CLI): `$ixion-playwright`
  - 웹에서 실제 클릭/입력/스크린샷/PDF/텍스트 추출/네트워크 확인이 필요할 때.
- 개발 파이프라인(Phase): `$ixion-development-pipeline`
  - 새 프로젝트에서 “뭐부터/순서”가 애매할 때 9-Phase로 다음 단계를 안내.
- Zero Script QA(로그 기반 검증): `$ixion-zero-script-qa`
  - 테스트 코드 없이 로그/모니터링으로 빠르게 QA 근거를 만들 때.
- 레벨 프리셋(선택): `$ixion-presets`
  - Starter/Dynamic/Enterprise 중 1개를 골라 “레벨(운영 전제)” 가드레일을 고정할 때.
- bkend 통합(선택): `$ixion-bkend`
  - bkend 통합이 핵심인 작업에서만 동반 익션으로 붙인다(프롬프트 과다 분량 방지).
- bkit 맵/탐색(선택): `$ixion-bkit-system`
  - bkit 플러그인 내부(templates/skills/agents/hooks/scripts)를 ixion 관점에서 빠르게 찾을 때.
- 역할 기반 엔트리포인트(옵트인): `$ixion-agent-executor`
  - 사용자가 “에이전트로/agent mode/agent로”를 **명시**했을 때만 이 경로를 선택한다.
  - executor가 작업에 맞는 ixion 기능 스킬(주 1개 + 동반 0-3개)을 스스로 선택한다.
- 허브/라우터: `$ixion`
  - 도메인/의도가 애매하거나, "그냥 알아서 최적 라우팅"이 목표일 때 1순위.
- 도메인 프리셋: `$ixion-domains`
  - Web/App/Software/CV/Shopify 중 1개를 골라 도메인 체크리스트를 기본값으로 깔 때.
- 큰 작업/불확실/병렬화: `$ixion-orchestrator`
  - 탐색→분할→구현→통합→검증까지 자동화 파이프라인이 필요한 경우.
- 문서/기획/설계/리포트(PDCA): `$ixion-pdca`
  - “코드부터”가 아니라 합의/스펙/흐름 고정이 먼저인 작업.
- 검증 루프: `$ixion-verify`
  - 코드/설정 변경이면 빠른 검증 2개를 기본값으로 실행하고 근거로만 보고하게 할 때.
- 코드 리뷰: `$ixion-review`
  - 회귀/리스크/테스트 공백을 잡는 게 목표일 때(또는 변경 후 동반 단계로).
- 보안 점검: `$ixion-security`
  - 인증/인가/입력검증/업로드/외부호출/비밀정보가 걸리는 순간 필수.
- TDD 루프: `$ixion-tdd`
  - 계약(입출력/공개 API/CLI 옵션)을 테스트로 고정하고 진행할 때.
- 학습/자산화: `$ixion-learn`
  - 작업에서 얻은 규칙/결정/금지 패턴을 `.codex/.ixion` + NotebookLM Assistant Memory에 남길 때.
- 프로젝트 진단: `$ixion-doctor`
  - “무슨 커맨드로 검증하지?” / 환경이 자꾸 깨짐 / 프로젝트 타입부터 확실히 해야 할 때.
- 코드 위치/흐름 파악(읽기 전용): `$ixion-analyze` (Deep Search 모드)
  - “어디서 처리돼?” “흐름 연결 보여줘”가 목적일 때.
- 빌드/타입 에러 최소 수정: `$ixion-build-fix`
  - 빌드/컴파일/타입/의존성 에러를 최소 변경으로 그린 상태로 만들 때.

## Workflow (Router)

0. (에이전트 모드, 옵트인) 사용자가 “에이전트로/agent mode/agent로”를 **명시**했으면:
   - "주 익션"은 `$ixion-agent-executor`
   - 이 경우 아래 1)~의 기능 분류 라우터는 건너뛴다(에이전트가 스스로 ixion 스킬을 선택/조합).
1. (요청 분류) 아래 중 하나로 "주 익션(Primary)"를 1개 고른다.
	   - 개발 파이프라인/phase/뭐부터/순서 -> `$ixion-development-pipeline`
	   - 스킬 찾아줘/find skills/기능 확장 -> `$find-skills`
	   - zero script qa/로그 기반 QA -> `$ixion-zero-script-qa`
	   - starter/초보/비개발자 -> `$ixion-presets` (Starter)
	   - bkend/bkend.ai/BaaS/mcp__bkend -> `$ixion-bkend`
	   - dynamic/MVP/운영 최소 풀스택 -> `$ixion-presets` (Dynamic)
	   - enterprise/microservices/k8s/terraform -> `$ixion-presets` (Enterprise)
   - 계획/요구사항/합의 -> `$ixion-pdca` (Plan 작성 모드)
   - 원인 분석(코드 변경 없이) -> `$ixion-analyze`
   - AGENTS.md 생성/갱신 -> `$ixion-deepinit`
   - git 작업(커밋/리베이스/브랜치) -> `$ixion-git-master`
   - 리서치/조사/근거 정리 -> `$ixion-research`
   - UI/UX(프론트엔드) -> `$ixion-frontend-ui-ux`
   - API 설계/계약/응답 포맷 -> `$ixion-patterns` (REST API Design)
   - DB 마이그레이션/스키마 변경 -> `$ixion-patterns` (DB Migrations)
   - Postgres/SQL/인덱스/RLS -> `$ixion-patterns` (Postgres Patterns)
   - Docker/Dockerfile/컨테이너 -> `$ixion-patterns` (Docker Patterns)
   - 배포/릴리즈/롤백/CI/CD -> `$ixion-patterns` (Deployment Patterns)
   - E2E/Playwright 테스트/Cypress -> `$ixion-playwright`
   - playwright-cli/브라우저 자동화/웹 스크린샷/폼 자동 입력 -> `$ixion-playwright`
   - 빌드/타입/의존성 에러 -> `$ixion-build-fix`
   - 코드 위치/흐름 파악(읽기 전용) -> `$ixion-analyze` (Deep Search 모드)
   - 환경/명령/프로젝트 진단 -> `$ixion-doctor`
   - 문서/기획/설계/정리 -> `$ixion-pdca`
   - 검증(테스트/빌드/린트) -> `$ixion-verify`
   - 리뷰 -> `$ixion-review`
   - 보안/권한 -> `$ixion-security`
   - TDD(테스트부터) -> `$ixion-tdd`
   - 학습/자산화 -> `$ixion-learn`
	   - 구현/버그/리팩터링:
	     - 작업이 넓거나 불확실 -> `$ixion-orchestrator`
	     - 도메인이 명확하고 범위가 좁음 -> `$ixion-domains`
	     - 그 외/애매함 -> `$ixion` (허브 라우팅)
2. (선택 이유) 왜 이 "주 익션"이 최적인지 1-2줄로 적는다(항상 포함).
3. (도메인 태깅) 아래 도메인이 명확하면 프롬프트에 명시한다(주 익션이 허브/오케스트레이터여도 포함).
   - 도메인: Web | App | Software | CV | Shopify
   - 도메인 프리셋을 직접 타고 싶으면: `$ixion-domains`
4. (동반 익션) 아래 조건이면 프롬프트에 "동반 단계"로 명시한다(권장 0-3개, 필요하면 0-5개).
	   - 인증/인가/입력검증/업로드/외부호출/비밀정보 -> `$ixion-security` (필수)
	   - 계약 변경/공개 API/CLI 옵션 -> `$ixion-tdd` (권장)
	   - 코드/설정 변경이면 완료 전 검증 -> `$ixion-verify` (기본 2개)
	   - 변경 후 회귀/테스트 공백 확인 -> `$ixion-review` (권장)
	   - 재사용 규칙/결정이 생김 -> `$ixion-learn` (권장)
	   - bkend 관련이면(필요할 때만): `$ixion-bkend`
5. (질문) “지금 안 물으면 실패”할 질문 1-2개만 포함한다.
6. 아래 템플릿 중 "주 익션"에 해당하는 1개를 골라, 그대로 붙여넣기 가능한 프롬프트로 완성한다.

## Templates

### Agent Executor (옵트인: 역할 기반 라우터)

```text
$ixion-agent-executor

목적:
- <왜 이걸 하는지 1-2줄>

주 익션 선택 이유:
- <왜 지금은 “역할 기반(에이전트)”으로 시작하는 게 최적인지 1-2줄>

범위(In scope):
- <반드시 포함할 것>

범위(Out of scope):
- <이번엔 하지 않을 것>

제약/가드레일:
- 작은 diff(스코프 확장 금지)
- 에이전트 모드: 작업에 맞는 ixion 스킬(주 1개 + 동반 0-3개)을 스스로 선택해서 진행
- 지금 안 물으면 실패할 질문만 1-2개

성공조건(관찰 가능하게):
- <사용자 관점 1-3개>
- <기술 관점 1-3개>

동반 익션(조건부):
- (조건부) 코드/설정 변경이면 완료 전 `$ixion-verify` (기본 2개)
- (조건부) 인증/인가/입력검증/업로드/외부호출/비밀정보 -> `$ixion-security`
- (조건부) 계약/공개 API/CLI 옵션 -> `$ixion-tdd`
- (조건부) 변경 후 회귀/테스트 공백 확인 -> `$ixion-review`
- (조건부) 재사용 규칙/결정 자산화 -> `$ixion-learn`

검증:
- 검증 커맨드가 불명확하면 먼저 `$ixion-doctor`로 추천 2개를 뽑아 실행
- 코드/설정 변경이면: 빠른 검증 2개(없으면 1개) 실행 결과로만 보고
- 읽기 전용 분석/문서 작업이면: 검증은 0-1개(필요할 때만)

요청:
- <여기에 작업 요청 원문>
```

### Default (Recommended): Hub Router

```text
$ixion

목적:
- <왜 이걸 하는지 1-2줄>

주 익션 선택 이유:
- <왜 `$ixion`(허브)로 시작하는 게 최적인지 1-2줄>

범위(In scope):
- <반드시 포함할 것>

범위(Out of scope):
- <이번엔 하지 않을 것>

제약/가드레일:
- 작은 diff(스코프 확장 금지)
- 지금 안 물으면 실패할 질문만 1-2개

성공조건(관찰 가능하게):
- <사용자 관점 1-3개>
- <기술 관점 1-3개>

동반 익션(조건부):
- (조건부) 코드/설정 변경이면 완료 전 `$ixion-verify` (기본 2개)
- (조건부) 인증/인가/입력검증/업로드/외부호출/비밀정보 -> `$ixion-security`
- (조건부) 계약/공개 API/CLI 옵션 -> `$ixion-tdd`
- (조건부) 변경 후 회귀/테스트 공백 확인 -> `$ixion-review`
- (조건부) 재사용 규칙/결정 자산화 -> `$ixion-learn`

검증:
- 검증 커맨드가 불명확하면 먼저 `$ixion-doctor`로 추천 2개를 뽑아 실행
- 코드/설정 변경이면: 빠른 검증 2개(없으면 1개) 실행 결과로만 보고
- 읽기 전용 분석/문서 작업이면: 검증은 0-1개(필요할 때만)

요청:
- <여기에 작업 요청 원문>
```

### Orchestrator (큰 작업/불확실/병렬화)

```text
$ixion-orchestrator

목적:
- <왜 이걸 하는지 1-2줄>

주 익션 선택 이유:
- <왜 `$ixion-orchestrator`가 필요한지(불확실/병렬/범위) 1-2줄>

범위(In scope):
- <반드시 포함할 것>

범위(Out of scope):
- <이번엔 하지 않을 것>

제약/가드레일:
- 작은 diff(스코프 확장 금지)
- 탐색/분할 후 2-5개 작업으로 쪼개고, 각 작업의 파일 소유권을 명확히
- 지금 안 물으면 실패할 질문만 1-2개

성공조건(관찰 가능하게):
- <사용자 관점 1-3개>
- <기술 관점 1-3개>

검증:
- 코드/설정 변경이면 완료 선언 전 `$ixion-verify` 기준으로 빠른 검증 2개(없으면 1개) 실행(테스트/빌드/린트/타입체크/스모크)

보안(조건부, 해당 시 필수):
- 인증/인가/입력검증/업로드/외부호출/비밀정보가 있으면 `$ixion-security`를 끼워서 점검

요청:
- <작업 요청 원문>
```

### PDCA (문서/기획/설계/정리)

```text
$ixion-pdca

목적:
- <문서가 필요한 이유: 합의/스펙 고정/리스크 관리>

주 익션 선택 이유:
- <왜 지금은 구현보다 문서/합의가 먼저인지 1-2줄>

범위:
- <Plan/Design/Analysis/Report 중 이번에 만들 범위>

산출물:
- `.codex/.ixion/docs/` 아래에 템플릿 기반으로 생성

성공조건:
- 읽고 끝나는 문서가 아니라, 바로 실행 가능한 체크리스트/스펙으로 정리됨

요청:
- <문서화 요청 원문>
```

### Verify (검증만 확실히)

```text
$ixion-verify

목적:
- 코드/설정 변경이면 검증 2개(없으면 1개)를 실행하고, 결과로만 보고

주 익션 선택 이유:
- <왜 지금은 구현이 아니라 검증 루프가 먼저인지 1-2줄>

검증 후보:
- <가능한 테스트/빌드/린트/타입체크 커맨드 후보 1-3개>

규칙:
- 테스트를 속이지 말 것(skip/의미없는 assert 금지)
- 실패하면 원인 수정 후 같은 커맨드로 재검증

요청:
- 이 작업/변경을 검증 루프로 그린 상태까지 확인해줘.
```

### Review (회귀/리스크/테스트 공백 중심)

```text
$ixion-review

리뷰 범위:
- <PR/브랜치/커밋 또는 변경 파일 힌트>

주 익션 선택 이유:
- <왜 지금은 구현보다 리뷰/리스크 정리가 필요한지 1-2줄>

우선순위:
- 버그/정합성, 보안/권한, 회귀 가능성, 테스트/검증 누락, 유지보수 리스크 순

요청:
- 코드 리뷰해줘. (회귀/리스크/테스트 누락 위주)
```

### Security (인증/인가/입력검증/업로드/외부호출/비밀정보)

```text
$ixion-security

위협 모델(간단히):
- 보호할 데이터:
- 공격면:

주 익션 선택 이유:
- <왜 보안 점검이 이번 작업의 병목/리스크인지 1-2줄>

요청:
- 이번 변경에서 인증/인가/입력검증/비밀정보/외부호출/업로드 관점 리스크를 점검하고, 최소 변경 수정안을 제시해줘.
```

### TDD (테스트부터)

```text
$ixion-tdd

목적:
- 계약을 테스트로 고정하고 Red-Green-Refactor로 진행

주 익션 선택 이유:
- <왜 테스트로 계약 고정이 필요한지(회귀/계약 변경) 1-2줄>

대상 계약:
- <API/함수/CLI 옵션/입출력 스키마>

검증:
- 테스트 실행 커맨드 1개를 실제로 돌리고 결과로만 보고

요청:
- 테스트부터 추가하고 구현해줘.
```

### Learn (자산화/Assistant Memory)

```text
$ixion-learn

저장 대상:
- 이번 작업에서 재사용할 규칙/결정/금지 패턴

주 익션 선택 이유:
- <왜 지금은 구현보다 자산화가 중요/긴급한지 1-2줄>

저장 위치:
- `.codex/.ixion/decisions.md` 요약
- NotebookLM `Assistant Memory` 노트 기록

요청:
- 이번 작업에서 나온 핵심 패턴/결정을 5-10줄로 자산화해줘.
```

### Doctor (프로젝트 진단/검증 커맨드 추천)

```text
$ixion-doctor

상황:
- 어떤 명령으로 테스트/빌드/린트를 돌려야 할지 모르겠음

주 익션 선택 이유:
- <왜 지금은 진단이 먼저인지(명령/환경 불명확) 1-2줄>

요청:
- 이 프로젝트에서 실행 가능한 검증 명령을 1개 추천하고(이유 포함), 대안 2개도 같이 제시해줘.
```

### Plan (요구사항 수렴/실행 계획)

```text
$ixion-pdca

모드:
- Plan 작성(요구사항 수렴/실행 계획)

목적:
- <왜 지금 계획이 필요한지 1-2줄>

주 익션 선택 이유:
- <왜 지금은 구현보다 계획/합의가 먼저인지 1-2줄>

범위(In scope):
- <이번 계획에 포함할 것>

범위(Out of scope):
- <이번 계획에서 제외할 것>

제약/가드레일:
- 질문은 한 번에 1개만(지금 안 물으면 실패할 것만)
- 코드베이스 사실은 먼저 탐색 후 질문

성공조건(관찰 가능하게):
- (산출물) 테스트 가능한 Acceptance Criteria + 구현 단계 + 리스크/대응 + 검증 커맨드 포함

요청:
- <계획/요구사항 정리 요청 원문>
```

### Analyze (원인 분석, 코드 변경 없음)

```text
$ixion-analyze

질문/증상:
- <무슨 문제가 있고, 무엇이 이상한지>

주 익션 선택 이유:
- <왜 지금은 수정이 아니라 원인 분석이 먼저인지 1-2줄>

범위:
- <어떤 모듈/기능/엔드포인트/페이지>

제약:
- 코드 변경 금지(수정이 필요하면 다음 익션을 추천만)

출력:
- Findings / Evidence / Hypotheses / Recommendation / Next actions

요청:
- <분석 요청 원문>
```

### Deep Init (AGENTS.md 생성/갱신)

```text
$ixion-deepinit

목적:
- <왜 지금 AGENTS.md가 필요한지 1-2줄>

주 익션 선택 이유:
- <왜 지금은 구현보다 코드베이스 온보딩 문서화가 먼저인지 1-2줄>

대상 범위:
- 포함 디렉토리:
- 제외 패턴: node_modules, .git, dist, build, coverage, .next, .nuxt, .venv, __pycache__

규칙:
- 루트부터 생성(부모 → 자식)
- 루트가 아닌 모든 AGENTS.md에 `<!-- Parent: ... -->` 포함
- `<!-- MANUAL -->` 아래는 보존

검증:
- `find . -name AGENTS.md -type f | sort`
- `rg -n \"<!-- Parent:\" --glob \"AGENTS.md\" .`

요청:
- <deepinit 요청 원문>
```

### Git Master (커밋/리베이스/브랜치)

```text
$ixion-git-master

목적:
- <예: 커밋을 원자적으로 쪼개기, rebase/squash, 브랜치 정리>

주 익션 선택 이유:
- <왜 지금은 코드 변경보다 git 히스토리/브랜치 작업이 필요한지 1-2줄>

제약/가드레일:
- 파괴적 작업(강제 푸시/히스토리 재작성)은 실행 전 확인 질문 필수
- 가능한 비대화형(non-interactive) 커맨드 우선

요청:
- <git 작업 요청 원문>
```

### Research (내부 코드 + 외부 문서)

```text
$ixion-research

목적:
- <무엇을 의사결정/이해하려는지 1-2줄>

주 익션 선택 이유:
- <왜 지금은 구현보다 근거 수집/정리가 먼저인지 1-2줄>

범위(In scope):
- <포함할 항목: 코드베이스 조사, 문서/웹 리서치 등>

범위(Out of scope):
- <이번엔 하지 않을 것>

산출물:
- 결론(추천 1개) + 근거(내부/외부) + 리스크/반례 + 다음 액션

요청:
- <리서치 요청 원문>
```

### Frontend UI/UX

```text
$ixion-frontend-ui-ux

목적:
- <어떤 화면/컴포넌트를 어떤 UX로 개선할지>

주 익션 선택 이유:
- <왜 지금은 기능 추가보다 UI/UX 품질 개선이 핵심인지 1-2줄>

성공조건:
- (UX) 반응형 + 로딩/에러/빈상태 포함
- (A11y) label/aria + 키보드/포커스 기본 체크 PASS
- (검증) 테스트/빌드/린트/타입체크 중 빠른 2개(없으면 1개) PASS

요청:
- <UI/UX 작업 요청 원문>
```

### API Design (REST 계약/규약)

```text
$ixion-patterns

패턴:
- REST API Design

목적:
- <어떤 API를 왜 설계하는지 1-2줄>

주 익션 선택 이유:
- <왜 지금은 구현보다 API 계약/규약 고정이 먼저인지 1-2줄>

범위(In scope):
- <엔드포인트 목록, 요청/응답 스키마, 에러 포맷, 페이지네이션/필터/정렬 등>

범위(Out of scope):
- <이번엔 하지 않을 것>

제약/가드레일:
- 질문은 지금 안 물으면 실패할 것만 1-2개
- 기존 컨벤션이 있으면 그 패턴을 우선

산출물:
- API 계약(표 또는 markdown): method/path, request, response, error, auth
- 결정/근거(1-2개)

요청:
- <API 설계 요청 원문>
```

### Database Migrations (락/다운타임/롤백)

```text
$ixion-patterns

패턴:
- DB Migrations

목적:
- <왜 마이그레이션이 필요한지 1-2줄>

주 익션 선택 이유:
- <왜 지금은 구현보다 안전한 마이그레이션 계획/순서가 먼저인지 1-2줄>

대상:
- DB: <postgres/mysql/...>
- 마이그레이션 도구/ORM: <prisma/drizzle/django/...> (알면)

변경 요약:
- <DDL 변경>
- <DML/백필 필요 여부>

가드레일:
- DDL/DML 분리
- expand/contract(파괴적 변경은 단계로 분해)
- 배포된 migration 파일 수정 금지

산출물:
- 단계별 마이그레이션 계획(배포 순서 포함)
- 위험/완화책(락/테이블 rewrite/대량 backfill)
- 검증 커맨드 1개(실행 가능한 형태)

요청:
- <마이그레이션 요청 원문>
```

### Postgres Patterns (쿼리/인덱스/RLS/락)

```text
$ixion-patterns

패턴:
- Postgres Patterns

상황:
- <증상/쿼리/테이블/트래픽 특성>

주 익션 선택 이유:
- <왜 지금은 기능 추가보다 DB 패턴/성능/안전 점검이 먼저인지 1-2줄>

작업:
- 쿼리/인덱스/RLS/락 관점으로 개선안을 제시하고, 필요하면 최소 변경 SQL/마이그레이션까지 제안해줘.

검증(가능하면 1개):
- EXPLAIN(ANALYZE) 또는 스모크 쿼리 또는 테스트/마이그레이션 적용

요청:
- <Postgres/SQL 작업 요청 원문>
```

### Docker Patterns

```text
$ixion-patterns

패턴:
- Docker Patterns

목적:
- <이미지/빌드/런타임에서 해결하려는 문제>

주 익션 선택 이유:
- <왜 지금은 코드 수정보다 Docker 구성/패턴 정리가 병목인지 1-2줄>

대상:
- Dockerfile/compose/CI 단계 중 어디를 바꾸는지

가드레일:
- 최소 변경(동작 변경 최소화)
- 런타임 권한 최소화(least privilege)

검증:
- (기본) `docker build` + 프로젝트 빌드/테스트 중 1개, 총 2개(없으면 1개) 실행 결과로만 보고

요청:
- <Docker 작업 요청 원문>
```

### Deployment Patterns (릴리즈/롤백/가드레일)

```text
$ixion-patterns

패턴:
- Deployment Patterns

목적:
- <왜 배포 패턴/가드레일이 필요한지>

주 익션 선택 이유:
- <왜 지금은 기능 추가보다 배포/운영 리스크 관리가 핵심인지 1-2줄>

산출물:
- 배포 체크리스트(빌드/테스트/릴리즈/롤백)
- 환경 변수/시크릿/권한/의존성 점검
- 검증 커맨드 1개(릴리즈 전/후)

요청:
- <배포/릴리즈 요청 원문>
```

### E2E Testing (Playwright/Cypress)

```text
$ixion-playwright

모드:
- E2E Testing

목적:
- <어떤 사용자 여정을 E2E로 고정할지>

주 익션 선택 이유:
- <왜 지금은 유닛/통합보다 E2E가 필요한지 1-2줄>

대상 여정:
- <로그인/결제/핵심 CRUD 등 1-3개>

가드레일:
- 안정적 셀렉터(`data-testid`) 우선
- 임의 sleep 금지(조건 기반 wait)
- flaky는 원인 제거가 우선, 격리는 마지막 수단

검증:
- E2E 1개 이상을 실제 실행하고 결과로만 보고

요청:
- <E2E 테스트 요청 원문>
```

### Playwright CLI (브라우저 자동화/스크린샷/추출)

```text
$ixion-playwright

모드:
- Browser Automation (playwright-cli)

목적:
- <왜 브라우저 자동화가 필요한지 1-2줄>

주 익션 선택 이유:
- <왜 지금은 코드 변경보다 실제 브라우저 재현/아티팩트가 먼저인지 1-2줄>

대상:
- URL:
- 로그인 필요 여부: <예/아니오>
- (예인 경우) 테스트 계정/환경: <있으면>

작업:
- <클릭/입력/스크린샷/PDF/텍스트 추출/네트워크 확인 등 구체적으로>

가드레일:
- 결제/삭제/권한변경 같은 돌이킬 수 없는 액션은 실행 전 1회 확인
- 페이지 상태는 `snapshot/screenshot/console/network` 같은 증거로만 판단

산출물:
- 스냅샷(`snapshot --filename=...`), 스크린샷 또는 PDF, 필요한 경우 tracing/video

요청:
- <Playwright/브라우저 자동화 요청 원문>
```

### Development Pipeline (개발 순서/Phase 가이드)

```text
$ixion-development-pipeline

목적:
- <왜 지금 “순서/phase” 가이드가 필요한지 1-2줄>

주 익션 선택 이유:
- <왜 지금은 구현이 아니라 개발 순서/다음 단계 합의가 최적인지 1-2줄>

현재 상태:
- 프로젝트 타입: <웹/앱/CLI/...>
- 있는 것: <이미 있는 문서/코드/기능>
- 없는 것: <아직 없는 핵심(용어/컨벤션/API/배포 등)>

원하는 결과:
- 9-Phase 중 지금 Phase 추정 + 다음 1-2개 Phase의 “해야 할 일/산출물”을 체크리스트로 제시해줘.

요청:
- <파이프라인/개발 순서 관련 요청 원문>
```

### Zero Script QA (로그 기반 QA)

```text
$ixion-zero-script-qa

목적:
- <왜 테스트 코드 대신 로그 기반 QA로 검증하려는지 1-2줄>

주 익션 선택 이유:
- <왜 지금은 유닛/E2E보다 로그/모니터링 기반 근거 수집이 최적인지 1-2줄>

대상:
- 서비스/컨테이너: <docker compose 서비스명 등>
- 핵심 유저 여정: <1-3개>

요청:
- 구조화 로그(JSON) 기준과 request_id 추적 기준을 제안하고,
- 실제 로그 모니터링 커맨드와 “이슈를 어떻게 문서화할지” 템플릿까지 만들어줘.
```

### Starter (초보/정적 웹 시작)

```text
$ixion-presets

프리셋:
- Starter

목적:
- <어떤 사이트/페이지를 왜 만들지 1-2줄>

주 익션 선택 이유:
- <왜 지금은 Starter 레벨(단순화/완주)이 최적인지 1-2줄>

범위(In scope):
- <페이지/섹션/기능(연락 폼 등)>

범위(Out of scope):
- <로그인/결제/관리자 등 이번엔 제외>

가드레일:
- 과한 스택/과한 설계 금지(완주 우선)
- 지금 안 물으면 실패할 질문만 1-2개

성공조건(관찰 가능하게):
- (UX) 모바일/데스크톱에서 깨지지 않음
- (검증) 빌드/린트/스모크 중 빠른 2개(없으면 1개) PASS

요청:
- <Starter 작업 요청 원문>
```

### Dynamic (bkend.ai 기반 풀스택)

```text
$ixion-presets

프리셋:
- Dynamic

목적:
- <왜 bkend 기반 풀스택이 필요한지 1-2줄>

주 익션 선택 이유:
- <왜 지금은 서버 운영 대신 BaaS로 빠르게 붙이는 게 최적인지 1-2줄>

필요 기능:
- 인증: <예/아니오> (예: 이메일/소셜/매직링크)
- 데이터: <테이블/도메인 모델>
- 파일: <예/아니오> (예: 이미지 업로드)

동반 익션(조건부, 필요할 때만):
- bkend 통합(연결/MCP/인증/데이터/스토리지) -> `$ixion-bkend`
- 완료 전 검증 -> `$ixion-verify`

요청:
- <Dynamic(bkend) 작업 요청 원문>
```

### Enterprise (운영/인프라 전제)

```text
$ixion-presets

프리셋:
- Enterprise

목적:
- <왜 엔터프라이즈 전제가 필요한지(트래픽/규모/운영/컴플라이언스) 1-2줄>

주 익션 선택 이유:
- <왜 지금은 MVP보다 운영/확장/보안 설계가 선행돼야 하는지 1-2줄>

가드레일:
- 변경은 작은 diff로 쪼개기
- 보안/권한/데이터 변경은 사전 합의(Plan/Design) 우선

동반 익션(조건부):
- 계획/합의가 먼저면 `$ixion-pdca` (Plan 작성 모드)
- 배포/롤백 패턴이면 `$ixion-patterns` (Deployment Patterns)
- 보안 점검이면 `$ixion-security`

요청:
- <Enterprise 작업 요청 원문>
```

### bkend (연결/개념/설정)

```text
$ixion-bkend

영역:
- Quickstart (연결/MCP)

목적:
- <bkend를 왜 쓰는지 1-2줄>

주 익션 선택 이유:
- <왜 지금은 기능 구현보다 bkend 연결/개념/흐름 고정이 먼저인지 1-2줄>

요청:
- Codex MCP(`mcp__bkend__*`) 연결 확인(`get_context`)부터 하고,
- 프로젝트/환경 구조(Org/Project/Env) 기준으로 다음에 할 일을 체크리스트로 제시해줘.
```

### Web

```text
$ixion-domains

도메인:
- Web

목적:
- <예: 로그인/결제/알림/대시보드>

주 익션 선택 이유:
- <왜 이 작업은 웹 프리셋으로 진행하는 게 최적인지 1-2줄>

성공조건:
- (기능) <예: 권한/에러/빈상태/로딩상태 포함>
- (검증) 테스트/빌드/린트/타입체크 중 빠른 2개(없으면 1개) PASS

보안(해당 시 필수):
- 인증/인가/입력검증/업로드/외부 호출이 있으면 `$ixion-security`도 함께 수행

요청:
- <작업 요청 원문>
```

### App (Mobile/Desktop)

```text
$ixion-domains

도메인:
- App

목적:
- <예: 로그인 폼/푸시/권한/오프라인/로컬 저장소>

주 익션 선택 이유:
- <왜 이 작업은 앱 프리셋으로 진행하는 게 최적인지 1-2줄>

성공조건:
- (기능) <권한 거절/재시도 UX, 에러 상태 포함>
- (검증) 예: `flutter test` / `flutter analyze` / `npm test` 등 빠른 2개(없으면 1개) PASS

요청:
- <작업 요청 원문>
```

### Software/CLI

```text
$ixion-domains

도메인:
- Software

목적:
- <예: CLI 옵션 추가/라이브러리 API 확장/패키징>

주 익션 선택 이유:
- <왜 이 작업은 소프트웨어/CLI 프리셋으로 진행하는 게 최적인지 1-2줄>

성공조건:
- (호환) 기존 CLI/API 깨지지 않음(또는 마이그레이션 포함)
- (검증) 테스트 또는 빌드 PASS

요청:
- <작업 요청 원문>
```

### Computer Vision

```text
$ixion-domains

도메인:
- CV

목적:
- <예: infer CLI, 전처리/후처리, 모델 교체, 평가 지표 추가>

주 익션 선택 이유:
- <왜 이 작업은 CV 프리셋으로 진행하는 게 최적인지 1-2줄>

성공조건:
- (스모크) 샘플 1-3장으로 infer 경로가 실제 실행됨
- (재현) seed/버전/config 스냅샷 또는 최소한의 기록이 남음

요청:
- <작업 요청 원문>
```

### Shopify Theme

```text
$ixion-domains

도메인:
- Shopify

목적:
- <예: 섹션/블록 옵션 추가, 템플릿 수정, 성능/접근성 개선>

주 익션 선택 이유:
- <왜 이 작업은 Shopify 테마 프리셋으로 진행하는 게 최적인지 1-2줄>

성공조건:
- (스키마) settings/schema 정상, 번역 키 누락 없음
- (검증) `shopify theme check` 또는 `shopify theme dev` 스모크 PASS

요청:
- <작업 요청 원문>
```

## Special Cases

### Build/Type Errors

```text
$ixion-build-fix

재현 커맨드:
- <예: npm run build / npx tsc --noEmit / pytest>

주 익션 선택 이유:
- <왜 지금은 리팩터링이 아니라 최소 변경 에러 해결이 최적인지 1-2줄>

제약:
- 최소 변경으로 에러만 해결(리팩터링 금지)

요청:
- 지금 깨지는 에러를 그린 상태로 만들어줘.
```

### Deep Search (Read-only)

```text
$ixion-analyze

모드:
- Deep Search (read-only)

질문:
- <예: auth 흐름 엔트리포인트부터 전부 찾아줘>

주 익션 선택 이유:
- <왜 지금은 수정이 아니라 위치/흐름 파악이 최적인지 1-2줄>

출력:
- 주요 위치, 관련 파일, 호출 관계, 다음 액션
```
