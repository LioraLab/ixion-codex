---
name: ixion-doctor
description: Codex 프로젝트 진단 익션. 테스트/빌드/린트 경로를 찾고, 반복 실패 원인을 줄이기 위한 기본 점검을 수행한다.
metadata:
  short-description: Project diagnostics
---

# Ixion Doctor

## 목표
자동화-우선 개발에서 “환경/스크립트/명령 불명확” 때문에 멈추는 시간을 줄인다.

## 원문 참고(SSOT)
- ECC 설치/구성 가이드: `.codex/.ixion/plugins/everything-claude-code/skills/configure-ecc/SKILL.md`
- OMC Doctor: `.codex/.ixion/plugins/oh-my-claudecode/skills/doctor/SKILL.md`

## 진단 항목
- 프로젝트 타입 추정: Node/Python/Go/기타
- 실행 가능한 검증 명령 후보 찾기
  - Node: `npm test`, `pnpm test`, `bun test`, `npm run lint`, `npm run build`
  - Python: `pytest`, `python -m pytest`, `ruff`, `mypy`
  - Go: `go test ./...`, `golangci-lint run`
- 리포지토리 구조: 주요 엔트리/패키지 파일 존재 여부

## 출력
- 추천 검증 명령 1개(최소) + 대안 2개
- “다음부터 자동화가 잘 되려면” 추가하면 좋은 파일/규칙(필요할 때만)
