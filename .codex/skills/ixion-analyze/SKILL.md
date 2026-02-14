---
name: ixion-analyze
description: 코드 변경 없이 원인 분석(아키텍처/버그/성능/의존성)을 수행하고, 근거 기반 결론과 다음 액션을 제시한다.
metadata:
  short-description: Deep analysis without changes
---

# Ixion Analyze

## 목표
- “왜 이런 일이 발생하는지”를 **근거(코드/로그/설정)** 기반으로 분석한다.
- **코드는 수정하지 않는다.** (수정이 필요해지면 다음 익션을 추천한다)

## 원문 참고(SSOT)
- OMC analyze: `.codex/.ixion/plugins/oh-my-claudecode/skills/analyze/SKILL.md`

## 언제 쓰나
- “원인이 뭐야?”, “왜 이 동작이 나오지?”, “성능이 왜 느리지?” 같은 분석 요청
- 리팩터링/기능 추가 전에 영향 범위를 먼저 파악해야 할 때
- 장애/버그를 재현하지 못해도, 코드/로그로 추적 가능한 경우

## 쓰면 안 되는 경우
- 사용자가 “고쳐줘/구현해줘”를 원할 때
  - 권장: `$ixion-orchestrator` (변경 + 검증까지)
- 단순 위치 찾기만 필요할 때
  - 권장: `$ixion-deepsearch`
- 빌드/타입 에러를 최소 변경으로 해결해야 할 때
  - 권장: `$ixion-build-fix`

## 워크플로우(추천)
1. 분석 목표 고정(필수)
   - 질문/증상/관찰된 현상
   - 기대 동작
   - 범위(어떤 모듈/기능)
2. 증거 수집
   - 코드: `rg`로 엔트리포인트/관련 키워드/에러 문자열 탐색
   - 설정: env/config/build 스크립트 확인
   - 로그/스택트레이스가 있으면 반드시 포함(없으면 요청)
3. 사실 vs 가설 분리
   - 확인된 사실(코드로 증명)과 추정(가설)을 명확히 구분한다.
4. 원인 후보(1-3개) + 반례/확인 방법 제시
5. 결론(추천 1개) + 다음 액션
   - 수정이 필요하면: `$ixion-orchestrator` 또는 `$ixion-build-fix`로 전환 추천
   - 보안/권한이면: `$ixion-security`를 끼우도록 추천

## 출력 형식
- Findings (사실 기반)
- Evidence (파일 경로/근거)
- Hypotheses (가설 + 확인 실험)
- Recommendation (추천 1개)
- Next actions (다음 익션/커맨드)

