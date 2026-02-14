---
name: ixion-frontend-ui-ux
description: 프론트엔드 UI/UX 변경을 디자인 품질과 구현 품질(접근성/반응형/검증)까지 포함해 끝낸다.
metadata:
  short-description: Frontend UI/UX workflow
---

# Ixion Frontend UI/UX

## 목표
- UI/UX 변경을 "보이는 것"뿐 아니라 접근성/반응형/상태(로딩/에러/빈상태)까지 포함해 완료한다.
- 기존 디자인 시스템/패턴이 있으면 최대한 존중하고, 없으면 일관된 스타일 방향을 먼저 잡는다.

## 원문 참고(SSOT)
- OMC frontend-ui-ux: `.codex/.ixion/plugins/oh-my-claudecode/skills/frontend-ui-ux/SKILL.md`

## 언제 쓰나
- 컴포넌트/페이지 UI 구현 및 리디자인
- 반응형/접근성 개선
- 디자인 시스템 정리(토큰/컴포넌트 일관성)
- "겉보기만 고친 UI"가 아니라 실제 UX 품질까지 올려야 할 때

## 워크플로우(추천)
1. 대상/맥락 고정
   - 어디를 바꾸는지(페이지/컴포넌트/라우트)
   - 사용자 플로우(진입/성공/실패)
2. 요구사항 최소 체크
   - 반응형(모바일/데스크톱)
   - 상태: 로딩/에러/빈상태
   - 접근성: label/aria, 키보드, 포커스, 대비
3. 구현(작은 diff 우선)
4. 검증(기본 2개, 없으면 1개)
   - 예: `npm test` + `npm run lint` (또는 `npm run build`, `npx tsc --noEmit`)
5. 리뷰(권장)
   - 변경이 넓으면 `$ixion-review`로 회귀/테스트 공백 점검

## 출력(보고) 형식
- 변경 요약: 컴포넌트/페이지 단위
- UX 체크: 반응형/상태/접근성 항목 PASS 여부
- 검증: 실행한 커맨드와 결과 요약
