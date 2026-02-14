---
name: ixion-git-master
description: Git 작업(원자 커밋, 브랜치/리베이스, 히스토리 정리)을 안전하게 처리한다.
metadata:
  short-description: Git operations helper
---

# Ixion Git Master

## 목표
- Git 작업(원자 커밋, 브랜치/리베이스, 히스토리 정리)을 안전하게 수행한다.
- 파괴적 작업(강제 푸시/히스토리 재작성/대량 삭제)은 반드시 멈추고 확인한다.

## 원문 참고(SSOT)
- OMC git-master: `.codex/.ixion/plugins/oh-my-claudecode/skills/git-master/SKILL.md`

## 언제 쓰나
- 커밋을 의미 단위로 쪼개야 할 때
- squash/rebase로 히스토리를 정리해야 할 때
- 브랜치 전략/릴리즈 태그/체인지로그를 정리해야 할 때
- "git 뭘 어떻게 해야 하지?" 같이 안전한 경로가 필요할 때

## 워크플로우(기본)
1. 현재 상태 확인(필수)
   - `git status`
   - `git diff`
   - `git log --oneline -n 20`
2. 리포지토리 관례 감지(있으면)
   - 커밋 메시지 규칙(예: `feat:`, `fix:`)
   - 브랜치 네이밍, PR 흐름
3. 목표에 맞는 최소 변경 경로 선택
   - 원자 커밋: `git add -p`로 단계적 스테이징
   - rebase/squash: 가능한 안전한 범위에서만 수행(공유 브랜치면 원칙적으로 금지)
4. 실행
   - 가능하면 비대화형(non-interactive) 커맨드를 우선한다.
5. 검증(필수)
   - `git status`가 깨끗한지 확인
   - 작업이 빌드/테스트를 바꿨으면 `$ixion-verify`로 최소 1개 검증 실행

## 금지/멈춤 조건
- `git push --force`, `git reset --hard`, 대규모 rebase는 사용자 확인 없이는 실행하지 않는다.
- interactive TUI 편집이 필요한 작업은, 대안(비대화형) 가능 여부를 먼저 검토하고 불가하면 사용자에게 선택지를 제시한다.

## 출력(보고) 형식
- 변경 요약: 커밋/브랜치/태그 목록
- 실행한 명령: 주요 커맨드만
- 리스크: 히스토리 재작성/충돌 가능성 등
- 다음 액션: PR/머지/릴리즈 등

