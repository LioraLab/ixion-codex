---
name: find-skills
description: 설치 가능한 스킬을 검색/설치해 기능을 확장한다. “스킬 찾아줘”, “이거 할 수 있는 스킬 있어?”, “기능 확장” 같은 요청에 사용한다. Triggers: 스킬 찾아줘, skill 찾아줘, find skills, 기능 확장, 스킬 설치, npx skills.
---

# Find Skills (스킬 찾기/설치)

이 스킬은 “공개 스킬 생태계”에서 설치 가능한 스킬을 찾아서, 현재 에이전트/익션의 기능을 확장할 때 사용한다.

## 언제 쓰나

아래 상황이면 이 스킬을 사용한다.

- “X를 어떻게 하지?” 같은 질문인데, X가 흔한 작업이라 기존 스킬이 있을 법할 때
- “X 스킬 찾아줘”, “X 할 수 있는 스킬 있어?”처럼 스킬 탐색을 요청할 때
- 특수 기능(테스트/디자인/배포/보안/문서화 등)을 추가하고 싶을 때
- 툴/템플릿/워크플로우를 빠르게 찾고 싶을 때

## Skills CLI란?

Skills CLI(`npx skills`)는 “오픈 스킬 생태계”의 패키지 매니저다. 스킬은 특정 도메인/작업에 대한 워크플로우, 지식, 도구 사용법을 패키징해서 에이전트 기능을 확장한다.

핵심 커맨드:

- `npx skills find [query]`: 키워드로 스킬 검색
- `npx skills add <package>`: 스킬 설치(GitHub 등)
- `npx skills check`: 설치된 스킬 업데이트 확인
- `npx skills update`: 설치된 스킬 전체 업데이트

브라우징: `https://skills.sh/`

## 작업 절차

### 1) 사용자의 니즈를 1줄로 재정의

아래 3가지를 짧게 정리한다.

1. 도메인(예: React, testing, design, deployment)
2. 작업(예: 테스트 작성, 애니메이션, PR 리뷰, 릴리즈)
3. “스킬이 있을 법한 흔한 문제”인지 여부

### 2) 스킬 검색

관련 키워드로 검색한다.

```bash
npx skills find [query]
```

예시:

- “React 앱 성능” → `npx skills find react performance`
- “PR 리뷰 도와줘” → `npx skills find pr review`
- “changelog 만들고 싶어” → `npx skills find changelog`

검색 결과 예시:

```
Install with npx skills add <owner/repo@skill>

vercel-labs/agent-skills@vercel-react-best-practices
└ https://skills.sh/vercel-labs/agent-skills/vercel-react-best-practices
```

### 3) 옵션 제시(짧게)

사용자에게는 아래 3가지만 전달한다.

1. 스킬 이름과 하는 일(1-2줄)
2. 설치 커맨드
3. 참고 링크(선택)

응답 예시:

```
도움될 만한 스킬을 찾았어. `vercel-react-best-practices`는 React/Next.js 성능 최적화 가이드를 제공해.

설치:
npx skills add vercel-labs/agent-skills@vercel-react-best-practices

참고: https://skills.sh/vercel-labs/agent-skills/vercel-react-best-practices
```

### 4) 설치 진행(원하면)

사용자가 원하면 설치한다.

```bash
npx skills add <owner/repo@skill> -g -y
```

`-g`: 전역(user-level) 설치, `-y`: 확인 프롬프트 스킵

## 검색 키워드 힌트(자주 쓰는 카테고리)

키워드를 못 잡겠으면 아래 조합으로 시작한다.

| Category        | Example Queries                          |
| --------------- | ---------------------------------------- |
| Web Development | react, nextjs, typescript, css, tailwind |
| Testing         | testing, jest, playwright, e2e           |
| DevOps          | deploy, docker, kubernetes, ci-cd        |
| Documentation   | docs, readme, changelog, api-docs        |
| Code Quality    | review, lint, refactor, best-practices   |
| Design          | ui, ux, design-system, accessibility     |
| Productivity    | workflow, automation, git                |

## 검색 팁

1. **구체적으로 검색**: `testing`보다 `react testing`처럼 도메인을 같이 넣는다.
2. **동의어로 재시도**: `deploy`가 없으면 `deployment`, `ci-cd` 같은 대체 키워드를 써본다.
3. **인기 소스 확인**: `vercel-labs/agent-skills`, `ComposioHQ/awesome-claude-skills` 같은 저장소가 자주 나온다.

## 못 찾았을 때

관련 스킬이 없으면:

1. “찾았는데 없다”를 명확히 말한다.
2. 대신 일반 능력으로 직접 작업을 진행할지 제안한다.
3. 반복 작업이면 `npx skills init`로 커스텀 스킬 제작을 제안한다.

예시:

```
`xyz` 관련 스킬을 찾아봤는데 딱 맞는 게 없었어.
그래도 내가 직접 작업 자체는 도와줄 수 있어. 바로 진행할까?

자주 하는 작업이면 커스텀 스킬을 만드는 것도 방법이야:
npx skills init my-xyz-skill
```
