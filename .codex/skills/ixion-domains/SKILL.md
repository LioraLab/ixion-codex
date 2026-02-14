---
name: ixion-domains
description: 도메인 프리셋(웹/앱/소프트웨어/컴퓨터비전/Shopify 테마)을 한 스킬로 통합해, 도메인별 기본 흐름/체크리스트/검증 후보를 제공한다. Triggers: 웹, web, frontend, backend, fullstack, next.js, react, vue, svelte, app, mobile, flutter, react native, electron, tauri, cli, library, sdk, package, cv, opencv, yolo, shopify, liquid, theme, section, block, metafield.
metadata:
  short-description: Domain presets (Web/App/Software/CV/Shopify)
---

# Ixion Domains

## 목표
- 도메인이 명확할 때, 도메인 특유의 회귀 포인트를 “기본값 체크리스트”로 포함한다.
- 구현은 보통 `$ixion-orchestrator`로 진행하고, 검증/보안/리뷰를 동반한다.

## 선택(1개)
Web | App | Software | CV | Shopify 중 1개를 고른다.

모르면 아래 질문 1-2개로만 확정한다.
- 산출물이 브라우저에서 동작하는 웹 기능인가?
- 모바일/데스크톱 앱인가?
- CLI/라이브러리/SDK인가?
- 이미지/비디오 처리(CV)인가?
- Shopify 테마(Liquid/sections/blocks/schema)인가?

---

## Domain: Web

목표:
- 프론트/백엔드가 섞인 작업을 “작은 diff + 검증 + 기록”으로 끝까지 밀고 간다.
- API/보안/접근성/성능 같은 회귀 포인트를 기본 체크리스트로 포함한다.

언제 쓰나:
- Next.js/React/Vue/Svelte 등 프론트엔드
- API/백엔드(FastAPI/Django/Express/Nest 등)
- 풀스택 기능 추가/리팩터링/버그 수정

기본 흐름(추천):
1. 범위가 넓거나 계약이 중요한 기능이면 `$ixion-pdca`로 Plan/Design을 먼저 만든다.
2. 구현은 `$ixion-orchestrator`로 탐색→분할→최소 변경으로 진행한다.
3. 완료 선언 전 `$ixion-verify`로 빠른 검증 2개(없으면 1개)를 실행한다.
4. 회귀/테스트 공백은 `$ixion-review`로 잡는다.
5. 인증/인가/입력 검증/파일 업로드/외부 호출이 있으면 `$ixion-security`를 반드시 끼운다.
6. 작업에서 재사용될 규칙이 생기면 `$ixion-learn`으로 자산화한다.

체크리스트(최소):
- API 변경이면: 요청/응답 스키마, 에러 코드/형식, 하위호환(또는 마이그레이션), rate limit 고려
- 인증/인가면: 소유권 체크, 권한 단위, 토큰/세션 보관 위치, 로그/에러에 민감정보 노출 여부
- 프론트 UI면: 반응형, 키보드 접근, aria/label, 빈 상태/에러 상태, 로딩 상태
- 브라우저 재현/스크린샷/폼 자동 입력/웹 추출이 필요하면: `$ixion-playwright`
- 테스트를 쓰기 어렵고 Docker 로그가 있다면: `$ixion-zero-script-qa`로 로그 기반 검증 루프를 만든다.
- 성능이면: N+1, 캐시 키, 불필요한 re-render, 번들 사이즈/동적 import

검증 기본값(빠른 선택):
- Node/TS: `npm test` 또는 `npm run build` 또는 `npm run lint` 또는 `npx tsc --noEmit`
- Python: `pytest` 또는 `ruff check .` 또는 `python -m pytest`
- E2E가 있으면: Playwright/Cypress 1개 시나리오라도 스모크로 돌린다.

---

## Domain: App (Mobile/Desktop)

목표:
- 로컬에서 “실행 가능한 상태”까지 빠르게 만든다.
- 플랫폼 특유의 회귀(권한, 빌드 설정, 리소스, 릴리즈 모드)를 기본으로 체크한다.

언제 쓰나:
- React Native, Flutter, iOS/Android 네이티브
- Electron, Tauri, 데스크톱 앱
- 앱 UI/상태관리/네트워크/스토리지/푸시/권한 관련 변경

