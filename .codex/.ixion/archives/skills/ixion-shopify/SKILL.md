---
name: ixion-shopify
description: Shopify Online Store 2.0 테마 개발 익션. Liquid/sections/blocks/schema, 접근성/성능, theme check, Shopify CLI 기반 검증까지 포함한다.
metadata:
  short-description: Shopify theme workflow
---

# Ixion Shopify (Theme)

## 목표
- 섹션/블록/템플릿 변경을 "안전하게, 빠르게, 검증까지" 끝낸다.
- 테마 특유의 회귀(설정 스키마, 번역, 접근성, 성능)를 기본으로 체크한다.

## 언제 쓰나
- Shopify theme, Liquid, section, block, schema, templates, metafields
- Dawn 기반 커스터마이징, Online Store 2.0 JSON 템플릿 수정
- 테마 성능/접근성/SEO 개선

## 사전 지식(NotebookLM)

Shopify 관련 작업의 "작업 메모리(재사용 지식)"는 아래 노트북을 SSOT로 관리한다.

- SSOT 노트북: `Shopify Theme Dev & Automation`
- Notebook ID: `776ee41f-e1df-4683-85b5-d31d20219788`

전역(Shopify 밖에서도 재사용) 규칙/결정이 나오면:
- 로컬: `.codex/.ixion/decisions.md`
- 장기 기억(메타): NotebookLM `Assistant Memory`
에도 2-5줄로 요약을 남긴다. (Shopify 상세 내용은 SSOT 노트북에 남긴다)

### 운영 원칙(추천)

- 시작: 노트북에서 유사 작업/함정/검증 커맨드가 이미 정리돼 있는지 먼저 확인한다.
- 진행: 공식 문서/레퍼런스 링크는 노트북의 Source로 추가해 "검색/요약"이 되게 만든다. (예: theme-check 규칙, Liquid 문서, metafields 문서)
- 진행: 작업 중 결정/함정/패턴은 노트(Note)로 남겨 다음 작업에서 재사용 가능하게 만든다.
- 종료: 작업이 끝나면 "Memory Capture"를 남긴다(아래 템플릿). 재사용 가치가 크면 "Playbook" 노트에도 1-3줄로 증류한다.

### 메모리 구조(권장: Capture -> Distill)

- Capture(매 작업): 아래 "Memory Capture" 노트 1개 생성
- Distill(재사용 가치 있을 때): `Ixion Shopify Playbook` 노트에 규칙/함정/검증 커맨드를 1-3줄로 누적

권장 Playbook 노트 제목:
- `Ixion Shopify Playbook (Evergreen)`

### NotebookLM MCP 사용(옵션, 자동화용)

- 참고/레퍼런스 링크를 남길 때: `mcp__notebooklm-mcp__source_add` (source_type=`url`)
- 작업 메모를 남길 때: `mcp__notebooklm-mcp__note` (action=`create`/`update`)
- 노트북 소스 기반으로 질문할 때: `mcp__notebooklm-mcp__notebook_query`

### Memory Capture 템플릿(노트)

아래 형식으로 `Shopify Theme Dev & Automation` 노트북에 노트를 생성한다.

권장 제목 규칙:
- `[Ixion][Shopify][Theme][YYYY-MM-DD] <작업명>`

```text
목적:
- <왜 이걸 했는지 1-2줄>

변경 요약:
- <무엇이 바뀌었는지 2-5줄>

핵심 파일/경로:
- <sections/... / templates/... / snippets/... / assets/... / config/...>

스키마/번역 체크:
- settings/schema 변경:
- locales 번역 키 추가/수정:

Shopify 특이사항/함정(Gotchas):
- <다음에 같은 문제 안 밟게 1-5개>

검증:
- 실행 커맨드:
- 결과:

결정/트레이드오프:
- <왜 이렇게 했는지, 대안은 뭐였는지>

다음 액션:
- <남은 TODO/추가 검증>
```

## 기본 흐름(추천)
1. (필수) `Shopify Theme Dev & Automation` 노트북을 먼저 조회해 유사 작업/함정/검증 커맨드를 확인한다.
2. 테마 구조를 먼저 확인한다( `sections/`, `templates/`, `snippets/`, `assets/`, `config/` ).
3. 변경이 크면 `$ixion-pdca`로 화면/섹션 스펙과 설정(schema)을 Design에 고정한다.
4. 구현은 `$ixion-orchestrator`로 최소 변경으로 진행한다.
5. 완료 전 `$ixion-verify`로 최소 1개 검증을 실행한다.
6. 접근성/성능/SEO가 목표면, 결과를 `.codex/.ixion/decisions.md`에 짧게 남긴다(무슨 지표를 개선했는지).
7. (필수) 작업 종료 시 `Shopify Theme Dev & Automation` 노트북에 "Memory Capture" 노트를 남긴다.

## Shopify 테마 체크리스트(최소)
- schema/settings: id 충돌, 기본값, required/limit, preset, translation 키 존재
- 템플릿: JSON 템플릿 구조 정상, section type 오타 없음
- 접근성: label/aria, 이미지 alt, 버튼/링크 구분, 키보드 포커스
- 성능: 과도한 asset 로드, render-blocking, 불필요한 JS, 이미지 크기/포맷
- 데이터: metafield 접근 시 nil/blank 처리, 안전한 출력(escape)

## 검증 후보(환경에 맞게 선택)
- Shopify CLI가 있으면: `shopify theme check` (또는 theme-check)
- Node 툴링이 있으면: `npm run lint`, `npm test`, `npm run build`
- 스모크: `shopify theme dev`로 프리뷰에서 수정 섹션 1-2개 핵심 시나리오 확인

## 참고(SSOT)
- bkit의 파이프라인/QA 개념은 참고용: `.codex/.ixion/plugins/bkit/`
- ECC 공통 규칙(보안/테스트)은 참고용: `.codex/.ixion/plugins/everything-claude-code/rules/common/`
