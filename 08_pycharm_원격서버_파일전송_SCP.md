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