기본 흐름(추천):
1. 요구사항이 애매하면 `$ixion-orchestrator`로 탐색부터 하고, 지금 안 물으면 실패할 질문만 1-2개 한다.
2. 기능이 크면 `$ixion-pdca`로 화면 흐름/상태/에러/권한을 Design에 고정한다.
3. 구현 후 `$ixion-verify`로 빠른 검증 2개(없으면 1개)를 실행한다.
4. 변경이 민감하면 `$ixion-review`로 회귀/테스트 공백을 잡는다.
5. 입력/딥링크/웹뷰/외부 URL/파일 처리 같은 공격면이 있으면 `$ixion-security`를 끼운다.

체크리스트(최소):
- 권한: 요청 타이밍, 거절/재시도 UX, 플랫폼별 차이(iOS/Android)
- 네트워크: 오프라인/타임아웃/재시도, 에러 메시지, 백그라운드 상태
- 상태: 앱 재시작 후 복원, 캐시 무결성, race condition
- 릴리즈 모드: dev에선 되는데 release에서 깨지는 이슈(플러그인, tree-shaking, minify/proguard)
- 접근성: 폰트 스케일, 터치 타겟, 스크린리더 라벨

검증 기본값(프로젝트 타입별 후보):
- React Native: `npx react-native doctor`, `npm test`, `npm run lint`, `npx tsc --noEmit`
- Flutter: `flutter test`, `flutter analyze`, `dart format --set-exit-if-changed .`
- Electron/Tauri: `npm test`, `npm run lint`, `npm run build` (가능하면 release 빌드 1번)

참고(SSOT):
- bkit mobile/desktop app guides(참고): `.codex/.ixion/plugins/bkit/skills/mobile-app/SKILL.md`, `.codex/.ixion/plugins/bkit/skills/desktop-app/SKILL.md`

---

## Domain: Software/CLI

목표:
- “동작하는 코드” + “재사용 가능한 인터페이스” + “검증”을 같이 가져간다.
- 작은 변경으로 유지보수 가능한 형태를 우선한다.

언제 쓰나:
- CLI 도구, 라이브러리/SDK, 백그라운드 워커
- 패키징/배포/버전업/릴리즈 노트
- 멀티 플랫폼(Windows/macOS/Linux) 호환 이슈

기본 흐름(추천):
1. 계약(입출력, CLI 옵션, 공개 API)이 바뀌면 `$ixion-tdd`로 테스트를 먼저 고정한다.
2. 구현은 `$ixion-orchestrator`로 최소 변경으로 진행한다.
3. `$ixion-verify`로 빠른 검증 2개(없으면 1개)를 실행한다.
4. `$ixion-review`로 회귀/테스트 공백을 확인한다.
5. 릴리즈가 걸리면 `.codex/.ixion/decisions.md`에 버전/호환성 결정을 짧게 남긴다.

체크리스트(최소):
- CLI: `--help` 출력, exit code, stderr/stdout 구분, config/env 우선순위
- 라이브러리: 공개 API 변경 여부, semver, deprecation 경로
- 로그: 민감정보 마스킹, 로그 레벨 정책
- 크로스플랫폼: 경로 처리, 줄바꿈, 권한, 쉘 의존성

검증 후보:
- Python: `pytest`, `ruff check .`, `python -m build` (패키지면)
- Node: `npm test`, `npm run build`, `npm pack` (패키지면)
- Go: `go test ./...`, `go vet ./...`

---

## Domain: Computer Vision (CV)

목표:
- 실험 코드가 아니라 “재현 가능한 프로그램”으로 만든다.
- 데이터/모델/전처리의 계약을 코드와 테스트로 고정한다.

언제 쓰나:
- OpenCV, PyTorch/TensorFlow, YOLO/Detectron/Segmentation 등
- 이미지/비디오 입출력, 전처리/후처리, 학습/추론/평가 코드
- CV 데모/CLI/배치 파이프라인

기본 흐름(추천):
1. 목표가 연구용인지 제품용인지가 결과에 큰 영향을 주면, 그 1가지만 먼저 확인한다.
2. 코드베이스를 탐색해 현재 구조와 실행 방법을 파악한다(환경 파일, 엔트리포인트, 스크립트).
3. 변경은 “전처리/모델/후처리/IO” 경계가 섞이지 않게 최소 범위로 한다.
4. 완료 전 `$ixion-verify`로 빠른 검증 2개(없으면 1개)를 실행한다.
5. 재사용될 전처리/후처리 규칙은 `$ixion-learn`으로 자산화한다.

