---
name: ixion-database-migrations
description: DB 마이그레이션을 안전하게 설계/적용한다(락/다운타임/롤백/expand-contract 포함).
metadata:
  short-description: Database migrations
---

# Ixion Database Migrations

## 목표
- 프로덕션 환경에서 안전한 스키마/데이터 마이그레이션 전략을 만든다(락/다운타임 최소화).

## 원문 참고(SSOT)
- ECC Database Migrations: `.codex/.ixion/plugins/everything-claude-code/skills/database-migrations/SKILL.md`

## 기본 규칙(요약)
- 스키마 변경(DDL)과 데이터 마이그레이션(DML)은 분리한다.
- 배포된 마이그레이션 파일은 수정하지 않는다(immutable).
- rename/drop 같은 파괴적 변경은 expand/contract로 쪼갠다.

## 산출물(권장)
- 단계별 마이그레이션 계획(배포 순서 포함)
- 위험 요소(락/테이블 rewrite/대량 backfill)와 완화책
- 롤백(또는 forward rollback) 전략
- 검증 커맨드 1개(실행 가능한 형태)

## 동반 익션(조건부)
- (권장) 실제 변경을 적용했다면: `$ixion-verify`
- (조건부) 권한/RLS/테넌시가 걸리면: `$ixion-security`
