---
name: ixion-bkend-data
description: bkend.ai 데이터 모델/테이블/CRUD/필터/정렬/페이지네이션 및 인덱스 설계 패턴을 적용한다.
metadata:
  short-description: bkend.ai data patterns
---

# Ixion bkend Data

## 원문 참고(SSOT)
- bkit bkend-data: `.codex/.ixion/plugins/bkit/skills/bkend-data/SKILL.md`
- bkend 패턴: `.codex/.ixion/templates/shared/bkend-patterns.md`

## 목표(최소)
- 테이블/필드/제약(required/unique/default)을 먼저 정하고, CRUD 계약을 고정한다.
- 리스트 응답(페이지네이션)과 id 필드(`id`) 규칙을 일관되게 사용한다.

