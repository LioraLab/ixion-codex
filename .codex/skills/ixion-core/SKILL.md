---
name: ixion-core
description: 익션 기본 규칙. 자동화-우선으로 구현하되, 장기 유지(작은 diff, 검증, 기록) 가드레일을 강제한다.
metadata:
  short-description: Core workflow + guardrails
---

# Ixion Core

## 목표
- 사용자의 개입을 최소화하면서도, 장기 유지 가능한 결과를 만든다.
- 자동화의 기본값은 "바로 실행"이지만, 실패 비용이 큰 작업은 짧게 멈추고 확인한다.

## 원문 참고(SSOT)
- ECC Coding Standards: `.codex/.ixion/plugins/everything-claude-code/skills/coding-standards/SKILL.md`
- ECC Common Rules(참고용): `.codex/.ixion/plugins/everything-claude-code/rules/common/`
- bkit Core Rules: `.codex/.ixion/plugins/bkit/skills/bkit-rules/SKILL.md`
- bkit Config(레벨/가드레일 힌트): `.codex/.ixion/plugins/bkit/bkit.config.json`
- bkit Convention Template: `.codex/.ixion/templates/convention.template.md`

## 항상 먼저 정리 (2-4줄)
- 목적
- In scope, Out of scope
- 제약 또는 위험(있으면)
- 성공조건(관찰 가능하게)

## 실행 원칙
1. 막연하면 추측으로 메우지 말고, 지금 안 물으면 실패할 질문만 1-2개 한다.
2. 코드는 "가장 작은 변경"으로 간다.
3. 스코프 확장(김에 수정) 금지.
4. 변경 후 검증을 최소 1개는 실행한다.
5. 결정/리스크는 짧게 남긴다.

## Source of Truth(우선순위)
충돌 시 아래 우선순위를 따른다.
1. 실행 중인 코드/테스트/빌드 결과(현실)
2. 프로젝트의 AGENTS.md/README/CONVENTIONS 같은 “사람이 보는 규칙”
3. `.codex/.ixion/docs/`의 합의 문서(Plan/Design)
4. 플러그인(SSOT)은 원리/템플릿 참고용(프로젝트 현실과 충돌하면 프로젝트 현실 우선)

## 레벨 감(선택)
프로젝트 성격을 빠르게 잡기 위한 3단계 분류(필수는 아님).
- Starter: 정적/단순 웹, 백엔드 없음
- Dynamic: 로그인/DB/스토리지 같은 “동적 요구”가 있으나 운영 최소(BaaS 활용 가능)
- Enterprise: MSA/인프라/컴플라이언스/고가용성 전제

## 멈추고 확인해야 하는 경우
- 데이터 삭제, 마이그레이션, 권한/보안, 결제, 배포
- `rm -rf`, `git reset --hard`, `git push --force` 같은 파괴적 명령
- 변경이 5파일 또는 200라인 이상으로 번질 조짐

## 기본 작업 흐름
1. `rg`로 관련 파일을 찾는다.
2. 변경 대상 파일을 읽고 기존 패턴을 확인한다.
3. 구현한다.
4. 검증한다.
   - 테스트가 있으면 테스트
   - 없으면 빌드/린트/스모크 중 가능한 최소 1개
5. 결과를 근거 중심으로 보고한다.

## 최종 답변 형식
- 변경 요약: 파일 경로 리스트
- 핵심 이유: 1-2문장
- 검증: 실행한 명령과 결과 요약
- 남은 리스크 또는 다음 단계: 있을 때만
