---
name: ixion-deepsearch
description: 코드베이스를 깊게 검색해 구현 위치/호출 관계/패턴을 맵으로 정리한다(읽기 전용).
metadata:
  short-description: Thorough codebase search
---

# Ixion Deep Search

## 목표
- 한 번의 질문에 "주요 위치 + 관련 파일 + 호출 관계 + 다음 액션"까지 한 번에 준다.
- 가능하면 follow-up 질문을 만들지 않는다.

## 언제 쓰나
- "이 기능 어디서 처리해?", "이 에러 어디서 나?", "이 흐름 어떻게 연결돼?"
- 리팩터링/기능 추가 전에 영향 범위를 파악해야 할 때

## 워크플로우
1. broad: `rg`로 키워드/에러 문자열/엔드포인트/클래스명을 여러 패턴으로 병렬 검색한다.
2. narrow: 상위 3-10개 파일을 읽고 import/export, 호출부를 따라간다.
3. map: "엔트리포인트 → 핵심 로직 → 외부 경계(DB/API/UI)" 흐름을 요약한다.
4. output: Primary locations / Related files / Key insights / Suggested next step

## 출력 규칙
- 파일 경로는 절대경로 또는 레포 기준 명확한 경로로 제시한다.
- 추측 대신 근거(검색 결과/코드 스니펫) 기반으로 말한다.

## 참고(SSOT)
- OMC deepsearch: `.codex/.ixion/plugins/oh-my-claudecode/skills/deepsearch/SKILL.md`

