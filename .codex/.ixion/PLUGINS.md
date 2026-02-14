# 플러그인 벤더링 & 익션 매핑

이 문서는 익션이 참조/재사용하는 3개 플러그인(bkit, oh-my-claudecode, everything-claude-code)을 `.codex/.ixion/plugins/` 아래에 벤더링해 두고, “어떤 파일을 익션이 무엇에 쓰는지”를 **경로 중심으로** 정리한다.

목표는 하나다: **플러그인이 업데이트되면 익션도 빠르게 따라가게 만들기.**

---

## 1) 플러그인 위치(SSOT)

- bkit: `.codex/.ixion/plugins/bkit/`
- oh-my-claudecode: `.codex/.ixion/plugins/oh-my-claudecode/`
- everything-claude-code: `.codex/.ixion/plugins/everything-claude-code/`

익션 스킬은 가능한 얇게 유지하고, 위 경로의 파일을 “원문(SSOT)”으로 참조한다.

---

## 2) 익션이 실제로 쓰는 것(매핑)

### 2.1 bkit → 문서/템플릿 + 개발 파이프라인/레벨 프리셋 + 에이전트

익션에서 사용하는 형태:
- **SSOT**: `.codex/.ixion/plugins/bkit/templates/`
- **실사용 복사본(derived)**: `.codex/.ixion/templates/`
  - 복사 이유: 익션의 고정 경로를 유지하고, 플러그인 업데이트 후 재동기화로 반영하기 위함
  - 동기화 스크립트: `.codex/.ixion/scripts/sync-from-plugins.sh`

주요 파일:
- `.codex/.ixion/plugins/bkit/templates/plan.template.md` → `.codex/skills/ixion-pdca/SKILL.md`
- `.codex/.ixion/plugins/bkit/templates/design*.template.md` → `.codex/skills/ixion-pdca/SKILL.md`
- `.codex/.ixion/plugins/bkit/templates/analysis.template.md` → `.codex/skills/ixion-pdca/SKILL.md`
- `.codex/.ixion/plugins/bkit/templates/report.template.md` → `.codex/skills/ixion-pdca/SKILL.md`
- `.codex/.ixion/plugins/bkit/templates/pipeline/*.template.md` → `.codex/skills/ixion-pdca/SKILL.md`

#### 2.1.1 bkit Skills → ixion 스킬

개발 파이프라인/Phase:
- `.codex/.ixion/plugins/bkit/skills/development-pipeline/SKILL.md` → `.codex/skills/ixion-development-pipeline/SKILL.md`
- `.codex/.ixion/plugins/bkit/skills/phase-1-schema/SKILL.md` → `.codex/skills/ixion-development-pipeline/SKILL.md` (Phase 1 section)
- `.codex/.ixion/plugins/bkit/skills/phase-2-convention/SKILL.md` → `.codex/skills/ixion-development-pipeline/SKILL.md` (Phase 2 section)
- `.codex/.ixion/plugins/bkit/skills/phase-3-mockup/SKILL.md` → `.codex/skills/ixion-development-pipeline/SKILL.md` (Phase 3 section)
- `.codex/.ixion/plugins/bkit/skills/phase-4-api/SKILL.md` → `.codex/skills/ixion-development-pipeline/SKILL.md` (Phase 4 section)
- `.codex/.ixion/plugins/bkit/skills/phase-5-design-system/SKILL.md` → `.codex/skills/ixion-development-pipeline/SKILL.md` (Phase 5 section)
- `.codex/.ixion/plugins/bkit/skills/phase-6-ui-integration/SKILL.md` → `.codex/skills/ixion-development-pipeline/SKILL.md` (Phase 6 section)
- `.codex/.ixion/plugins/bkit/skills/phase-7-seo-security/SKILL.md` → `.codex/skills/ixion-development-pipeline/SKILL.md` (Phase 7 section)
- `.codex/.ixion/plugins/bkit/skills/phase-8-review/SKILL.md` → `.codex/skills/ixion-development-pipeline/SKILL.md` (Phase 8 section)
- `.codex/.ixion/plugins/bkit/skills/phase-9-deployment/SKILL.md` → `.codex/skills/ixion-development-pipeline/SKILL.md` (Phase 9 section)

Zero Script QA:
- `.codex/.ixion/plugins/bkit/skills/zero-script-qa/SKILL.md` → `.codex/skills/ixion-zero-script-qa/SKILL.md`

