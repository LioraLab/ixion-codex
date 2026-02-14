---
name: ixion-postgres-patterns
description: PostgreSQL 쿼리/인덱스/RLS/락/JSONB 등 운영 패턴을 적용해 성능과 안정성을 높인다.
metadata:
  short-description: Postgres patterns
---

# Ixion Postgres Patterns

## 목표
- PostgreSQL 기반 시스템에서 자주 터지는 성능/락/정합성 문제를 예방하는 패턴을 적용한다.

## 원문 참고(SSOT)
- ECC Postgres Patterns: `.codex/.ixion/plugins/everything-claude-code/skills/postgres-patterns/SKILL.md`

## 언제 쓰나
- 느린 쿼리, 인덱스 설계, RLS/멀티테넌시, JSONB/FTS, 큐/워커 패턴, 락/데드락 의심

## 출력(권장)
- Findings / Evidence / Recommendation / Verification

## 동반 익션(조건부)
- (조건부) 보안/권한/RLS가 핵심이면: `$ixion-security`
- (권장) 변경을 적용했다면: `$ixion-verify`
