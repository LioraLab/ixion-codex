---
name: ixion-software
description: 일반 소프트웨어/라이브러리/CLI 개발 익션. 패키징, 인터페이스 안정성, 릴리즈, 회귀 방지를 우선한다.
metadata:
  short-description: Software/CLI workflow
---

# Ixion Software

## 목표
- "동작하는 코드" + "재사용 가능한 인터페이스" + "검증"을 같이 가져간다.
- 작은 변경으로 유지보수 가능한 형태를 우선한다.

## 언제 쓰나
- CLI 도구, 라이브러리/SDK, 백그라운드 워커
- 패키징/배포/버전업/릴리즈 노트
- 멀티 플랫폼(Windows/macOS/Linux) 호환 이슈

## 기본 흐름(추천)
1. 계약(입출력, CLI 옵션, 공개 API)이 바뀌면 `$ixion-tdd`로 테스트를 먼저 고정한다.
2. 구현은 `$ixion-orchestrator`로 최소 변경으로 진행한다.
3. `$ixion-verify`로 테스트/빌드/린트 중 최소 1개를 실행한다.
4. `$ixion-review`로 회귀/테스트 공백을 확인한다.
5. 릴리즈가 걸리면 `.codex/.ixion/decisions.md`에 버전/호환성 결정을 짧게 남긴다.

## 소프트웨어 체크리스트(최소)
- CLI: `--help` 출력, exit code, stderr/stdout 구분, config/env 우선순위
- 라이브러리: 공개 API 변경 여부, semver, deprecation 경로
- 로그: 민감정보 마스킹, 로그 레벨 정책
- 크로스플랫폼: 경로 처리, 줄바꿈, 권한, 쉘 의존성

## 검증 후보
- Python: `pytest`, `ruff check .`, `python -m build` (패키지면)
- Node: `npm test`, `npm run build`, `npm pack` (패키지면)
- Go: `go test ./...`, `go vet ./...`

## 참고(SSOT)
- ECC rules: `.codex/.ixion/plugins/everything-claude-code/rules/`

