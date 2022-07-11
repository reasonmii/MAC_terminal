nvidia-smi
- GPU 확인

ssh 다른 포트 접속
- `ssh -p [port] [user-name]@[host]`
  - p : port

wc [옵션] [파일이름]
- wc : word count
- 옵션 : -l (행), -w (단어), -c (문자)
- ex) wc -l train_*\_json
  - 파일명이 'train_' 으로 시작하고 '\_json' 으로 끝나는 파일의 전체 line 수를 세라

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
