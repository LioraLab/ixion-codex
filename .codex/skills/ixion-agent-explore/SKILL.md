---
name: ixion-agent-explore
description: (Agent) 코드베이스를 읽기 전용으로 탐색해 위치/관계/근거를 빠르게 맵핑한다.
metadata:
  short-description: Agent - codebase exploration
---

# Ixion Agent: Explore

## 목표
- 코드베이스를 **읽기 전용**으로 탐색해 “주요 위치 + 관련 파일 + 호출/의존 관계 + 다음 액션”까지 한 번에 준다.

## 원문 참고(SSOT)
- OMC agent(explore): `.codex/.ixion/plugins/oh-my-claudecode/agents.codex/explore.md`
- (기능) ixion deepsearch: `.codex/skills/ixion-deepsearch/SKILL.md`

## 언제 쓰나
- “어디서 처리돼?”, “흐름이 어떻게 연결돼?”, “이 에러 어디서 나?”
- 리팩터링/기능 추가 전에 영향 범위를 잡아야 할 때

## 제약
- 파일 수정 금지(읽기 전용)
- 경로는 가능한 절대 경로로 제시(후속 작업 최소화)

## 워크플로우(추천)
1. broad: `rg`로 키워드/에러 문자열/엔드포인트/클래스명을 **여러 패턴으로 병렬** 검색
2. narrow: 상위 3-10개 파일을 읽고 import/export, 호출부를 따라간다
3. map: “엔트리포인트 → 핵심 로직 → 외부 경계(DB/API/UI)” 흐름을 요약한다
4. output: Primary locations / Related files / Key insights / Suggested next step

## 출력
- Primary locations(절대 경로 + 한 줄 설명)
- Related files
- Flow map(짧게)
- Next step(추천 익션 1개)

