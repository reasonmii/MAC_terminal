### FTP (File Transfer Protocol)
- 파일을 전송하는 통신 규약
- 명령어를 전달하는 기본 port : 21
- 데이터를 전달하는 port : 20 or random
- 데이터 전달 방식
  - active : FTP Client -(command)-> FTP server / FTP server -(data)-> FTP Client
  - passive : FTP Client -(command, data)-> FTP server
- FTPS : 보안 강화 버전

### SFTP (Secure File Transfer Protocol)
- FTP의 형태를 가지고 있지만 SSH를 이용해서 contents 연결 (SSH 부가기능 중 하나)
  - FTP와 같이 파일을 전송할 때 암호화 해서 전송
  - but, 기본 21 port가 아닌 SSH 접속 시 사용하는 port를 사용하고, SSH 접속 계정으로 로그인
- 장점
  - file upload/download가 쉬워짐
  - 사용자가 root 계정인 경우
    - SSH 기반이라 permission 변경에서 더 강력함
    - 서버의 시스템 관리가 편해짐
  - 외부에서도 파일 관리가 편함
- 일반 사용자들은 FTP 접속과 SFTP 접속 간 크게 차이가 없음
- '내부' 네트워크 접속 때는 Samba가 더 좋지만, '외부' 접속 환경에서는 sFTP가 가장 좋음

---

### pycharm에서 SFTP 설정하기
- 참고 : https://semotube.tistory.com/77
- Preferences - Build, Execution, Deployment - Deployment - + - SFTP 클릭 - ok
- server name 입력
- SSH 추가 생성 : SSH configuration '...' 클릭 - + - SSH 정보 입력 - Test Connection - OK

