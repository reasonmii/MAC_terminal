
### PING (Paket Internet Groper)
- 컴퓨터 네트워크 상태를 점검, 진단하는 명령
- 방법
  - 네트워크 상태를 확인하려는 target 컴퓨터를 향해 일정 크기의 packet을 보냄 : ICMP echo request
    - packet : 네트워크 최소 전송 단위
  - target 컴퓨터가 이에 대해 응답하는 메시지를 보냄 : ICMP echo reply
  - 이를 수신, 분석하여 target 컴퓨터가 작동하는지 + target 컴퓨터까지 도달하는 네트워크 상태 파악
- ping 명령은 TCP/IP 프로토콜 중 ICMP(Internet Control Message Protocol)을 통해 동작
  - 이 프로토콜을 지원하지 않거나 보안 때문에 ICMP 사용을 차단한 기기에서 사용 불가

<b>사용법</b>
- `ping [목적지] [option]`
  - ex) `ping 127.0.0.1`
- option
  - `-t` : 기본적으로 4회 수행 후 옵션 주고 수행하면 자동 반복 수행
  - `-l [전송되는 패킷]` : ping 수행시 전송되는 packet 크기 지정
    - ex) `ping 127.0.0.1 -l 100`
  - `-n [횟수]` : ping 수행시 지정된 횟수 만큼 실행

https://server-talk.tistory.com/53


