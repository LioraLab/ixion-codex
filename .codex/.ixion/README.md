# Ixion (익션) - Codex용 Extension Suite

이 리포지토리에서 "익션"은 Codex에서 재사용 가능한 작업 단위(주로 `.codex/skills/*`)를 의미한다.

## 목표
- AI 오케스트레이션으로 사용자 개입 최소화
- 장기 유지에 적합한 가드레일(검증/기록/작은 diff)
- 개발 과정의 계획/문서화/개발 스킬을 최대한 적용

## 원문(SSOT) 소스
- bkit: `.codex/.ixion/plugins/bkit/` (특히 `templates/`)
  - 현재 `.codex/.ixion/templates/`는 bkit 템플릿을 그대로 복사해 사용한다.
- OMC: `.codex/.ixion/plugins/oh-my-claudecode/` (특히 `skills/`, `agents.codex/`)
- ECC: `.codex/.ixion/plugins/everything-claude-code/` (특히 `skills/`, `rules/`, `agents/`)

## 업데이트
- 매핑 문서: `.codex/.ixion/PLUGINS.md`
- 플러그인 + 템플릿 동기화(권장):
  - `bash .codex/.ixion/scripts/update-plugins.sh`
  - 또는 플러그인별 `git pull` 후 `bash .codex/.ixion/scripts/sync-from-plugins.sh`
- 현재 스냅샷: `.codex/.ixion/PLUGIN-VERSIONS.md`

## 익션 목록
- `$ixion`: 허브(라우터)
- `$ixion-core`: 기본 규칙과 가드레일
- `$ixion-orchestrator`: 멀티 에이전트 파이프라인(탐색-구현-검증)
- `$ixion-pdca`: 문서화(Plan/Design/Analysis/Report)
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
