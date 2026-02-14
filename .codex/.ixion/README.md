# Ixion (익션) - Codex용 Extension Suite

이 리포지토리에서 "익션"은 Codex에서 재사용 가능한 작업 단위(주로 `.codex/skills/*`)를 의미한다.

## 목표
- AI 오케스트레이션으로 사용자 개입 최소화
- 장기 유지에 적합한 가드레일(검증/기록/작은 diff)
- 개발 과정의 계획/문서화/개발 스킬을 최대한 적용

## 원문(SSOT) 소스
- bkit: `.codex/.ixion/plugins/bkit/` (`templates/`, `skills/`, `agents/`, `bkit-system/`)
  - 현재 `.codex/.ixion/templates/`는 bkit 템플릿을 그대로 복사해 사용한다.
- OMC: `.codex/.ixion/plugins/oh-my-claudecode/` (특히 `skills/`, `agents.codex/`)
- ECC: `.codex/.ixion/plugins/everything-claude-code/` (특히 `skills/`, `rules/`, `agents/`)

## 업데이트
- 매핑 문서: `.codex/.ixion/PLUGINS.md`
- 플러그인 + 템플릿 동기화(권장):
  - `bash .codex/.ixion/scripts/update-plugins.sh`
  - 또는 플러그인별 `git pull` 후 `bash .codex/.ixion/scripts/sync-from-plugins.sh`
- 현재 스냅샷: `.codex/.ixion/PLUGIN-VERSIONS.md`

## 한눈에 고르기(추천)
익션을 “어떤 걸로 시작해야 하지?”가 애매할 때는 아래 문서를 먼저 본다.

- 스킬 선택표(치트시트): `.codex/.ixion/SKILL-MAP.md`

## NotebookLM (지식 축적)
- 프로젝트 지식 베이스(이 레포 전용): `ixion-codex` (Notebook ID: `c50d8a9e-cdc6-44df-8e38-337aca318165`)
  - 익션/스킬/에이전트/플러그인 이식/운영 방식은 앞으로 이 노트북에 축적한다.
- 개인 장기 기억(프로젝트 공통): `Assistant Memory` (Notebook ID: `b55e441a-295e-4b80-8818-e05f75cdba31`)

## 익션 목록
- `$ixion`: 허브(라우터)
- `$ixion-prompt`: ixion을 잘 타도록 "작업 프롬프트(요청문)"를 생성
- `$ixion-bkit-system`: bkit 플러그인 맵(templates/skills/agents/hooks/scripts/system 네비게이션)
- `$ixion-development-pipeline`: 9-Phase 개발 파이프라인(뭐부터/순서/다음 단계)
- `$ixion-zero-script-qa`: 테스트 코드 없이 로그 기반 QA(구조화 로그/모니터링)
- `$ixion-presets`: (프리셋) Starter/Dynamic/Enterprise 레벨 선택
- `$ixion-bkend`: bkend.ai 통합(개념/연결/MCP/인증/데이터/스토리지/예제)
- `$ixion-analyze`: 코드 변경 없이 원인 분석 + 코드 위치/흐름 탐색(Deep Search)
- `$ixion-deepinit`: 계층형 AGENTS.md 생성/갱신(코드베이스 온보딩)
- `$ixion-git-master`: Git 작업(원자 커밋/리베이스/히스토리 정리)
- `$ixion-research`: 리서치(내부 코드 + 외부 문서 근거 정리)
- `$ixion-frontend-ui-ux`: 프론트엔드 UI/UX(반응형/접근성/상태 포함)
- `$ixion-patterns`: 패턴/체크리스트 묶음(API 설계/DB 마이그레이션/Postgres/Docker/배포)
- `$ixion-playwright`: Playwright(E2E + 브라우저 자동화/playwright-cli)
- `$ixion-domains`: 도메인 프리셋(Web/App/Software/CV/Shopify)
- `$ixion-build-fix`: 빌드/타입 에러 최소 수정으로 해결
- `$ixion-core`: 기본 규칙과 가드레일
- `$ixion-orchestrator`: 멀티 에이전트 파이프라인(탐색-구현-검증)
- `$ixion-pdca`: 문서화(Plan/Design/Analysis/Report) + Plan 작성 모드(요구사항/범위 합의)
- `$ixion-verify`: 검증 루프(테스트/빌드/린트)
- `$ixion-review`: 코드 리뷰(회귀/리스크/테스트 누락)
- `$ixion-security`: 보안/권한 점검
- `$ixion-tdd`: TDD 루프(Red-Green-Refactor)
- `$ixion-learn`: 학습/자산화(결정/패턴 기록 + Assistant Memory)
- `$ixion-doctor`: 프로젝트 진단(검증 명령 추천)

## 사용법(Quick Start)

### 1) 기본
대부분은 그냥 `$ixion`으로 시작한다. 익션이 요청을 보고 필요한 익션으로 라우팅한다.

예시:
```text
$ixion 로그인 기능 추가해줘. (JWT + RBAC, 테스트 포함)
```

### 1.1) 에이전트형 엔트리포인트(선택)
역할(Agent) 기반은 **옵트인**이다. 사용자가 “에이전트로/agent mode/agent로”를 명시한 경우에만 `$ixion-agent-executor`로 진입한다.
지원 역할 목록/매핑은 `.codex/.ixion/PLUGINS.md`를 기준으로 한다.

예시:
```text
$ixion-agent-executor 결제 플로우 버그 고쳐줘. 검증까지.
$ixion-analyze 왜 이 API가 500을 내는지 원인 분석해줘. (코드 변경 없음)
$ixion-review 이 PR 변경사항 리뷰해줘. (회귀/리스크/테스트 공백 위주)
```

도메인 프리셋 예시:
```text
$ixion-domains (도메인: Shopify) 상품 카드 섹션에 배지(badge) 옵션 추가해줘. (접근성 포함)
$ixion-domains (도메인: CV) 이미지 1장 입력받아 객체 탐지 결과를 JSON으로 출력하는 CLI 만들어줘.
$ixion-domains (도메인: App) Flutter에서 로그인 폼 UI + 입력 검증 + 에러 상태까지 구현해줘.
```

### 2) 새 기능(문서화 포함) 권장 흐름
```text
$ixion-pdca {feature} 계획/설계 문서부터 만들어줘.
$ixion-orchestrator 그 문서 기준으로 구현해줘.
$ixion-verify 테스트/빌드/린트로 검증해줘.
$ixion-review 리뷰해줘(회귀/리스크/테스트 누락 위주).
$ixion-learn 이번 작업에서 배운 규칙을 자산화해줘.
```

### 3) 빠른 버그픽스(자동화 우선)
```text
$ixion-orchestrator 에러 로그 기준으로 원인 찾아서 최소 수정으로 고쳐줘. 검증까지.
```

### 4) 보안/권한 작업
```text
$ixion-security 이 변경에서 인증/인가/비밀정보/입력검증 리스크를 점검해줘.
```

### 5) TDD로 진행
```text
$ixion-tdd 테스트부터 만들고 구현해줘. (Red-Green-Refactor)
```

## 산출물 위치
- 문서: `.codex/.ixion/docs/`
- 템플릿: `.codex/.ixion/templates/` (bkit에서 동기화되는 derived copy)
- 결정 로그: `.codex/.ixion/decisions.md`
- 실행 상태/체크포인트(선택): `.codex/.ixion/state/`

## 호환 alias
- (삭제됨) `$my-workflow`
- (삭제됨) `$cc-workflow-ai-editor`
