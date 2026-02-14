---
name: ixion-bkend-auth
description: bkend.ai 인증(이메일/소셜/매직링크), JWT/세션, RBAC/RLS 설계와 통합 패턴을 적용한다.
metadata:
  short-description: bkend.ai auth patterns
---

# Ixion bkend Auth

## 원문 참고(SSOT)
- bkit bkend-auth: `.codex/.ixion/plugins/bkit/skills/bkend-auth/SKILL.md`
- bkend 패턴: `.codex/.ixion/templates/shared/bkend-patterns.md`

## 목표(최소)
- 토큰 수명/갱신/저장 위치(클라이언트)와 권한 모델(RBAC/RLS)을 먼저 고정한다.
- 인증 흐름을 API/프론트에 일관되게 반영한다.

