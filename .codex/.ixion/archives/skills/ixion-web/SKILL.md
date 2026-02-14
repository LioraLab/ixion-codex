---
name: ixion-web
description: 웹 개발(프론트엔드/백엔드/풀스택) 익션. 설계/구현/검증/보안/리뷰까지 한 흐름으로 묶는다.
metadata:
  short-description: Web dev workflow
---

# Ixion Web

## 목표
- 프론트/백엔드가 섞인 작업을 "작은 diff + 검증 + 기록"으로 끝까지 밀고 간다.
- API/보안/접근성/성능 같은 회귀 포인트를 기본 체크리스트로 포함한다.

## 언제 쓰나
- Next.js/React/Vue/Svelte 등 프론트엔드
- API/백엔드(FastAPI/Django/Express/Nest 등)
- 풀스택 기능 추가/리팩터링/버그 수정

## 기본 흐름(추천)
1. 범위가 넓거나 계약이 중요한 기능이면 `$ixion-pdca`로 Plan/Design을 먼저 만든다.
2. 구현은 `$ixion-orchestrator`로 탐색→분할→최소 변경으로 진행한다.
3. 완료 선언 전 `$ixion-verify`로 테스트/빌드/린트 중 최소 1개를 실행한다.
4. 회귀/테스트 공백은 `$ixion-review`로 잡는다.
5. 인증/인가/입력 검증/파일 업로드/외부 호출이 있으면 `$ixion-security`를 반드시 끼운다.
6. 작업에서 재사용될 규칙이 생기면 `$ixion-learn`으로 자산화한다.

## 웹 작업 체크리스트(최소)
- API 변경이면: 요청/응답 스키마, 에러 코드/형식, 하위호환(또는 마이그레이션), rate limit 고려
- 인증/인가면: 소유권 체크, 권한 단위, 토큰/세션 보관 위치, 로그/에러에 민감정보 노출 여부
- 프론트 UI면: 반응형, 키보드 접근, aria/label, 빈 상태/에러 상태, 로딩 상태
- 브라우저 재현/스크린샷/폼 자동 입력/웹 추출이 필요하면: `$ixion-playwright-cli`
- 테스트를 쓰기 어렵고 Docker 로그가 있다면: `$ixion-zero-script-qa`로 로그 기반 검증 루프를 만든다.
- 성능이면: N+1, 캐시 키, 불필요한 re-render, 번들 사이즈/동적 import

## 검증 기본값(빠른 선택)
- Node/TS: `npm test` 또는 `npm run build` 또는 `npm run lint` 또는 `npx tsc --noEmit`
- Python: `pytest` 또는 `ruff check .` 또는 `python -m pytest`
- E2E가 있으면: Playwright/Cypress 1개 시나리오라도 스모크로 돌린다.

## 참고(SSOT)
- ECC rules: `.codex/.ixion/plugins/everything-claude-code/rules/`
- OMC agent prompts: `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/`
