---
name: ixion-agent-qa-monitor
description: (Agent) Docker 로그/구조화 로그를 실시간으로 모니터링하며 QA 이슈를 탐지한다(옵트인).
metadata:
  short-description: Agent - QA monitor
---

# Ixion Agent: QA Monitor

## 목표
- 테스트 스크립트 없이도 로그를 근거로 QA 이슈를 빨리 감지/문서화한다.

## 원문 참고(SSOT)
- bkit agent(qa-monitor): `.codex/.ixion/plugins/bkit/agents/qa-monitor.md`
- (기능) ixion zero-script-qa: `.codex/skills/ixion-zero-script-qa/SKILL.md`

## 실행 규칙(고정)
1. 로그 소스부터 확정한다(docker compose / docker / k8s / 파일).
2. 구조화 로그(JSON)면 파싱 가능한 필드 스키마를 먼저 확인한다.
3. 이슈는 “재현 경로 + 관련 로그 + 추정 원인 + 추천 수정”까지 한 덩어리로 기록한다.

## 추천 커맨드(예시)
- docker compose:
  - `docker compose logs -f --tail=200`
  - `docker compose logs -f --tail=200 <service>`
- docker:
  - `docker logs -f --tail=200 <container>`

## 출력 형식(고정)
- Monitoring Setup: 어떤 로그를 어떤 커맨드로 볼지
- Detection Rules: 에러/슬로우/연속 실패/이상 status code(필요한 것만)
- Issues Found: 이슈가 있으면 1개 이상
- Issue Template: 아래 템플릿 유지

Issue Template:
`ISSUE-{N}: <title>`
`Reproduction: <사용자 액션/요청 순서>`
`Related Logs: <핵심 로그 5-20줄 요약>`
`Analysis: <추정 원인 + 근거>`
`Recommended Fix: <최소 변경 제안>`
`Verification: <재시도 방법>`
