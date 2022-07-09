
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

