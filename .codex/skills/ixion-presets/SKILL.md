---
name: ixion-presets
description: (Preset) Starter/Dynamic(bkend)/Enterprise 레벨 프리셋을 한 스킬로 제공해, 프로젝트 제약(초보/운영 최소/운영 전제)에 맞는 기본 가드레일/동반 익션을 고정한다. Triggers: preset, 프리셋, starter, dynamic, enterprise, 초보, 운영 최소, bkend, BaaS, 엔터프라이즈, k8s, kubernetes, terraform.
metadata:
  short-description: Level presets (Starter/Dynamic/Enterprise)
---

# Ixion Presets (Level)

## 목표
- “내 상황(레벨/운영 전제)”에 맞는 기본 가드레일과 동반 익션을 빠르게 고정한다.
- 이 스킬은 구현 스킬이 아니라 **진입점/선택/체크리스트** 역할을 한다.

## 언제 쓰나
- 초보/비개발자/정적 웹으로 “완주”가 최우선 → Starter
- 서버 운영 없이 로그인/DB/파일이 필요한 MVP → Dynamic(bkend.ai)
- MSA/k8s/terraform/운영·보안·컴플라이언스 전제 → Enterprise

## 선택(1개)
Starter | Dynamic | Enterprise 중 1개를 고른다.

모르면 아래 3문장 중 맞는 걸 고른다.
- “완주가 최우선이고 스택을 단순화하고 싶다” → Starter
- “서버 운영 없이 인증/DB/스토리지를 빨리 붙이고 싶다” → Dynamic
- “운영/확장/보안을 초반부터 전제로 해야 한다” → Enterprise

---

## Preset: Starter

목표:
- “작게 시작해서 끝까지 완주”할 수 있는 수준으로 스코프/구조/검증을 단순화한다.

가드레일(추천):
- 과한 스택/과한 설계 금지(완주 우선)
- 지금 안 물으면 실패할 질문만 1-2개
- 완료 전 최소 1개 검증(`$ixion-verify`)

같이 쓰기(권장):
- 웹이면: `$ixion-domains` (Domain: Web)
- UI가 중요하면: `$ixion-frontend-ui-ux`
- 문서화가 필요하면: `$ixion-pdca`

---

## Preset: Dynamic (bkend.ai)

목표:
- 인증/데이터/파일을 “운영 최소”로 붙여 MVP를 빠르게 만든다.

같이 쓰기(권장):
- bkend 통합(개념/연결/MCP/인증/데이터/스토리지/예제): `$ixion-bkend`
- (조건부) 웹 UI/풀스택이면: `$ixion-domains` (Domain: Web)
- 완료 전 검증: `$ixion-verify`
- (조건부) 인증/인가/업로드/외부 호출이 있으면: `$ixion-security`

---

## Preset: Enterprise

목표:
- 운영/확장/보안을 “나중에 붙이는 비용”을 줄이기 위해, 초반에 문서/계약/인프라 경계를 잡는다.

같이 쓰기(권장):
- 계획/합의가 먼저면: `$ixion-pdca` (Plan 작성 모드)
- 패턴/가드레일: `$ixion-patterns` (Deployment/DB/API 등 필요한 것만)
- 보안 점검: `$ixion-security`
- 완료 전 검증: `$ixion-verify`

---

## 원문 참고(SSOT)
- bkit starter/dynamic/enterprise:
  - `.codex/.ixion/plugins/bkit/skills/starter/SKILL.md`
  - `.codex/.ixion/plugins/bkit/skills/dynamic/SKILL.md`
  - `.codex/.ixion/plugins/bkit/skills/enterprise/SKILL.md`
