---
name: ixion-docker-patterns
description: Dockerfile/이미지 빌드/레이어 캐시/멀티스테이지/보안 기본값 패턴을 적용한다.
metadata:
  short-description: Docker patterns
---

# Ixion Docker Patterns

## 목표
- 빠르고 재현 가능한 Docker 빌드/런타임 구성을 만든다(보안/이미지 크기/캐시 효율 포함).

## 원문 참고(SSOT)
- ECC Docker Patterns: `.codex/.ixion/plugins/everything-claude-code/skills/docker-patterns/SKILL.md`

## 가드레일
- 동작 변경 없는 최소 변경을 우선한다.
- 베이스 이미지/런타임 권한은 보수적으로(least privilege).

## 검증(필수)
- 가능한 경우 `docker build` 또는 프로젝트 빌드/테스트 중 1개를 실제 실행해 결과로만 보고한다.