레벨 프리셋(선택):
- `.codex/.ixion/plugins/bkit/skills/starter/SKILL.md` → `.codex/skills/ixion-presets/SKILL.md` (Starter)
- `.codex/.ixion/plugins/bkit/skills/dynamic/SKILL.md` → `.codex/skills/ixion-presets/SKILL.md` (Dynamic)
- `.codex/.ixion/plugins/bkit/skills/enterprise/SKILL.md` → `.codex/skills/ixion-presets/SKILL.md` (Enterprise)

bkend.ai(선택):
- `.codex/.ixion/plugins/bkit/skills/bkend-quickstart/SKILL.md` → `.codex/skills/ixion-bkend/SKILL.md` (Quickstart section)
- `.codex/.ixion/plugins/bkit/skills/bkend-auth/SKILL.md` → `.codex/skills/ixion-bkend/SKILL.md` (Auth section)
- `.codex/.ixion/plugins/bkit/skills/bkend-data/SKILL.md` → `.codex/skills/ixion-bkend/SKILL.md` (Data section)
- `.codex/.ixion/plugins/bkit/skills/bkend-storage/SKILL.md` → `.codex/skills/ixion-bkend/SKILL.md` (Storage section)
- `.codex/.ixion/plugins/bkit/skills/bkend-cookbook/SKILL.md` → `.codex/skills/ixion-bkend/SKILL.md` (Cookbook section)

기타(통합/참고):
- `.codex/.ixion/plugins/bkit/skills/bkit-rules/SKILL.md` → `.codex/skills/ixion-core/SKILL.md` (가드레일 참고)
- `.codex/.ixion/plugins/bkit/skills/bkit-templates/SKILL.md` → `.codex/skills/ixion-pdca/SKILL.md` (템플릿 경로 참고)
- `.codex/.ixion/plugins/bkit/skills/code-review/SKILL.md` → `.codex/skills/ixion-review/SKILL.md` (리뷰 관점 참고)
- `.codex/.ixion/plugins/bkit/skills/mobile-app/SKILL.md`, `.codex/.ixion/plugins/bkit/skills/desktop-app/SKILL.md` → `.codex/skills/ixion-domains/SKILL.md` (Domain: App, 참고용)
- `.codex/.ixion/plugins/bkit/skills/claude-code-learning/SKILL.md` → Claude Code 전용(참고만)

#### 2.1.2 bkit Agents (SSOT만 유지)

SSOT: `.codex/.ixion/plugins/bkit/agents/*.md`

운영 방침:
- 스킬 표면적을 줄이기 위해, bkit의 개별 agent 프롬프트를 `.codex/skills/ixion-agent-*`로 전부 노출하지 않는다.
- 필요 시 `$ixion-agent-executor`가 기능 스킬(주 1개 + 동반 0-3개) 조합으로 실행한다.
- bkit agent 프롬프트는 “참고/설계 기준(SSOT)”으로만 유지한다.

#### 2.1.3 bkit 기타 디렉토리(참고/부분 이식)

- output styles(참고): `.codex/.ixion/plugins/bkit/output-styles/`
- system knowledge base(참고): `.codex/.ixion/plugins/bkit/bkit-system/` → `.codex/skills/ixion-bkit-system/SKILL.md`에서 네비게이션 제공
- commands(참고): `.codex/.ixion/plugins/bkit/commands/`
- hooks/scripts(Claude Code 전용 자동화 포함): `.codex/.ixion/plugins/bkit/hooks/`, `.codex/.ixion/plugins/bkit/scripts/`
  - Codex에서는 동일 자동 훅을 재현하기 어렵다.
  - 대신 ixion 스킬 가드레일(`ixion-core`, `ixion-verify`, `ixion-review`)로 “수동 적용”한다.

### 2.2 oh-my-claudecode(OMC) → 오케스트레이션 패턴

익션에서 사용하는 형태:
- “Codex 네이티브 멀티 에이전트(spawn_agent)”로 **재구현**하되,
  - OMC의 팀 파이프라인/스테이징 개념을 SSOT로 참고한다.