체크리스트(최소):
- 데이터: `data/`는 기본적으로 git에서 제외(README로 획득 방법/경로만 문서화)
- 재현성: seed, 버전(파이썬/쿠다/torch), config 스냅샷
- 입출력: 색상 공간(BGR/RGB), 좌표계, 이미지 크기, dtype/정규화
- 평가: metric 정의(mAP, IoU, F1 등)와 기준 데이터셋 고정
- 성능: 배치/스레딩/IO 병목(필요할 때만)

검증 기본값(권장 조합):
- 정적: `ruff check .` 또는 `python -m compileall .`
- 테스트: `pytest` (전처리/후처리, shape/dtype, 경계조건)
- 스모크: 샘플 1-3장으로 `infer` 경로를 실제 실행(가능하면 CPU에서도)

이미지 입력이 있을 때:
- 사용자가 이미지 파일 경로를 주면 `functions.view_image`로 먼저 확인하고, 그 다음 전처리/후처리 가정을 고정한다.

---

## Domain: Shopify (Theme / Online Store 2.0)

목표:
- 섹션/블록/템플릿 변경을 “안전하게, 빠르게, 검증까지” 끝낸다.
- 테마 특유의 회귀(설정 스키마, 번역, 접근성, 성능)를 기본으로 체크한다.

언제 쓰나:
- Shopify theme, Liquid, section, block, schema, templates, metafields
- Dawn 기반 커스터마이징, Online Store 2.0 JSON 템플릿 수정
- 테마 성능/접근성/SEO 개선

사전 지식(NotebookLM):
- Shopify 관련 작업의 “작업 메모리(재사용 지식)”는 아래 노트북을 SSOT로 관리한다.
  - SSOT 노트북: `Shopify Theme Dev & Automation`
  - Notebook ID: `776ee41f-e1df-4683-85b5-d31d20219788`

운영 원칙(추천):
- 시작: 노트북에서 유사 작업/함정/검증 커맨드가 이미 정리돼 있는지 먼저 확인한다.
- 진행: 공식 문서/레퍼런스 링크는 노트북의 Source로 추가해 “검색/요약”이 되게 만든다.
- 종료: 작업이 끝나면 노트북에 “Memory Capture”를 남긴다(재사용 가치가 큰 함정/커맨드 위주).

기본 흐름(추천):
1. (필수) `Shopify Theme Dev & Automation` 노트북을 먼저 조회해 유사 작업/함정/검증 커맨드를 확인한다.
2. 테마 구조를 먼저 확인한다(`sections/`, `templates/`, `snippets/`, `assets/`, `config/`).
3. 변경이 크면 `$ixion-pdca`로 화면/섹션 스펙과 설정(schema)을 Design에 고정한다.
4. 구현은 `$ixion-orchestrator`로 최소 변경으로 진행한다.
5. 완료 전 `$ixion-verify`로 빠른 검증 2개(없으면 1개)를 실행한다.
6. (필수) 작업 종료 시 노트북에 “Memory Capture” 노트를 남긴다.

체크리스트(최소):
- schema/settings: id 충돌, 기본값, required/limit, preset, translation 키 존재
- 템플릿: JSON 템플릿 구조 정상, section type 오타 없음
- 접근성: label/aria, 이미지 alt, 버튼/링크 구분, 키보드 포커스
- 성능: 과도한 asset 로드, render-blocking, 불필요한 JS, 이미지 크기/포맷
- 데이터: metafield 접근 시 nil/blank 처리, 안전한 출력(escape)

검증 후보(환경에 맞게 선택):
- Shopify CLI가 있으면: `shopify theme check` (또는 theme-check)
- Node 툴링이 있으면: `npm run lint`, `npm test`, `npm run build`
- 스모크: `shopify theme dev`로 프리뷰에서 수정 섹션 1-2개 핵심 시나리오 확인

---

## 참고(SSOT)
- ECC rules: `.codex/.ixion/plugins/everything-claude-code/rules/`
- OMC agent prompts: `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/`
