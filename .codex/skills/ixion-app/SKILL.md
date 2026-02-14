---
name: ixion-app
description: 앱 개발(모바일/데스크톱) 익션. RN/Flutter/Electron/Tauri 등에서 빌드/실행/권한/배포 전 검증 루프를 기본으로 둔다.
metadata:
  short-description: App dev workflow
---

# Ixion App

## 목표
- 로컬에서 "실행 가능한 상태"까지 빠르게 만든다.
- 플랫폼 특유의 회귀(권한, 빌드 설정, 리소스, 릴리즈 모드)를 기본으로 체크한다.

## 언제 쓰나
- React Native, Flutter, iOS/Android 네이티브
- Electron, Tauri, 데스크톱 앱
- 앱 UI/상태관리/네트워크/스토리지/푸시/권한 관련 변경

## 기본 흐름(추천)
1. 요구사항이 애매하면 `$ixion-orchestrator`로 탐색부터 하고, 지금 안 물으면 실패할 질문만 1-2개 한다.
2. 기능이 크면 `$ixion-pdca`로 화면 흐름/상태/에러/권한을 Design에 고정한다.
3. 구현 후 `$ixion-verify`로 최소 1개 검증을 실행한다.
4. 변경이 민감하면 `$ixion-review`로 회귀/테스트 공백을 잡는다.
5. 입력/딥링크/웹뷰/외부 URL/파일 처리 같은 공격면이 있으면 `$ixion-security`를 끼운다.

## 앱 작업 체크리스트(최소)
- 권한: 요청 타이밍, 거절/재시도 UX, 플랫폼별 차이(iOS/Android)
- 네트워크: 오프라인/타임아웃/재시도, 에러 메시지, 백그라운드 상태
- 상태: 앱 재시작 후 복원, 캐시 무결성, race condition
- 릴리즈 모드: dev에선 되는데 release에서 깨지는 이슈(플러그인, tree-shaking, minify/proguard)
- 접근성: 폰트 스케일, 터치 타겟, 스크린리더 라벨

## 검증 기본값(프로젝트 타입별 후보)
- React Native: `npx react-native doctor`, `npm test`, `npm run lint`, `npx tsc --noEmit`
- Flutter: `flutter test`, `flutter analyze`, `dart format --set-exit-if-changed .`
- Electron/Tauri: `npm test`, `npm run lint`, `npm run build` (가능하면 release 빌드 1번)

## 참고(SSOT)
- ECC rules: `.codex/.ixion/plugins/everything-claude-code/rules/`

