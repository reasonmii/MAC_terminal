### SCP

- ssh 원격 접속 프로토콜을 기반으로 한 SecureCopy의 약자
- 원격 서버에 있는 파일을 가져오거나 전송할 때 사용하는 파일 전송 프로토콜
- 네트워크가 연결되어 있는 환경에서 ssh와 동일하게 22번 포트를 사용하여 파일을 주고받음
  - = 보안 관점에서도 안정된 프로토콜

### 서버로 파일 전송 : 내 PC (Local) -> 원격지(Remote)
- 단일 파일 전송 : `scp [옵션] [파일명] [원격지_id]@[원격지_ip]:[받는 위치]`
  - port 번호가 필요하 경우 option `-P` 입력
  - ex) `C:\Users\user>sch -P 1111 /dataset/test.txt server_id@000.000.000.000:workspace/workspace/dataset/`
  - 의미 : test.txt파일을 서버의 workspace/workspace/dataset이라는 폴더로 전송
- 여러 파일 전송 : `scp [옵션] [파일명1] [파일명2] [원격지_id]@[원격지_ip]:[받는 위치]`
- directory(폴더) 전송 : `scp -r [옵션] [전송 폴더명] [원격지_id]@[원격지_ip]:[받는 위치]`
  - ex) `C:\Users\user>sch -r -P 1111 /dataset server_id@000.000.000.000:workspace/workspace/dataset/`
  - dataset 폴더를 서버의 workspace/workspace/dataset 폴더 아래에 전송

### 서버에서 파일 다운받기 : 원격지(Remote) -> 내 PC (Local)
- 단일 파일 다운 : `scp [옵션] [원격지_id]@[원격지_ip]:[보내는 위치] [받는 위치]`
  - port 번호가 필요하 경우 option `-P` 입력
  - ex) `C:\Users\user>sch -P 1111 server_id@000.000.000.000:workspace/dataset/test.txt /dataset`
  - test.txt 파일을 내 pc의 /dataset 폴더에 다운
- 여러 파일 다운 : `scp [옵션] [원격지_id]@[원격지_ip]:"[파일명1] [파일명2]" [받는 위치]`
  - 다운 받을 땐 큰 따옴표 " "를 사용해 묶어줘야 함
  - ex) `C:\Users\user>sch -P server_id@000.000.000.000:"workspace/dataset/test.txt workspace/dataset/test2.txt" /dataset`
- directory(폴더) 다운 : `scp -r [옵션] [원격지_id]@[원격지_ip]:[폴더명] [받는 위치]`
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


- 참고 : https://comgenie.tistory.com/m/86
