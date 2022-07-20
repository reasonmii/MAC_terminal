
### screen
- Linux에서 독립적으로 동작하는 가상 terminal을 띄워주는 것
  - background로 동작하는 가상 terminal
- 장점 : terminal을 꺼도 background에서 계속 돌아감
  - 나중에 screen 명령으로 다시 접속하면 작업 그대로 이어가기 가능
- 설치 : `sudo apt-get install screen`

<b>screenrc</b>
- `vi ~/.screenrc`
- screen 환경설정 파일
- terminal 과 같은 환경을 좀 더 보기 좋게 꾸며주기 위해 사용

```
ck 5000
vbell off
defscrollback 10000
termcapinfo xterm* ti@:te@
startup_message off
hardstatus on
hardstatus alwayslastline
hardstatus string "%{.bW}%-w%{.rW}%n*%t%{-}%+w %= %c ${USER}@%H"
bindkey -k k1 select 0
bindkey -k k2 select 1
bindkey -k k3 select 2
```

<b>시작</b>
- `screen` : screen 진입 (이름 : 랜덤 생성)
- `screen -S [screen name]` : 이름을 지정하여 진입
- `screen -r [screen name]` : 해당 screen에 진입 (reattach)
  - 해당 screen이 존재하지 않는 경우, 새로 생성하며 진입
  - single display mode
    - 여러 명이 함께 들어가도 서로 무슨 명령을 입력하는 지 알 수 없음
- `screen -x [screen name]` : 실행 중인 screen에 재진입 (reattach)
  - multi display mode
    - 여러 명이 들어가면 한 화면처럼 서로 무슨 명령을 입력하는 지 알 수 있음

<b>출력</b>
- `screen -ls`, `screen -list` : 현재 존재하는 screen list 출력

<b>screen 종료 (삭제)</b>
- `screen -S [screen name/number] -X quit`
- 사용 중인 screen에서 모든 창을 exit으로 끄기

<b>screen session 접속 후</b>
- `ctrl+a, ?` : 단축키 확인
- `ctrl+a, c` : screen에서 새 session 열기
- `ctrl+a, w` : window 목록 보기
- 화면 분할
  - `ctrl+a, I` : 화면 세로 분할
  - `ctrl+a, S` : 화면 가로 분할
- 이동
  - `ctrl+a, 숫자` : 해당 번호의 screen으로 이동
  - `ctrl+a, n`, `ctrl+a, space` : 다음 창으로 이동
  - `ctrl+a, p`, `ctrl+a, backspace` : 이전 창으로 이동
  - `ctrl+a, tab` : 분할된 화면으로 넘어가기
- `ctrl+a, esc, [방향키]` : scroll 하기
- 나가기
  - `ctrl+a, d` : 현재 screen에서 나가기 (deattach)
    - background에서는 계속 동작
  - `ctrl+a, k`, `exit` : screen 종료하면서 나가기

---

참고
- https://bio-info.tistory.com/42
- https://minimin2.tistory.com/123
