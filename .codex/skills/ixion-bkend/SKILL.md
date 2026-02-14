---
name: ixion-bkend
description: bkend.ai(BaaS) 통합을 위한 개념/연결(MCP)/인증/데이터/스토리지/예제 패턴을 한 스킬로 정리한다. Triggers: bkend, bkend.ai, BaaS, mcp__bkend, dynamic.
metadata:
  short-description: bkend.ai all-in-one
---

# Ixion bkend (All-in-One)

## 목표
- bkend.ai를 “운영 최소” 백엔드로 쓸 때 필요한 **최소 개념 + 연결 + 인증/데이터/스토리지 패턴**을 한 곳에 모은다.
- 작업 중 “bkend 관련해서 어디를 봐야 하지?”를 줄인다.

## 원문 참고(SSOT)
- bkit bkend-quickstart/auth/data/storage/cookbook:
  - `.codex/.ixion/plugins/bkit/skills/bkend-quickstart/SKILL.md`
  - `.codex/.ixion/plugins/bkit/skills/bkend-auth/SKILL.md`
  - `.codex/.ixion/plugins/bkit/skills/bkend-data/SKILL.md`
  - `.codex/.ixion/plugins/bkit/skills/bkend-storage/SKILL.md`
  - `.codex/.ixion/plugins/bkit/skills/bkend-cookbook/SKILL.md`
- bkend 패턴: `.codex/.ixion/templates/shared/bkend-patterns.md`

## 0) 리소스 구조(핵심)
`Organization → Project → Environment(dev/staging/prod)`

## 1) 연결/시작 (Quickstart)

### Codex MCP 설정(권장)
- `~/.codex/config.toml`에 아래를 추가한다.
  ```toml
  [mcp_servers.bkend]
  url = "https://api.bkend.ai/mcp"
  ```
- 반영을 위해 Codex 세션 재시작이 필요할 수 있다.
- 연결 확인(권장): `mcp__bkend__get_context` 호출
  - 최초 1회 OAuth 인증을 위해 브라우저 로그인이 뜰 수 있다.

### 막히면(중요)
- `mcp__bkend__*` 도구가 없거나 인증이 막히면, REST(Service API) 통합으로도 진행 가능하다.
  - 이 경우 “클라이언트 코드 + 헤더 규칙”을 먼저 고정한다(추측 금지).

## 2) 인증 (Auth)

목표(최소):
- 토큰 수명/갱신/저장 위치(클라이언트)와 권한 모델(RBAC/RLS)을 먼저 고정한다.
- 인증 흐름을 API/프론트에 일관되게 반영한다.

체크리스트(최소):
- 세션/토큰 저장 위치(쿠키 vs 로컬스토리지) + 만료/갱신 규칙
- “로그인 했는가”와 “권한이 있는가”를 분리(인증 vs 인가)
- 멀티테넌시가 있으면 RLS 기준(tenant_id 등)을 초반에 고정

## 3) 데이터 (Data)

목표(최소):
- 테이블/필드/제약(required/unique/default)을 먼저 정하고, CRUD 계약을 고정한다.
- 리스트 응답(페이지네이션)과 id 필드(`id`) 규칙을 일관되게 사용한다.

체크리스트(최소):
- PK/FK/unique 인덱스 필요 여부
- list API: 필터/정렬/페이지네이션 규약(커서/오프셋)
- soft delete/하드 delete 정책

## 4) 스토리지 (Storage)

목표(최소):
- “프리사인드 URL 발급 → PUT 업로드 → 메타데이터 등록” 흐름을 표준화한다.
- 가시성(public/private/protected/shared)에 따른 URL/권한 모델을 명확히 한다.

체크리스트(최소):
- 파일 타입/크기 제한(클라 + 서버)
- 공개 범위 정책(기본 private 권장)
- 업로드 후 메타데이터(소유자/만료/콘텐츠 타입) 등록 여부

## 5) 예제/트러블슈팅 (Cookbook)

언제 쓰나:
- “예제 프로젝트 흐름으로 빠르게 만들고 싶다”
- “401/403/429 같은 흔한 오류를 빨리 분류하고 싶다”

권장:
- 실패 케이스(권한 없음/만료/레이트리밋)를 먼저 재현 가능한 형태로 고정한다.
- API 에러 포맷이 흔들리면, 먼저 `$ixion-patterns`의 “REST API Design”으로 계약을 고정한다.
