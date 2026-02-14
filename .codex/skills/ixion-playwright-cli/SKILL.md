---
name: ixion-playwright-cli
description: Playwright CLI(`playwright-cli`)로 브라우저 자동화(웹 탐색/폼 입력/스크린샷/PDF/데이터 추출/E2E 디버깅)를 수행한다. Triggers: playwright, playwright-cli, e2e, 브라우저 자동화, 웹 스크린샷, 폼 자동 입력, 웹 데이터 추출.
metadata:
  short-description: Browser automation via playwright-cli
---

# Ixion Playwright CLI

## 목표
- `playwright-cli`로 웹 페이지를 실제로 열고, 스냅샷(ref 기반)으로 안전하게 클릭/입력/스크린샷/PDF/네트워크 확인을 수행한다.
- “문서/설명”이 아니라 **재현 가능한 브라우저 행동 + 아티팩트(스크린샷/트레이스/비디오)**를 남기는 게 목적일 때 사용한다.

## 언제 쓰나
- Playwright/E2E 관련 작업(디버깅, 셀렉터 확인, 플로우 재현)
- 웹 페이지에서 폼 입력/버튼 클릭/스크린샷/PDF 저장
- 웹 페이지의 특정 정보 추출(텍스트/DOM)
- 네트워크/콘솔 로그 확인이 필요할 때

## 가드레일
- 결제/삭제/권한 변경 같은 **돌이킬 수 없는 액션**은 실행 전에 1회 확인한다.
- 로그인/2FA/민감정보 입력이 필요한 경우:
  - 테스트 계정/테스트 환경 우선
  - 자격 증명은 사용자가 제공한 범위 내에서만 사용
- “페이지 상태를 추측”하지 말고 `snapshot`, `console`, `network`, `screenshot` 같은 **증거 기반**으로 진행한다.

## 전제(툴)
- 이 스킬은 로컬 CLI `playwright-cli`를 사용한다.
  - 설치/점검: `playwright-cli --help`

## Quick start

```bash
# open new browser
playwright-cli open
# navigate to a page
playwright-cli goto https://playwright.dev
# interact with the page using refs from the snapshot
playwright-cli click e15
playwright-cli type "page.click"
playwright-cli press Enter
# take a screenshot
playwright-cli screenshot
# close the browser
playwright-cli close
```

## Commands

### Core

```bash
playwright-cli open
# open and navigate right away
playwright-cli open https://example.com/
playwright-cli goto https://playwright.dev
playwright-cli type "search query"
playwright-cli click e3
playwright-cli dblclick e7
playwright-cli fill e5 "user@example.com"
playwright-cli drag e2 e8
playwright-cli hover e4
playwright-cli select e9 "option-value"
playwright-cli upload ./document.pdf
playwright-cli check e12
playwright-cli uncheck e12
playwright-cli snapshot
playwright-cli snapshot --filename=after-click.yaml
playwright-cli eval "document.title"
playwright-cli eval "el => el.textContent" e5
playwright-cli dialog-accept
playwright-cli dialog-accept "confirmation text"
playwright-cli dialog-dismiss
playwright-cli resize 1920 1080
playwright-cli close
```

### Navigation

```bash
playwright-cli go-back
playwright-cli go-forward
playwright-cli reload
```

### Keyboard

```bash
playwright-cli press Enter
playwright-cli press ArrowDown
playwright-cli keydown Shift
playwright-cli keyup Shift
```

### Mouse

```bash
playwright-cli mousemove 150 300
playwright-cli mousedown
playwright-cli mousedown right
playwright-cli mouseup
playwright-cli mouseup right
playwright-cli mousewheel 0 100
```

### Save as

```bash
playwright-cli screenshot
playwright-cli screenshot e5
playwright-cli screenshot --filename=page.png
playwright-cli pdf --filename=page.pdf
```

### Tabs

```bash
playwright-cli tab-list
playwright-cli tab-new
playwright-cli tab-new https://example.com/page
playwright-cli tab-close
playwright-cli tab-close 2
playwright-cli tab-select 0
```

### Storage

