---
name: ixion-bkend-quickstart
description: bkend.ai(BaaS) 개념/리소스 구조/연결 방법을 정리하고, Dynamic(서버 관리 최소) 개발 흐름으로 진입한다.
metadata:
  short-description: bkend.ai quickstart
---

# Ixion bkend Quickstart

## 목표
- bkend.ai를 “서버 운영 없이 풀스택”을 만들기 위한 백엔드로 쓸 때, 최소한의 개념/설정/흐름을 잡는다.

## 원문 참고(SSOT)
- bkit bkend-quickstart: `.codex/.ixion/plugins/bkit/skills/bkend-quickstart/SKILL.md`
- bkend 패턴: `.codex/.ixion/templates/shared/bkend-patterns.md`

## 리소스 구조(핵심)
`Organization → Project → Environment(dev/staging/prod)`

## Codex MCP 설정(권장)
- `~/.codex/config.toml`에 아래를 추가한다.
  ```toml
  [mcp_servers.bkend]
  url = "https://api.bkend.ai/mcp"
  ```
- 반영을 위해 Codex 세션 재시작이 필요할 수 있다.
- 연결 확인(권장): `mcp__bkend__get_context` 호출
  - 최초 1회 OAuth 인증을 위해 브라우저 로그인이 뜰 수 있다.

## 주의(중요)
- `mcp__bkend__*` 도구가 없거나 인증이 막히면, REST(Service API) 통합으로도 진행 가능하다(“클라이언트 코드 + 헤더 규칙” 우선 고정).

## 다음(추천)
- Dynamic 프리셋으로 진행: `$ixion-dynamic`
