nvidia-smi
- GPU 확인

ssh 다른 포트 접속
- `ssh -p [port] [user-name]@[host]`
  - p : port

wc [옵션] [파일이름]
- wc : word count
- 옵션 : -l (행), -w (단어), -c (문자)
- ex) wc -l train_*_json
  - 파일명이 'train_' 으로 시작하고 '_json' 으로 끝나는 파일의 전체 line 수를 세라

cat [옵션] [파일]
- 옵션
  - -n : 모든 라인 앞에 번호 출력 (빈 라인 포함)
  - -b : 비어있지 않은 라인만 번호 출력
  - -E : 라인 마지막에 $ 기호 출력 (빈 라인 포함)
  - -T : 탭 문자를 ^I로 바꿔 출력
  - -s : 두 번 이상 연속된 빈 라인 출력x
  - -v : 탭과 줄바꿈을 제외한 nonprinting 문자를 ^, M- 사용하여 표시
  - -e = -vE : 줄바꿈을 포함한 nonprinting 문자 표시
  - -t = -vT : 탭을 포함한 nonprinting 문자 표시
  - -A = -vET : 탭, 줄바꿈을 포함한 nonprinting 문자 표시
- 옵션 입력 안 하는 경우) 파일 내용 그대로 출력

cat [파일명1] [파일명2]
- 파일명1 내용을 출력하고 파일명2 내용 출력

cat [파일명] | grep "[단어]" | wc -l
- ex) cat test.log | grep "acc" | wc -l
  - 'test.log' 파일에서 'acc'라는 단어가 있는 line 수를 세라
  
---
수정 필요

head -n1 : 제일 위 데이터 보겠다
tail -n1 : 제일 아래 데이터 보겠다

scp sync
- 네트워크 파일 전송

ps -aux | grep preprocess
- ps : shell에서 진행 중인 process (지금 돌아가는 process 독립적)
- ps -aux : 모든 process (시스템 백그라운드 demon)

history
- 내가 남긴 command
