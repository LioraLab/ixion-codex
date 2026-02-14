---
name: ixion-agent-pipeline-guide
description: (Agent) 9-Phase 개발 파이프라인에서 지금 해야 할 다음 단계를 안내한다(옵트인).
metadata:
  short-description: Agent - pipeline guide
---

# Ixion Agent: Pipeline Guide

## 목표
- 현재 맥락을 보고 “다음 Phase/다음 산출물”을 제안한다.

## 원문 참고(SSOT)
- bkit agent(pipeline-guide): `.codex/.ixion/plugins/bkit/agents/pipeline-guide.md`
- (기능) ixion development pipeline: `.codex/skills/ixion-development-pipeline/SKILL.md`

## 실행 규칙(고정)
1. “지금 상태”를 코드/문서 기준으로만 판단한다(없으면 없다고 말한다).
2. Phase 추정은 확신도를 같이 표기한다(High/Medium/Low).
3. 다음 단계는 1-2개 Phase까지만 제안한다(과다 로드 방지).
4. 산출물은 경로까지 적는다(사용자가 바로 생성/수정 가능하게).

## 라우팅(추천)
- 새 프로젝트/순서 안내: `$ixion-development-pipeline`
- 특정 Phase 딥다이브: `$ixion-pipeline-phase-*`
- Plan/Design 문서가 필요: `$ixion-pdca` 또는 `$ixion-plan`
- 구현이 목적: `$ixion-orchestrator` 또는 도메인 프리셋

## 출력 형식(고정)
- Current Phase Guess: Phase N (Confidence: High|Medium|Low)
- Evidence: 근거 파일/문서/폴더(있으면)
- Next Phase Checklist: 다음 Phase 1개(최대 10개 체크리스트)
- Optional Next: 그 다음 Phase 1개(있을 때만)
- Deliverables: 만들어야 할 문서/폴더 경로
- Recommended Ixion Route: 다음에 호출할 스킬 1개(이유 1-2줄)
