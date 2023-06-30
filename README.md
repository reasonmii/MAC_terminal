<b>Homebrew</b>
- It installs the stuff you need that Apple didn't (Mac)
- https://brew.sh/index_ko

<b>shortcut</b>
- terminal keyboard shortcuts for Mac
  - https://support.apple.com/ko-kr/guide/terminal/trmlshtcts/mac
- all the Command-Line keyboard shortcuts you need to know
  - https://betterprogramming.pub/boost-your-command-line-productivity-with-keyboard-shortcuts-4de2f6cbd069

<b>SSH</b>
- SSH = secure shell : **원격** 호스트에 접속하기 위해 사용되는 보안 프로토콜
  - shell : 사용자의 명령을 해석하고 커널에 전달하는 검정바탕, 흰글씨의 프로그램
  - 이전에는 Telnet을 사용했는데 암호화 되지 않아 보안이 취약했음
- 사용자(클라이언트)와 서버(호스트)는 각각의 key를 가지고 있고, 이를 이용해 연결 상대를 인증하고 안전하게 데이터 주고 받음
  - key 종류 : 비대칭키(공개키), 대칭키

<b>on-premise</b>
- 기업 서버를 클라우드와 같은 원격 환경이 아닌 자체적으로 보유한 전산실 서버에 직접 설치해 운영하는 것
  - 클라우드 컴퓨팅 전 기업 인프라 구축의 일반적인 방식이었음
  - 클라우드 서비스 : off-premise
- 장점 : 기업의 비즈니스 정보 보안성↑
- 단점 : 시스템 구축 시간↑
- 최근에는 하이브리드 IT 인프라 등장
  - 보안성 높은 데이터는 on-premise를, 보안성 낮은 데이터는 클라우드 환경을 사용

<b>How to prevent Mac sleep from command line?</b>
- terminal : `pmset noidle`
