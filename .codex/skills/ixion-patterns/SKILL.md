---
name: ixion-patterns
description: API 설계/DB 마이그레이션/Postgres/Docker/배포 패턴을 한 스킬에서 선택적으로 적용한다. Triggers: api design, migration, postgres, docker, deployment, rollback, rls, index.
metadata:
  short-description: Engineering patterns (API/DB/Docker/Deploy)
---

# Ixion Patterns (All-in-One)

## 목표
- “패턴/체크리스트” 계열 스킬을 한 곳으로 합쳐, **필요한 체크리스트만 골라 적용**할 수 있게 한다.
- 구현을 대신하기보단, **설계/리스크/검증 루프**를 빠르게 고정하는 것이 목적이다.

## 원문 참고(SSOT)
- ECC API Design: `.codex/.ixion/plugins/everything-claude-code/skills/api-design/SKILL.md`
- ECC Database Migrations: `.codex/.ixion/plugins/everything-claude-code/skills/database-migrations/SKILL.md`
- ECC Postgres Patterns: `.codex/.ixion/plugins/everything-claude-code/skills/postgres-patterns/SKILL.md`
- ECC Docker Patterns: `.codex/.ixion/plugins/everything-claude-code/skills/docker-patterns/SKILL.md`
- ECC Deployment Patterns: `.codex/.ixion/plugins/everything-claude-code/skills/deployment-patterns/SKILL.md`

## 사용 가이드(짧게)
- 아래 중 “지금 필요한 패턴”만 선택해 적용한다(전체를 다 하지 않는다).
- 질문은 “지금 안 물으면 실패”할 것만 1-2개.
- 실제 구현/수정까지 목표면: `$ixion-domains`(Domain: Web) 또는 `$ixion-orchestrator`로 넘긴다.

---

## 1) REST API Design (Contract)

목표:
- 일관되고 운영 가능한 REST API 계약(엔드포인트/스키마/에러/페이지네이션)을 만든다.

산출물(권장):
- 리소스/URL 설계(명명 규칙 포함)
- HTTP 메서드/상태 코드 매핑
- 에러 응답 포맷(필드 에러 포함)
- 페이지네이션/필터링/정렬 규약
- (필요할 때만) 인증/인가/레이트리밋/버전 전략

동반(조건부):
- 공개 API/계약 변경이면: `$ixion-tdd` 권장
- 완료 전 검증: `$ixion-verify`

---

## 2) DB Migrations (Expand/Contract)

목표:
- 프로덕션 환경에서 안전한 스키마/데이터 마이그레이션 전략을 만든다(락/다운타임 최소화).

기본 규칙(요약):
- 스키마 변경(DDL)과 데이터 마이그레이션(DML)은 분리한다.
- 배포된 마이그레이션 파일은 수정하지 않는다(immutable).
- rename/drop 같은 파괴적 변경은 expand/contract로 쪼갠다.

산출물(권장):
- 단계별 마이그레이션 계획(배포 순서 포함)
- 위험 요소(락/테이블 rewrite/대량 backfill)와 완화책
- 롤백(또는 forward rollback) 전략
- 검증 커맨드 1개(실행 가능한 형태)

동반(조건부):
- 변경을 적용했다면: `$ixion-verify`
- 권한/RLS/테넌시가 걸리면: `$ixion-security`

---

## 3) Postgres Patterns (Perf/RLS/Lock)

목표:
- PostgreSQL 기반 시스템에서 자주 터지는 성능/락/정합성 문제를 예방하는 패턴을 적용한다.

언제 쓰나:
- 느린 쿼리, 인덱스 설계, RLS/멀티테넌시, JSONB/FTS, 큐/워커 패턴, 락/데드락 의심

출력(권장):
- Findings / Evidence / Recommendation / Verification

동반(조건부):
- 보안/권한/RLS가 핵심이면: `$ixion-security`
- 변경을 적용했다면: `$ixion-verify`

---

## 4) Docker Patterns (Build/Runtime)

목표:
- 빠르고 재현 가능한 Docker 빌드/런타임 구성을 만든다(보안/이미지 크기/캐시 효율 포함).

가드레일:
- 동작 변경 없는 최소 변경을 우선한다.
- 베이스 이미지/런타임 권한은 보수적으로(least privilege).

검증(필수):
- 가능한 경우 `docker build` 또는 프로젝트 빌드/테스트 중 1개를 실제 실행해 결과로만 보고한다.

---

## 5) Deployment Patterns (Release/Rollback)

목표:
- 배포/릴리즈 과정에서 자주 생기는 장애(환경 차이, 마이그레이션, 설정 누락)를 줄이는 패턴을 적용한다.

산출물(권장):
- 배포 단계(빌드/테스트/릴리즈/롤백) 체크리스트
- 환경 변수/시크릿/권한/네트워크 의존성 점검
- 롤백 전략 + 검증 커맨드 1개