```bash
playwright-cli state-save
playwright-cli state-save auth.json
playwright-cli state-load auth.json

# Cookies
playwright-cli cookie-list
playwright-cli cookie-list --domain=example.com
playwright-cli cookie-get session_id
playwright-cli cookie-set session_id abc123
playwright-cli cookie-set session_id abc123 --domain=example.com --httpOnly --secure
playwright-cli cookie-delete session_id
playwright-cli cookie-clear

# LocalStorage
playwright-cli localstorage-list
playwright-cli localstorage-get theme
playwright-cli localstorage-set theme dark
playwright-cli localstorage-delete theme
playwright-cli localstorage-clear

# SessionStorage
playwright-cli sessionstorage-list
playwright-cli sessionstorage-get step
playwright-cli sessionstorage-set step 3
playwright-cli sessionstorage-delete step
playwright-cli sessionstorage-clear
```

### Network

```bash
playwright-cli route "**/*.jpg" --status=404
playwright-cli route "https://api.example.com/**" --body='{"mock": true}'
playwright-cli route-list
playwright-cli unroute "**/*.jpg"
playwright-cli unroute
```

### DevTools

```bash
playwright-cli console
playwright-cli console warning
playwright-cli network
playwright-cli run-code "async page => await page.context().grantPermissions(['geolocation'])"
playwright-cli tracing-start
playwright-cli tracing-stop
playwright-cli video-start
playwright-cli video-stop video.webm
```

### Install

```bash
playwright-cli install --skills
playwright-cli install-browser
```

### Configuration

```bash
# Use specific browser when creating session
playwright-cli open --browser=chrome
playwright-cli open --browser=firefox
playwright-cli open --browser=webkit
playwright-cli open --browser=msedge
# Connect to browser via extension
playwright-cli open --extension

# Use persistent profile (by default profile is in-memory)
playwright-cli open --persistent
# Use persistent profile with custom directory
playwright-cli open --profile=/path/to/profile

# Start with config file
playwright-cli open --config=my-config.json

# Close the browser
playwright-cli close
# Delete user data for the default session
playwright-cli delete-data
```

### Browser Sessions

```bash
# create new browser session named "mysession" with persistent profile
playwright-cli -s=mysession open example.com --persistent
# same with manually specified profile directory (use when requested explicitly)
playwright-cli -s=mysession open example.com --profile=/path/to/profile
playwright-cli -s=mysession click e6
playwright-cli -s=mysession close  # stop a named browser
playwright-cli -s=mysession delete-data  # delete user data for persistent session

playwright-cli list
# Close all browsers
playwright-cli close-all
# Forcefully kill all browser processes
playwright-cli kill-all
```

## Example: Form submission

```bash
playwright-cli open https://example.com/form
playwright-cli snapshot

playwright-cli fill e1 "user@example.com"
playwright-cli fill e2 "password123"
playwright-cli click e3
playwright-cli snapshot
playwright-cli close
```

## Example: Multi-tab workflow

```bash
playwright-cli open https://example.com
playwright-cli tab-new https://example.com/other
playwright-cli tab-list
playwright-cli tab-select 0
playwright-cli snapshot
playwright-cli close
```

## Example: Debugging with DevTools

```bash
playwright-cli open https://example.com
playwright-cli click e4
playwright-cli fill e7 "test"
playwright-cli console
playwright-cli network
playwright-cli close
```

```bash
playwright-cli open https://example.com
playwright-cli tracing-start
playwright-cli click e4
playwright-cli fill e7 "test"
playwright-cli tracing-stop
playwright-cli close
```

## Specific tasks

- **Request mocking**: [references/request-mocking.md](references/request-mocking.md)
- **Running Playwright code**: [references/running-code.md](references/running-code.md)
- **Browser session management**: [references/session-management.md](references/session-management.md)
- **Storage state (cookies, localStorage)**: [references/storage-state.md](references/storage-state.md)
- **Test generation**: [references/test-generation.md](references/test-generation.md)
- **Tracing**: [references/tracing.md](references/tracing.md)
- **Video recording**: [references/video-recording.md](references/video-recording.md)
