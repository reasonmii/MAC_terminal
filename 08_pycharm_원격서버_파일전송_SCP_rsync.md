### SCP

- SSH 원격 접속 protocol을 기반으로 한 파일 전송 방식 (Secure Copy)
- 원격 서버에 있는 파일을 가져오거나 전송할 때 사용하는 파일 전송 프로토콜
- 네트워크가 연결되어 있는 환경에서 ssh와 동일하게 22번 포트를 사용하여 파일을 주고받음
  - = 보안 관점에서도 안정된 프로토콜

<b>서버로 파일 전송 : 내 PC (Local) -> 원격지(Remote)</b>
- 단일 파일 전송 : `scp [옵션] [파일명] [계정]@[원격지_ip]:[받는 위치]`
  - 기본 SSH port (22) 사용하는 경우 : 옵션 입력X
  - SSH port가 다른 경우 : 옵션 `-P [서버port]` 입력
  - ex) `C:\Users\user>sch -P 1111 /dataset/test.txt server_id@000.000.000.000:workspace/workspace/dataset/`
  - 의미 : test.txt파일을 서버의 workspace/workspace/dataset이라는 폴더로 전송
- 여러 파일 전송 : `scp [옵션] [파일명1] [파일명2] [계정]@[원격지_ip]:[받는 위치]`
- directory(폴더) 전송 : `scp -r [옵션] [전송 폴더명] [계정]@[원격지_ip]:[받는 위치]`
  - ex) `C:\Users\user>sch -r -P 1111 /dataset server_id@000.000.000.000:workspace/workspace/dataset/`
  - dataset 폴더를 서버의 workspace/workspace/dataset 폴더 아래에 전송

<b>서버에서 파일 다운받기 : 원격지(Remote) -> 내 PC (Local)</b>
- 단일 파일 다운 : `scp [옵션] [계정]@[원격지_ip]:[보내는 위치] [받는 위치]`
  - 기본 SSH port (22) 사용하는 경우 : 옵션 입력X
  - SSH port가 다른 경우 : 옵션 `-P [서버port]` 입력
  - ex) `C:\Users\user>sch -P 1111 server_id@000.000.000.000:workspace/dataset/test.txt /dataset`
  - test.txt 파일을 내 pc의 /dataset 폴더에 다운
- 여러 파일 다운 : `scp [옵션] [계정]@[원격지_ip]:"[파일명1] [파일명2]" [받는 위치]`
  - 다운 받을 땐 큰 따옴표 " "를 사용해 묶어줘야 함
  - ex) `C:\Users\user>sch -P server_id@000.000.000.000:"workspace/dataset/test.txt workspace/dataset/test2.txt" /dataset`
- directory(폴더) 다운 : `scp -r [옵션] [계정]@[원격지_ip]:[폴더명] [받는 위치]`
  - ex) `C:\Users/user>sch -r -P 1111 server_id@000.000.000.000:workspace/dataset /data`
  - /dataset 폴더를 하위 디렉토리 포함하여 내 PC의 data 폴더 아래 다운

---

옵션 | 설명 | 사용법
---|------|---
r	| 디렉토리 내 모든 파일/디렉토리 | scp -r
p (소문자) | 원본 권한 속성 유지 | scp -p
P (대문자)	| 포트 번호 지정 | scp -P [포트번호]
c	| 압축 복사 | scp -c
v | 과정 출력 복사 | scp -v
a |	아카이브 모드 복사 | scp -a

---

### rsync : remote synchronization)
- 원격에 있는 file, directory를 복사하고 동기화하는 방식
- ex) `rsync -azP /home/test/ test@111.111.111.111:~/rsync/test`
- 원격 port가 기본 port(22)가 아닌 경우 : `rsync --rsh="ssh -p8000"`
- option
  - a : 권한 소유주 및 위치까지 그대로 가져옴 (Archive)
  - v : 동기화 상세 진행 상항 나타냄 (Verbose)
  - r : 하위 폴더를 포함하여 모두 복사 (Recursive)
  - p : 원본 파일 시간의 수정 시간, 권한 등 정보 보존 (Perms)
  - z : 데이터 압축 전송 (Compress)

### scp vs. rsync
- scp
  - 전송하는 파일 중 symbolic link가 있으면 이를 유지하지 않고 링크된 원본 파일 전송
- rsync
  - 속도 빠름
  - 최초에 모든 파일, 디렉토리를 복사하고 이후에는 차이가 있는 것만 복사하기 때문

---

<b>참고</b>
- https://comgenie.tistory.com/m/86
- https://my-t-space.tistory.com/37
