---
name: ixion
description: 익션 허브. 요청을 오케스트레이션/문서화/검증/리뷰/보안/TDD/학습으로 라우팅해 Codex에서 자동화-우선 개발을 수행한다.
metadata:
  short-description: Ixion hub router
---

# Ixion (Hub)

## 목적
bkit + oh-my-claudecode + everything-claude-code의 장점을 Codex 방식(스킬 + 멀티 에이전트)으로 통합한 “익션(Extension) 스위트”의 진입점이다.

## 원문 참고(SSOT)
- bkit(문서/PDCA 템플릿): `.codex/.ixion/plugins/bkit/templates/`
- OMC(오케스트레이션/에이전트 프롬프트): `.codex/.ixion/plugins/oh-my-claudecode/skills/`, `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/`
- ECC(장기 운영 규칙/검증/학습): `.codex/.ixion/plugins/everything-claude-code/skills/`, `.codex/.ixion/plugins/everything-claude-code/rules/`

플러그인 매핑/업데이트: `.codex/.ixion/PLUGINS.md`

## 기본 전략 (추천)
- 큰 작업/불확실: `$ixion-orchestrator`
- 기능 개발 문서화: `$ixion-pdca`
- 완료 전 검증: `$ixion-verify`
- 코드 품질 점검: `$ixion-review`
- 보안 점검: `$ixion-security`
- 테스트 주도: `$ixion-tdd`
- 작업 후 학습/자산화: `$ixion-learn`
- 환경/프로젝트 진단: `$ixion-doctor`

## 라우팅 규칙
요청을 받으면 아래 중 하나로 즉시 라우팅한다(질문은 “지금 안 물으면 실패”할 때만 1-2개).
- “만들어줘/고쳐줘/리팩터링” -> `$ixion-orchestrator`
- “기획/설계/문서/정리” -> `$ixion-pdca`
- “테스트/빌드/린트/검증” -> `$ixion-verify`
- “리뷰해줘” -> `$ixion-review`
- “취약점/보안/권한” -> `$ixion-security`
- “TDD/테스트부터” -> `$ixion-tdd`
- “패턴 저장/재사용/학습” -> `$ixion-learn`
- “진단/왜 안 돼/설정” -> `$ixion-doctor`
