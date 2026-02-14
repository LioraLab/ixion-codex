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
| `api-design` | `ixion-patterns` | REST API Design 패턴 섹션 |
| `database-migrations` | `ixion-patterns` | DB Migrations 패턴 섹션 |
| `postgres-patterns` | `ixion-patterns` | Postgres Patterns 패턴 섹션 |
| `docker-patterns` | `ixion-patterns` | Docker Patterns 패턴 섹션 |
| `deployment-patterns` | `ixion-patterns` | Deployment Patterns 패턴 섹션 |
| `e2e-testing` | `ixion-playwright` | Playwright(E2E + 브라우저 자동화) |

## SSOT 경로
- ECC skills SSOT: `.codex/.ixion/plugins/everything-claude-code/skills/*/SKILL.md`
- 매핑/업데이트: `.codex/.ixion/PLUGINS.md`
