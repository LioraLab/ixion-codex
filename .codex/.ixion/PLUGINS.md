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
- `.codex/.ixion/plugins/oh-my-claudecode/skills/ultraqa/SKILL.md` → `.codex/skills/ixion-verify/SKILL.md` (선택 참고)
- `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/*.md` → 역할/출력 기준 참고(익션 오케스트레이션 설계의 기준점)

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