### 서버 쪽 경로 직접 지정하기
- Preferences - Build, Execution, Deployment - Deployment - Choose Root Path 폴더모양 클릭
  - 대화상자 부분에 `/home/서버명`/서버명2` 입력 ex) `/home/pi/test001`
  - ok - ok
- 'Create New Project' 클릭 - location 폴더 모양 클릭
  - local 경로 설정 : new folder - 'test001' - create - open
  - 기본설정 확인 - create
- project 부분 'test001' 선택 - New - Python File - 'main.py' 입력
- 'main.py' 우클릭 - Deployment - Configuration - Mappings
  - deployment path 선택 - ok - ok
- 'main.py' 파일에 간단 코드 입력 ex) print("Hello!")
  - 파일 우클릭 - Deployment - Upload to - 서버 선택 ex) pi - 에러 발생
  - 터미널 열고 아래 코드 차례로 입력
    - `ssh pi@192.168.1.111`
    - password 입력
    - `pwd` : 현재 위치 확인 - 설정한 디렉토리가 /home/pi/test001 이므로 test001 폴더를 생성
    - `mkdir test001`
    - `ls` : 확인
  - 다시 'main.py' 우클릭 - Deployment - Upload to - 서버 선택
  - 서버에서 확인하기 : `cd test001`, `ls`

---

### Pycharm 원격 서버 연결

<b>Run on Remote Server</b>
- Pycharm Professional 버전에서 제공하는 기능
- local에서 작성한 코드를 원격 server에서 실행하는 것
- 원격 서버에 Pycharm을 설치하지 않아도 Pycharm의 강력한 기능(디버깅 등) 사용 가능
- 딥러닝과 같은 복잡한 파이썬 코드를 실행할 때 꼭 필요
- 참고 : https://pytogether.tistory.com/1

<b>1. Remote Interpreter 설정하기</b>
- 로컬에서 작성한 코드를 서버에서 실행하기 위해 서버에 설치된 파이썬 Interpreter 지정
1) Pycharm에서 새 프로젝트 생성
   - File - New Project
2) Project Interpreter 설정 창 열기
   - File - Settings - Project - Project Interpreter
3) Remote Interpreter 연결
   - Project Interpreter 옆 톱날 클릭 - Add Remote - Deployment configuration 더보기
4) Remote Interpreter를 연결하기 위해 우선 원격 서버를 추가
   - Deployment 창의 왼쪽 상단 '+' 버튼 클릭
   - 서버명 입력
   - ★ Secure Shell을 이용할 경우 서버 Type은 `SFTP`로 설정
   - 원격 서버의 접속 정보 입력 (IP주소, 사용자명, 비밀번호)
     - Save password 체크해두면 접속 시 비밀번호를 입력하지 않아도 됨
     - Root path는 사용자의 Home directory 지정 (접속 정보가 정확할 경우 Autodetect 클릭해도 됨)
   - 모두 입력 후 OK
5) Configure Remote Python Interpreter 창이 팝업됨
   - Create 버튼을 클릭하여 Deployment 서버정보를 IDE 설정에 저장
   - Deployment configuration이 "Copy of project-level server xxx"로 바뀜
   - 원격 서버의 파이썬 Interpreter 경로 지정하기
   - Python interpreter path : 서버에 설치된 파이썬 Interpreter 위치 입력
     - Anaconda, virtualenv 등 사용하는 개발환경에 따라 다르니 잘 확인하고 입력할 것
     - 파이썬 위치 모를 때) 원격 서버에서 "which python"을 실행하면 확인 가능
6) 원격 Interpreter가 제대로 연결되었는지 확인하기
   - Settings - Project Interpreter로 방금 생성한 원격 Interpreter를 사용할 경우 원격 Interpreter에 설치된 파이썬 패키지 리스트가 보임

<b>2. Remote Host 경로 지정하기</b>
- local에서 작성한 python code를 원격 서버에 업로드하기 위함
- Tools - Deployment - Browse Remote Host
- local code를 원격 서버에 업로드할 때 directory 위치 지정해야 함
  - Remote Host 창에서 Deployment 서버를 설정하기 위해 '...' 클릭
  - Mappings - Deployment path on server 입력창에 업로드 경로 입력 ex) `/sources/py-study`
    - local file은 `$HOME/sources/py-study`로 업로드 됨
    - `$HOME`은 Connection 탭에서 입력한 Root path에 해당 (앞에서 /home/hkh 로 입력함)
    -  즉, local에서 작성한 파일은 원격 서버의 /home/hkh/sources/py-study로 업로드 됨
  - 방금 설정한 Deployment 서버를 "기본 서버로 사용" 설정
    - Pycharm의 파일 자동업로드 기능을 사용하기 위함
    - 기본 서버로 설정된 Deployment 서버는 Bold체로 변함

<b>3. 파일 업로드 방법과 자동 업로드 방법</b>
- 자동 업로드 기능을 사용하면 코드 수정 시 파일이 원격 서버로 자동 업로드(동기화) 됨
- local 파일 서버로 업로드하기
  - 특정 파일 연 상태에서 Tools - Deployment - Automatic upload

<b>4. GPU 실행을 위한 환경변수 설정하기</b>
- 딥러닝 Framework(Tensorflow, Theano, PyTorch 등) 사용을 위해 CUDA 라이브러리 위치를 환경변수로 지정해야 함
- Pycharm에서 원격 서버로 코드를 실행 시 Linux에서 설정한 사용자 환경변수가 자동으로 연결되지 않음 → 추가 설정 필요
- 실행할 파일 우클릭 - Edit Configuration - Environment variables - 더보기(...)
  - LD_LIBRARY_PATH 환경변수 추가
    - ex) usr/local/cuda/lib64 : 설치된 CUDA 위치에 따라 조금 다를 수 있음
- test code를 local pycharm 프로젝트로 복사해서 실행해 보기
  - Device mapping에 `GPU:0 -> device:0`과 유사한 메시지를 확인하면 local에서 작성한 GPU code가 원격 서버에서 올바르게 실행되는 것

test code
```
import tensorflow as tf

# Creates a graph.
a = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[2, 3], name='a')
b = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[3, 2], name='b')
c = tf.matmul(a, b)

# Creates a session with log_device_placement set to True.
sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))

# Runs the op.
print(sess.run(c))
```
