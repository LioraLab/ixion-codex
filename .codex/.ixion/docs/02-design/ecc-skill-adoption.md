# ECC 스킬 적용 맵 (Ixion)

목표: everything-claude-code(ECC)의 `skills/*/SKILL.md` 중 ixion에 직접 도움이 되는 것을 “얇은 래퍼 스킬”로 적용한다.

## 기본 원칙
- SSOT는 ECC 플러그인의 경로다.
- ixion 스킬은 “실행/조합 레이어”로 얇게 유지한다.

## ECC core skills -> Ixion skills (2026-02-14)

| ECC skill | Ixion skill | 비고 |
|---|---|---|
| `verification-loop` | `ixion-verify` | 검증 루프(최소 1개 실행, 근거 기반 보고) |
| `security-review`, `security-scan` | `ixion-security` | 인증/인가/입력검증/비밀정보/외부호출 중심 |
| `tdd-workflow` | `ixion-tdd` | Red-Green-Refactor |
| `continuous-learning-v2` | `ixion-learn` | 결정/패턴 자산화 + Assistant Memory |
| `coding-standards` (+ rules/common) | `ixion-core` | 작은 diff/검증/기록 가드레일 |

## ECC pattern/guides -> Ixion skills (선택 적용)

| ECC skill | Ixion skill | 목적 |
|---|---|---|
| `api-design` | `ixion-api-design` | REST API 계약/규약 고정 |
| `database-migrations` | `ixion-database-migrations` | 안전한 마이그레이션 계획/순서 |
| `postgres-patterns` | `ixion-postgres-patterns` | 인덱스/RLS/락/쿼리 패턴 |
| `docker-patterns` | `ixion-docker-patterns` | Dockerfile/빌드/캐시/권한 |
| `deployment-patterns` | `ixion-deployment-patterns` | 배포/롤백/가드레일 |
| `e2e-testing` | `ixion-e2e-testing` | E2E 구조/실행/CI 아티팩트 |

## SSOT 경로
- ECC skills SSOT: `.codex/.ixion/plugins/everything-claude-code/skills/*/SKILL.md`
- 매핑/업데이트: `.codex/.ixion/PLUGINS.md`
