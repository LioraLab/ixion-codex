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

### 2.1 bkit → 문서/템플릿(PDCA + Pipeline)

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
- `.codex/.ixion/plugins/oh-my-claudecode/skills/plan/SKILL.md` → `.codex/skills/ixion-plan/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/skills/ralplan/SKILL.md` → `.codex/skills/ixion-plan/SKILL.md` (합의형 모드 참고)
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/*.md` → 역할/출력 기준 참고(익션 오케스트레이션 설계의 기준점)

### 2.2.1 oh-my-claudecode(OMC) → 에이전트 프롬프트(Agent-as-Skill)

익션에서 사용하는 형태:
- Codex에는 Claude Code처럼 “고정된 agent 타입”이 없으므로, `ixion-agent-*` 스킬로 역할 엔트리포인트를 만든다.
- 역할(에이전트) 엔트리포인트는 **옵트인**이다. 사용자가 “에이전트로/agent mode/agent로”를 명시했거나 `$ixion-agent-*`를 직접 호출하는 경우에만 추천/사용한다(기본은 기능 기반 ixion 스킬 라우팅).
- SSOT는 OMC의 Codex 변환본(`.codex/.ixion/plugins/oh-my-claudecode/agents.codex/`)을 참조한다.

주요 파일:
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/explore.md` → `.codex/skills/ixion-agent-explore/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/architect.md` → `.codex/skills/ixion-agent-architect/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/executor.md` → `.codex/skills/ixion-agent-executor/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/build-fixer.md` → `.codex/skills/ixion-agent-build-fixer/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/code-reviewer.md` → `.codex/skills/ixion-agent-code-reviewer/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/security-reviewer.md` → `.codex/skills/ixion-agent-security-reviewer/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/verifier.md` → `.codex/skills/ixion-agent-verifier/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/planner.md` → `.codex/skills/ixion-agent-planner/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/analyst.md` → `.codex/skills/ixion-agent-analyst/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/critic.md` → `.codex/skills/ixion-agent-critic/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/writer.md` → `.codex/skills/ixion-agent-writer/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/designer.md` → `.codex/skills/ixion-agent-designer/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/researcher.md` → `.codex/skills/ixion-agent-researcher/SKILL.md`
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/git-master.md` → `.codex/skills/ixion-agent-git-master/SKILL.md`

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
  - `.codex/.ixion/plugins/everything-claude-code/skills/api-design/SKILL.md` → `.codex/skills/ixion-api-design/SKILL.md`
  - `.codex/.ixion/plugins/everything-claude-code/skills/database-migrations/SKILL.md` → `.codex/skills/ixion-database-migrations/SKILL.md`
  - `.codex/.ixion/plugins/everything-claude-code/skills/postgres-patterns/SKILL.md` → `.codex/skills/ixion-postgres-patterns/SKILL.md`
  - `.codex/.ixion/plugins/everything-claude-code/skills/docker-patterns/SKILL.md` → `.codex/skills/ixion-docker-patterns/SKILL.md`
  - `.codex/.ixion/plugins/everything-claude-code/skills/deployment-patterns/SKILL.md` → `.codex/skills/ixion-deployment-patterns/SKILL.md`
  - `.codex/.ixion/plugins/everything-claude-code/skills/e2e-testing/SKILL.md` → `.codex/skills/ixion-e2e-testing/SKILL.md`

### 2.3.1 everything-claude-code(ECC) → 에이전트 프롬프트(Agent-as-Skill)

익션에서 사용하는 형태:
- ECC의 `agents/*.md`를 역할 기반 엔트리포인트(스킬)로 제공한다.
- 에이전트형 엔트리포인트는 **옵트인**이다. 사용자가 “에이전트로/agent mode/agent로”를 명시했거나 `$ixion-agent-*`를 직접 호출하는 경우에만 추천/사용한다(기본은 기능 기반 ixion 스킬 라우팅).
- SSOT는 `.codex/.ixion/plugins/everything-claude-code/agents/*.md`를 참조한다.

주요 파일:
- (역할 확장 SSOT) `.codex/.ixion/plugins/everything-claude-code/agents/architect.md` → `.codex/skills/ixion-agent-architect/SKILL.md`
- (역할 확장 SSOT) `.codex/.ixion/plugins/everything-claude-code/agents/build-error-resolver.md` → `.codex/skills/ixion-agent-build-fixer/SKILL.md`
- (역할 확장 SSOT) `.codex/.ixion/plugins/everything-claude-code/agents/code-reviewer.md` → `.codex/skills/ixion-agent-code-reviewer/SKILL.md`
- (역할 확장 SSOT) `.codex/.ixion/plugins/everything-claude-code/agents/security-reviewer.md` → `.codex/skills/ixion-agent-security-reviewer/SKILL.md`
- (역할 확장 SSOT) `.codex/.ixion/plugins/everything-claude-code/agents/planner.md` → `.codex/skills/ixion-agent-planner/SKILL.md`

- `.codex/.ixion/plugins/everything-claude-code/agents/database-reviewer.md` → `.codex/skills/ixion-agent-database-reviewer/SKILL.md`
- `.codex/.ixion/plugins/everything-claude-code/agents/doc-updater.md` → `.codex/skills/ixion-agent-doc-updater/SKILL.md`
- `.codex/.ixion/plugins/everything-claude-code/agents/e2e-runner.md` → `.codex/skills/ixion-agent-e2e-runner/SKILL.md`
- `.codex/.ixion/plugins/everything-claude-code/agents/refactor-cleaner.md` → `.codex/skills/ixion-agent-refactor-cleaner/SKILL.md`
- `.codex/.ixion/plugins/everything-claude-code/agents/go-build-resolver.md` → `.codex/skills/ixion-agent-go-build-resolver/SKILL.md`
- `.codex/.ixion/plugins/everything-claude-code/agents/go-reviewer.md` → `.codex/skills/ixion-agent-go-reviewer/SKILL.md`
- `.codex/.ixion/plugins/everything-claude-code/agents/python-reviewer.md` → `.codex/skills/ixion-agent-python-reviewer/SKILL.md`
- `.codex/.ixion/plugins/everything-claude-code/agents/tdd-guide.md` → `.codex/skills/ixion-agent-tdd-guide/SKILL.md`

### 2.4 도메인 프리셋(ixion-*) → 실전 워크플로우(앱/웹/CV/Shopify)

익션에서 사용하는 형태:
- 도메인별 체크리스트/검증 후보를 얇게 제공하고,
- 실제 구현/검증/리뷰는 기존 익션(`ixion-orchestrator`, `ixion-verify`, `ixion-review`, `ixion-security`, `ixion-tdd`)을 재사용한다.

스킬:
- `.codex/skills/ixion-prompt/SKILL.md`
- `.codex/skills/ixion-web/SKILL.md`
- `.codex/skills/ixion-app/SKILL.md`
- `.codex/skills/ixion-software/SKILL.md`
- `.codex/skills/ixion-cv/SKILL.md`
- `.codex/skills/ixion-shopify/SKILL.md`
- `.codex/skills/ixion-deepsearch/SKILL.md`
- `.codex/skills/ixion-build-fix/SKILL.md`

참고:
- Shopify 테마 지식베이스는 NotebookLM `Shopify Theme Dev & Automation`(ID: `776ee41f-e1df-4683-85b5-d31d20219788`)를 우선 조회한다.
- CV는 이미지 입력이 있는 경우 `functions.view_image`로 실제 입력을 먼저 확인한다.
- build/type 에러 해결 패턴은 ECC의 build-error-resolver/commands를 SSOT로 참고한다.

### 2.5 로컬 스킬 이식(선택)

익션은 플러그인(SSOT)을 주로 사용하지만, 사용자 로컬 스킬을 ixion 스킬로 “이식”해 재사용할 수도 있다.

주요 파일:
- `.codex/skills/ixion-playwright-cli/` (Playwright CLI 브라우저 자동화 스킬, 이식 완료)

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
