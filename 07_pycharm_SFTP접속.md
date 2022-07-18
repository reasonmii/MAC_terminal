<b>Pycharm 원격 서버 연결</b>

<b>Run on remote server</b>
- Pycharm Professional 버전에서 제공하는 기능
- local에서 작성한 코드를 원격 server에서 실행하는 것
- 원격 서버에 Pycharm을 설치하지 않아도 Pycharm의 강력한 기능(예: 디버깅 등)들을 사용 가능
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
   - Project Interpreter로 방금 생성한 원격 Interpreter를 사용할 경우 다음 그림처럼 원격 Interpreter에 설치된 파이썬 패키지 리스트가 보인다!




<b>2. Remote Host 경로 지정하기</b>


<b>3. GPU 실행을 위한 환경변수 설정하기</b>





SFTP (Secure File Transfer Protocol)
- FTP의 형태를 가지고 있지만 내용물은 SSH를 이용해서 연결하는 것 (SSH 부가기능 중 하나)
  - FTP와 같이 파일을 전송할 때 암호화 해서 전송
  - but, 기본 21 port가 아닌 SSH 접속 시 사용하는 port를 사용하고, SSH 접속 계정으로 로그인
- 장점
  - file upload/download가 쉬워짐
  - SSH 기반이라 permission 변경에서 더 강력함 (특히 사용자가 root 계정인 경우)
  - 외부에서도 파일 관리가 편함
  - 서버의 시스템 관리가 편해짐 (사용자가 root 계정인 경우)
- 일반 사용자들은 FTP 접속과 SFTP 접속 간 크게 차이가 없음
- 내부 네트워크 접속 때는 Samba가 더 좋지만, 외부 접속 환경에서는 sFTP가 가장 좋음

pycharm
- Preferences - build, execution, deployment - deployment - + - SFTP 클릭 - ok
- server name 입력
- SSH 추가 생성 : SSH configuration '...' 클릭 - + - SSH 정보 입력 - Test Connection - OK
- [참고](https://semotube.tistory.com/77)