주요 파일:
- `.codex/.ixion/plugins/oh-my-claudecode/skills/team/SKILL.md` → `.codex/skills/ixion-orchestrator/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/skills/autopilot/SKILL.md` → `.codex/skills/ixion-orchestrator/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/skills/pipeline/SKILL.md` → `.codex/skills/ixion-orchestrator/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/skills/ultrawork/SKILL.md` → `.codex/skills/ixion-orchestrator/SKILL.md` (선택 참고)
- `.codex/.ixion/plugins/oh-my-claudecode/skills/ralph/SKILL.md` → `.codex/skills/ixion-orchestrator/SKILL.md` (선택 참고)
- `.codex/.ixion/plugins/oh-my-claudecode/skills/ultraqa/SKILL.md` → `.codex/skills/ixion-verify/SKILL.md` (선택 참고)
- `.codex/.ixion/plugins/oh-my-claudecode/skills/git-master/SKILL.md` → `.codex/skills/ixion-git-master/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/skills/research/SKILL.md` → `.codex/skills/ixion-research/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/skills/frontend-ui-ux/SKILL.md` → `.codex/skills/ixion-frontend-ui-ux/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/skills/deepinit/SKILL.md` → `.codex/skills/ixion-deepinit/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/skills/analyze/SKILL.md` → `.codex/skills/ixion-analyze/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/skills/plan/SKILL.md` → `.codex/skills/ixion-pdca/SKILL.md` (Plan 작성 모드)
- `.codex/.ixion/plugins/oh-my-claudecode/skills/ralplan/SKILL.md` → `.codex/skills/ixion-pdca/SKILL.md` (합의형 플래닝 개념 참고)
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/*.md` → 역할/출력 기준 참고(익션 오케스트레이션 설계의 기준점)

### 2.2.1 oh-my-claudecode(OMC) → 에이전트 프롬프트(Agent-as-Skill)

익션에서 사용하는 형태:
- 스킬 표면적을 줄이기 위해, OMC의 개별 agent 프롬프트를 `.codex/skills/ixion-agent-*`로 전부 노출하지 않는다.
- 에이전트 모드(옵트인) 진입점은 `$ixion-agent-executor` 1개로 유지한다.
- SSOT는 OMC Codex 변환본(`.codex/.ixion/plugins/oh-my-claudecode/agents.codex/`)을 참고한다.

주요 파일:
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/executor.md` → `.codex/skills/ixion-agent-executor/SKILL.md`

### 2.3 everything-claude-code(ECC) → 장기 운영(검증/보안/TDD/학습)

익션에서 사용하는 형태:
- ECC의 “검증/보안/TDD/학습” 스킬을 SSOT로 두고, 익션 스킬은 이를 실행하도록 래핑한다.

주요 파일:
- 검증:
  - `.codex/.ixion/plugins/everything-claude-code/skills/verification-loop/SKILL.md` → `.codex/skills/ixion-verify/SKILL.md`
- TDD:
  - `.codex/.ixion/plugins/everything-claude-code/skills/tdd-workflow/SKILL.md` → `.codex/skills/ixion-tdd/SKILL.md`
- 보안:
  - `.codex/.ixion/plugins/everything-claude-code/skills/security-review/SKILL.md` → `.codex/skills/ixion-security/SKILL.md`
  - `.codex/.ixion/plugins/everything-claude-code/skills/security-scan/SKILL.md` → `.codex/skills/ixion-security/SKILL.md`
- 학습/자산화:
  - `.codex/.ixion/plugins/everything-claude-code/skills/continuous-learning-v2/SKILL.md` → `.codex/skills/ixion-learn/SKILL.md`
- 코어 가드레일 참고:
  - `.codex/.ixion/plugins/everything-claude-code/skills/coding-standards/SKILL.md` → `.codex/skills/ixion-core/SKILL.md`
  - `.codex/.ixion/plugins/everything-claude-code/rules/common/` → `.codex/skills/ixion-core/SKILL.md` (참고용)
- 패턴/가이드(선택):
  - `.codex/.ixion/plugins/everything-claude-code/skills/api-design/SKILL.md` → `.codex/skills/ixion-patterns/SKILL.md` (REST API Design)
  - `.codex/.ixion/plugins/everything-claude-code/skills/database-migrations/SKILL.md` → `.codex/skills/ixion-patterns/SKILL.md` (DB Migrations)
  - `.codex/.ixion/plugins/everything-claude-code/skills/postgres-patterns/SKILL.md` → `.codex/skills/ixion-patterns/SKILL.md` (Postgres Patterns)
  - `.codex/.ixion/plugins/everything-claude-code/skills/docker-patterns/SKILL.md` → `.codex/skills/ixion-patterns/SKILL.md` (Docker Patterns)
  - `.codex/.ixion/plugins/everything-claude-code/skills/deployment-patterns/SKILL.md` → `.codex/skills/ixion-patterns/SKILL.md` (Deployment Patterns)
  - `.codex/.ixion/plugins/everything-claude-code/skills/e2e-testing/SKILL.md` → `.codex/skills/ixion-playwright/SKILL.md`

### 2.3.1 everything-claude-code(ECC) → 에이전트 프롬프트(Agent-as-Skill)

익션에서 사용하는 형태:
- 스킬 표면적을 줄이기 위해, ECC의 개별 agent 프롬프트를 `.codex/skills/ixion-agent-*`로 전부 노출하지 않는다.
- 에이전트 모드(옵트인) 진입점은 `$ixion-agent-executor` 1개로 유지한다.
- SSOT는 `.codex/.ixion/plugins/everything-claude-code/agents/*.md`를 참조한다.

주요 파일:
- `.codex/.ixion/plugins/everything-claude-code/agents/*.md` → `$ixion-agent-executor` 설계/출력 포맷 참고(SSOT)

### 2.4 도메인 프리셋(ixion-*) → 실전 워크플로우(앱/웹/CV/Shopify)

익션에서 사용하는 형태:
- 도메인별 체크리스트/검증 후보를 얇게 제공하고,
- 실제 구현/검증/리뷰는 기존 익션(`ixion-orchestrator`, `ixion-verify`, `ixion-review`, `ixion-security`, `ixion-tdd`)을 재사용한다.

스킬:
- `.codex/skills/ixion-prompt/SKILL.md`
- `.codex/skills/ixion-domains/SKILL.md`
- `.codex/skills/ixion-presets/SKILL.md`
- `.codex/skills/ixion-analyze/SKILL.md` (Deep Search 모드)
- `.codex/skills/ixion-build-fix/SKILL.md`

참고:
- Shopify 테마 지식베이스는 NotebookLM `Shopify Theme Dev & Automation`(ID: `776ee41f-e1df-4683-85b5-d31d20219788`)를 우선 조회한다.
- CV는 이미지 입력이 있는 경우 `functions.view_image`로 실제 입력을 먼저 확인한다.
- build/type 에러 해결 패턴은 ECC의 build-error-resolver/commands를 SSOT로 참고한다.

### 2.5 로컬 스킬 이식(선택)

익션은 플러그인(SSOT)을 주로 사용하지만, 사용자 로컬 스킬을 ixion 스킬로 “이식”해 재사용할 수도 있다.

주요 파일:
- `.codex/skills/ixion-playwright/` (Playwright(E2E + 브라우저 자동화/playwright-cli), 이식/통합 완료)

---

## 3) 업데이트 워크플로우(권장)

### 3.1 플러그인 업데이트

```bash
git -C .codex/.ixion/plugins/bkit pull --rebase
git -C .codex/.ixion/plugins/oh-my-claudecode pull --rebase
git -C .codex/.ixion/plugins/everything-claude-code pull --rebase
```

한 번에 실행:
```bash
bash .codex/.ixion/scripts/update-plugins.sh
```

### 3.2 익션 동기화(필수)

```bash
bash .codex/.ixion/scripts/sync-from-plugins.sh
```

이 단계에서 수행되는 일:
- bkit 템플릿을 `.codex/.ixion/templates/`로 재복사
- 플러그인 버전 스냅샷을 `.codex/.ixion/PLUGIN-VERSIONS.md`로 갱신

### 3.3 깨짐 체크(가끔 필요)
- 플러그인에서 파일 경로/이름이 바뀌면, 아래 파일의 “원문 참고(SSOT)” 경로를 업데이트한다.
  - `.codex/skills/ixion-*.SKILL.md`

---

## 4) 원칙
- 익션은 “새 프레임워크”가 아니라 **플러그인 SSOT를 실행/조합하는 얇은 레이어**다.
- 따라서 업데이트 대응은:
  - 플러그인 업데이트 → 동기화 스크립트 실행 → (필요 시) 익션 SSOT 경로만 조정
  로 끝나게 만든다.
