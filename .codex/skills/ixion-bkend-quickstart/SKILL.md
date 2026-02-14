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

## 주의(중요)
- Codex 세션에 bkend MCP 서버가 연결돼 있지 않으면 `mcp__bkend__*` 도구는 존재하지 않을 수 있다.
- 이 경우에도 REST(Service API)로는 통합할 수 있으니, “클라이언트 코드 + 헤더 규칙”을 우선 고정한다.

## 다음(추천)
- Dynamic 프리셋으로 진행: `$ixion-dynamic`

