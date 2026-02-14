---
name: ixion-security
description: 보안/권한/비밀정보 관점에서 설계와 코드를 점검하는 익션.
metadata:
  short-description: Security review
---

# Ixion Security

## 목표
AI 자동화 개발에서 자주 터지는 보안 사고(비밀키 노출, 인증/인가 누락, SSRF/RCE, 과도한 권한)를 초기에 차단한다.

## 원문 참고(SSOT)
- ECC Security Review: `.codex/.ixion/plugins/everything-claude-code/skills/security-review/SKILL.md`
- ECC Security Scan: `.codex/.ixion/plugins/everything-claude-code/skills/security-scan/SKILL.md`
- (선택) OMC Security Review: `.codex/.ixion/plugins/oh-my-claudecode/skills/security-review/SKILL.md`

## 체크리스트
- 비밀정보: 키/토큰/비밀번호가 커밋/로그/에러에 노출되는가?
- 인증: 로그인/세션/토큰 처리에 허점이 있는가?
- 인가: 리소스 소유권/권한 체크가 누락됐는가?
- 입력 검증: SQLi/XSS/Command injection 가능성이 있는가?
- 파일/업로드: 경로 조작, MIME 우회, 공개 범위 설정이 안전한가?
- 외부 호출: SSRF, 리다이렉트, allowlist 부재

## 출력
- 위험도(High/Med/Low)
- 재현 조건
- 권장 수정(최소 변경)
- 추가 검증(테스트/체크)
