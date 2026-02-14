---
name: ixion-deployment-patterns
description: 배포/릴리즈/롤백/관측성 패턴을 적용해 운영 리스크를 줄인다.
metadata:
  short-description: Deployment patterns
---

# Ixion Deployment Patterns

## 목표
- 배포/릴리즈 과정에서 자주 생기는 장애(환경 차이, 마이그레이션, 설정 누락)를 줄이는 패턴을 적용한다.

## 원문 참고(SSOT)
- ECC Deployment Patterns: `.codex/.ixion/plugins/everything-claude-code/skills/deployment-patterns/SKILL.md`

## 산출물(권장)
- 배포 단계(빌드/테스트/릴리즈/롤백) 체크리스트
- 환경 변수/시크릿/권한/네트워크 의존성 점검
- 롤백 전략 + 검증 커맨드 1개
