---
name: ixion-cv
description: 컴퓨터비전 프로그램 개발 익션. 데이터셋/전처리/학습/추론/평가 파이프라인, 재현성, 스모크 검증을 기본으로 둔다.
metadata:
  short-description: Computer vision workflow
---

# Ixion CV

## 목표
- 실험 코드가 아니라 "재현 가능한 프로그램"으로 만든다.
- 데이터/모델/전처리의 계약을 코드와 테스트로 고정한다.

## 언제 쓰나
- OpenCV, PyTorch/TensorFlow, YOLO/Detectron/Segmentation 등
- 이미지/비디오 입출력, 전처리/후처리, 학습/추론/평가 코드
- CV 데모/CLI/배치 파이프라인

## 기본 흐름(추천)
1. 목표가 연구용인지 제품용인지가 결과에 큰 영향을 주면, 그 1가지만 먼저 확인한다.
2. 코드베이스를 탐색해 현재 구조와 실행 방법을 파악한다(환경 파일, 엔트리포인트, 스크립트).
3. 변경은 "전처리/모델/후처리/IO" 경계가 섞이지 않게 최소 범위로 한다.
4. 완료 전 `$ixion-verify`로 최소 1개 검증을 실행한다.
5. 재사용될 전처리/후처리 규칙은 `$ixion-learn`으로 자산화한다.

## CV 체크리스트(최소)
- 데이터: `data/`는 기본적으로 git에서 제외(README로 획득 방법/경로만 문서화)
- 재현성: seed, 버전(파이썬/쿠다/torch), config 스냅샷
- 입출력: 색상 공간(BGR/RGB), 좌표계, 이미지 크기, dtype/정규화
- 평가: metric 정의(mAP, IoU, F1 등)와 기준 데이터셋 고정
- 성능: 배치/스레딩/IO 병목(필요할 때만)

## 검증 기본값(권장 조합)
- 정적: `ruff check .` 또는 `python -m compileall .`
- 테스트: `pytest` (전처리/후처리, shape/dtype, 경계조건)
- 스모크: 샘플 1-3장으로 `infer` 경로를 실제 실행(가능하면 CPU에서도)

## 이미지 입력이 있을 때
- 사용자가 이미지 파일 경로를 주면 `functions.view_image`로 먼저 확인하고, 그 다음 전처리/후처리 가정을 고정한다.

## 참고(SSOT)
- ECC Python rules: `.codex/.ixion/plugins/everything-claude-code/rules/python/`

