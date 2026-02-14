---
name: ixion-research
description: 코드베이스와 외부 문서를 함께 조사해 근거 기반으로 요약/권고안을 만든다.
metadata:
  short-description: Evidence-based research
---

# Ixion Research

## 목표
- 질문 1개에 대해 "근거(내부 코드 + 외부 문서)"가 있는 답을 만든다.
- 결과를 재사용 가능하게 남긴다(NotebookLM 노트북/노트, 필요 시 로컬 문서).

## 원문 참고(SSOT)
- OMC research: `.codex/.ixion/plugins/oh-my-claudecode/skills/research/SKILL.md`
- OMC pipeline(research preset 참고): `.codex/.ixion/plugins/oh-my-claudecode/skills/pipeline/SKILL.md`

## 언제 쓰나
- 기술/아키텍처 선택을 해야 할 때(대안 비교 포함)
- 외부 API/SDK/툴 도입 전, 문서 기반으로 빠르게 핵심을 잡아야 할 때
- 코드베이스에서 특정 동작/흐름을 "설명 가능한 수준"으로 문서화해야 할 때
- 팀/미래의 나를 위해 조사 내용을 자산화해야 할 때

## 워크플로우(추천)
1. 목표 고정(2-4줄)
   - 목적
   - 범위(In/Out)
   - 성공조건(관찰 가능)
2. 내부 근거(코드베이스)
   - 코드 위치/흐름 파악이 목표면: `$ixion-analyze` (Deep Search 모드)
   - 변경까지 이어질 가능성이 크면: `$ixion-orchestrator`로 탐색 단계 포함
3. 외부 근거(문서/웹)
   - NotebookLM을 사용해 소스를 모으고 요약/질의를 수행한다.
   - 기본은 `notebooklm-mcp`(research_start/import/query)로 처리한다.
4. 교차 검증
   - 내부 코드 현실과 외부 문서의 전제/버전이 충돌하는지 확인한다.
5. 산출물
   - 결론(추천안 1개) + 근거 + 리스크/트레이드오프 + 다음 액션
6. 메모리/자산화
   - 작업 도메인별 SSOT 노트북이 있으면 그곳에 남긴다.
   - 전역 규칙/결정이면 `Assistant Memory`에 2-5줄 요약을 남긴다.

## 출력 형식(권장)
- 결론(추천 1개):
- 근거(내부):
- 근거(외부):
- 리스크/반례:
- 다음 액션:
