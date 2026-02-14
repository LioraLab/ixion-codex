---
name: ixion-plan
description: 구현 전에 요구사항을 명확히 하고, 테스트 가능한 성공조건/리스크/검증을 포함한 실행 계획을 만든다.
metadata:
  short-description: Planning + requirements clarification
---

# Ixion Plan

## 목표
- 구현 전에 목적/범위/제약/성공조건/검증을 합의 가능한 형태로 고정한다.
- 계획은 “읽고 끝”이 아니라 **바로 실행 가능한 체크리스트**여야 한다.

## 원문 참고(SSOT)
- OMC plan: `.codex/.ixion/plugins/oh-my-claudecode/skills/plan/SKILL.md`
- OMC ralplan(합의형 플래닝): `.codex/.ixion/plugins/oh-my-claudecode/skills/ralplan/SKILL.md`

## 언제 쓰나
- 요청이 넓고 애매해서, 지금 바로 코드를 치면 스코프가 터질 때
- 여러 선택지(아키텍처/라이브러리/API 설계) 중 결정을 내려야 할 때
- “무엇을 만들지”보다 “무엇을 안 만들지”가 중요한 작업
- 높은 실패 비용(결제/보안/마이그레이션/배포)

## 쓰면 안 되는 경우
- 이미 요구사항이 명확하고 바로 구현하면 되는 경우
  - 권장: `$ixion-orchestrator`
- 문서 템플릿(PDCA)만 생성하면 되는 경우
  - 권장: `$ixion-pdca`

## 모드
- Interview(기본): 요청이 광범위하면 질문을 통해 요구사항을 수렴한다.
- Direct: 요청이 충분히 구체적이면 바로 계획을 작성한다.
- Consensus(선택): 중요도가 높으면 “계획 초안 → 비판적 검토 → 수정”을 1-3회 반복한다.
- Review(선택): 이미 있는 계획을 검토하고 보완한다.

## 인터뷰 규칙(매우 중요)
- 질문은 한 번에 1개만 한다(여러 개 묶지 않기).
- “코드베이스에서 확인 가능한 사실”은 사용자에게 묻지 말고 먼저 찾아본다.
- “지금 안 물으면 실패”할 질문만 한다.

## 계획 산출물(권장)
- 결과는 아래 항목을 포함한다.
  - Requirements Summary
  - Acceptance Criteria (테스트 가능하게)
  - Implementation Steps (가능하면 파일 힌트 포함)
  - Risks & Mitigations
  - Verification Steps (최소 1개 커맨드)
- 필요하면 `.codex/.ixion/docs/01-plan/`에 파일로 남긴다(프로젝트 자산화).

## 실행 연결
- 계획 승인 후 구현은 `$ixion-orchestrator`로 넘긴다.
- 완료 전 검증은 `$ixion-verify`를 반드시 포함한다.

