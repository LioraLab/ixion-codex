---
name: ixion-bkit-system
description: bkit 플러그인의 구성요소(templates/skills/agents/output-styles/hooks/scripts/system)를 ixion 관점에서 찾아 쓰기 쉽게 안내한다.
metadata:
  short-description: bkit plugin map (for ixion)
---

# Ixion bkit System Map

## 목적
- bkit 플러그인 안의 “무엇을 어디에 써야 하는지”를 ixion 기준으로 빠르게 찾는다.

## 원문(SSOT)
- 플러그인 루트: `.codex/.ixion/plugins/bkit/`
- 템플릿(derived copy): `.codex/.ixion/templates/` (동기화: `.codex/.ixion/scripts/sync-from-plugins.sh`)

## 구성요소 매핑(요약)
- templates/ → `$ixion-pdca`, `$ixion-development-pipeline` (+ phase 스킬들)
- skills/ → ixion 스킬로 이식(개발 파이프라인/phase/레벨 프리셋/bkend 등)
- agents/ → `ixion-agent-*`로 이식(옵트인)
- output-styles/ → Codex에서 “자동 적용”은 어렵고, 출력 포맷 참고용(문서)
- hooks/, scripts/ → Claude Code 전용 자동화가 섞여 있어 Codex에선 참고/수동 실행 중심
- bkit-system/ → 철학/트리거/시나리오 지식베이스(참고)

