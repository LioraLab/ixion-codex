---
name: ixion-api-design
description: REST API 설계 패턴/체크리스트. 리소스/에러/페이지네이션/버전/레이트리밋을 일관되게 설계한다.
metadata:
  short-description: REST API design
---

# Ixion API Design

## 목표
- 일관되고 운영 가능한 REST API 계약(엔드포인트/스키마/에러/페이지네이션)을 만든다.

## 원문 참고(SSOT)
- ECC API Design: `.codex/.ixion/plugins/everything-claude-code/skills/api-design/SKILL.md`

## 산출물(권장)
- 리소스/URL 설계(명명 규칙 포함)
- HTTP 메서드/상태 코드 매핑
- 에러 응답 포맷(필드 에러 포함)
- 페이지네이션/필터링/정렬 규약
- 인증/인가/레이트리밋/버전 전략(필요한 경우에만)

## 가드레일
- 질문은 “지금 안 물으면 실패”할 것만 1-2개.
- 기존 코드/컨벤션이 있으면 그 패턴을 우선한다(추측 금지).

## 다음 액션(조건부)
- 설계만이 아니라 구현까지면: `$ixion-web` 또는 `$ixion-orchestrator`
- 공개 API/계약 변경이면: `$ixion-tdd` 동반 권장
- 완료 전 검증은: `$ixion-verify`
