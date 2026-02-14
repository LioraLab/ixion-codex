# Ixion Skill Map (한눈에 선택)

목표: 내가 하고 싶은 일을 말하면 “어떤 스킬로 시작해야 하는지”를 **한 번에** 고를 수 있게 한다.

---

## 0) 가장 빠른 선택(3개만 기억)

|상황|추천 시작 스킬|설명|
|---|---|---|
|도메인/요구가 애매함, “알아서 최적”|`$ixion`|허브 라우터. 요청을 보고 최적 ixion 스킬로 라우팅.|
|내 요청을 “붙여넣기 가능한 작업 프롬프트”로 바꾸고 싶음|`$ixion-prompt`|주 익션 1개 + 동반 익션(조건부)을 골라서 실행 프롬프트를 만들어줌.|
|“에이전트로 돌려줘” (역할 기반으로)|`$ixion-agent-executor`|Agent mode 옵트인. 에이전트가 작업에 맞는 ixion 스킬 조합으로 실행까지 밀어줌.|

---

## 1) Primary Skill 선택표(의도 → 시작 스킬)

아래에서 **주 익션(Primary)** 1개만 고르고, 필요하면 동반 익션을 붙인다.

|내가 말하는 의도(키워드)|주 익션(Primary)|동반 익션(조건부, 필요할 때만)|비고|
|---|---|---|---|
|프롬프트/요청문/템플릿 만들어줘|`$ixion-prompt`|`$ixion`|프롬프트 생성 전용(코드 수정 아님).|
|계획/요구사항/범위 합의/스펙 정리|`$ixion-pdca`|`$ixion-orchestrator`|Plan 합의 후 구현 단계로 넘김.|
|문서(Plan/Design/Analysis/Report) 남기기|`$ixion-pdca`|`$ixion-learn`|문서 템플릿 기반으로 자산화.|
|“왜 이래?” 원인 분석(코드 변경 없음)|`$ixion-analyze`|`-`|필요하면 Deep Search 모드로 위치/흐름까지 같이.|
|구조/흐름/호출 관계 찾아줘(읽기 전용)|`$ixion-analyze`|`-`|Mode: Deep Search.|
|그냥 구현/버그픽스/리팩터링(큰 작업/불확실)|`$ixion-orchestrator`|`$ixion-verify`, `$ixion-review`, `$ixion-security`|탐색→분할→구현→검증 파이프라인.|
|웹 개발(프론트/백엔드/풀스택)|`$ixion-domains`|`$ixion-security`, `$ixion-verify`, `$ixion-review`|Domain: Web. 브라우저 재현이 필요하면 `$ixion-playwright`.|
|앱 개발(모바일/데스크톱)|`$ixion-domains`|`$ixion-verify`, `$ixion-security`|Domain: App.|
|소프트웨어/CLI/라이브러리|`$ixion-domains`|`$ixion-tdd`, `$ixion-verify`, `$ixion-review`|Domain: Software.|
|Shopify 테마(Liquid/sections)|`$ixion-domains`|`$ixion-verify`|Domain: Shopify. Shopify 전용 노트북 SSOT도 병행.|
|컴퓨터비전(CV)|`$ixion-domains`|`$ixion-verify`|Domain: CV.|
|UI/UX만 집중(접근성/반응형 포함)|`$ixion-frontend-ui-ux`|`$ixion-verify`|디자인+구현+상태(로딩/에러/빈) 포함.|
|API/DB/Postgres/Docker/배포 “패턴/체크리스트”가 필요함|`$ixion-patterns`|`$ixion-security`, `$ixion-verify`, `$ixion-tdd`|필요한 패턴만 골라 적용.|
|E2E/Playwright 테스트/브라우저 자동화|`$ixion-playwright`|`$ixion-verify`|E2E면 시나리오 1개 이상 실행. 자동화면 스크린샷/트레이스/비디오 등 아티팩트 남김.|
|Git 작업(커밋/리베이스/브랜치 정리)|`$ixion-git-master`|-|안전한 원자 커밋 기본.|
|리서치/비교/근거 정리(외부 문서 포함)|`$ixion-research`|-|최신 근거/링크 중심.|
|빌드/타입/의존성 에러를 “최소 변경”으로 해결|`$ixion-build-fix`|`$ixion-verify`|리팩터링 금지, 에러만 제거.|
|검증만 확실히(테스트/빌드/린트)|`$ixion-verify`|-|실행 결과 기반으로만 PASS/FAIL.|
|리뷰만(회귀/리스크/테스트 공백)|`$ixion-review`|`$ixion-security`|수정까지면 orchestrator로.|
|보안/권한/취약점 점검|`$ixion-security`|`$ixion-verify`|인증/인가/비밀정보/업로드 포함 시 필수.|
|TDD로 진행|`$ixion-tdd`|`$ixion-verify`|Red-Green-Refactor 강제.|
|새 프로젝트에서 “뭐부터/순서/phase”|`$ixion-development-pipeline`|`$ixion-pdca`|9-Phase 가이드(+ Phase별 체크리스트 포함).|
|특정 phase 딥다이브(phase-1~9)|`$ixion-development-pipeline`|`$ixion-pdca`|Phase 번호를 지정해서 체크리스트 사용.|
|테스트 코드 없이 로그로 QA(Zero Script QA)|`$ixion-zero-script-qa`|`$ixion-playwright`|Docker 로그/구조화 로그 기반.|
|초보/비개발자, 정적 웹 중심|`$ixion-presets`|`$ixion-domains`|Preset: Starter. 완주 우선, 과한 스택 금지.|
|bkend.ai(BaaS) 연결/인증/데이터/스토리지|`$ixion-bkend`|`$ixion-presets`|Preset: Dynamic. bkend 통합 자체가 핵심일 때.|
|bkend.ai(BaaS) 기반 풀스택|`$ixion-presets`|`$ixion-bkend`, `$ixion-domains`|Preset: Dynamic. Domain: Web(대부분).|
|엔터프라이즈 전제(MSA/k8s/terraform)|`$ixion-presets`|`$ixion-pdca`, `$ixion-security`, `$ixion-patterns`|Preset: Enterprise. 초반 합의/게이트가 핵심.|

---

## 2) 동반 익션(Companion) 붙이는 규칙(실전)

|상황|동반 익션|
|---|---|
|코드 변경이 있다|`$ixion-verify` (사실상 기본값)|
|인증/인가/입력검증/파일업로드/외부호출/비밀정보가 있다|`$ixion-security` (필수)|
|계약/공개 API/CLI 옵션을 바꾼다|`$ixion-tdd` (권장)|
|변경 후 회귀/테스트 공백이 걱정된다|`$ixion-review` (권장)|
|재사용 규칙/결정/금지 패턴이 생겼다|`$ixion-learn` (권장)|

---

## 3) Agent Mode(옵트인) 선택표

Agent mode는 사용자가 “에이전트로/agent mode”를 **명시**했을 때만 권장한다.

|내 의도|추천 agent|설명|
|---|---|---|
|그냥 에이전트가 알아서 실행까지|`$ixion-agent-executor`|주 익션 1개 + 동반 익션을 스스로 골라 실행.|

---

## 4) 더 자세한 맵

- 허브 라우팅 규칙: `.codex/skills/ixion/SKILL.md`
- 프롬프트 라우터/템플릿: `.codex/skills/ixion-prompt/SKILL.md`
- 플러그인 벤더링 매핑: `.codex/.ixion/PLUGINS.md`
- 사용자용 인덱스: `.codex/.ixion/README.md`
