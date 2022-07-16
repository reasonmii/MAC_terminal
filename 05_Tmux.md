### Tmux
- 개념
  - terminal multiplexer (창 분할)
  - 많은 pseudo-terminal을 window와 session 단위로 관리하는 도구 
- 구성 요소
  - session: tmux 실행 단위, 여러 window로 구성
  - window: terminal 화면, 세션 내에서 탭처럼 사용
  - pane: 하나의 window 내에서 화면 분할
  - status bar : 화면 아래 표시되는 상태 막대
- 장점
  - 한 terminal 내 여러 프로그램 간 쉽게 전환 가능
  - 프로그램을 분리한 후 다른 terminal에 재연결 가능
  - Linux 연결이 끊겨도 서버가 켜 있다면 tmux에서 실행 중인 프로그램은 계속 실행됨

<b>설치 및 시작</b>
- `brew install tmux` : 설치
- 첫 번째 session 시작하기 : `tmux`
  - shell이 포함된 새 session 열림
  - session명 default : 숫자 (0~9 중 사용 가능한 첫 번째 값)
  - 하단 status bar : 모든 창 목록 표시
- session명 지정해서 시작하기 : `tmux new -s [session_name]`
  - session명 직접 지정하면 여러 Tmux session 실행 시 유용
  - 설명적인 이름이 좋음
- session, window 함께 생성해서 시작하기 : `tmux new -s [session_name] -n [window_name]`

<b>session 명령어</b>
- `exit` : 세션 종료
- 세션 목록 : `tmux ls`
- 세션 다시 시작 : `tmux attach -t session_number`
- tmux session 분리 + 일반 shell로 돌아가기 : `[cmd] b d`
  - 분리 후에도 session에서 실행 중인 프로그램은 계속 실행됨

- session 재연결
  - `tmux ls` : 세션 이름 찾기 (출력의 첫 번째 열)
  - `tmux attach-session -t [session_name]` : 해당 session에 연결하기


- 스크롤하기 : `[cmd] b [`
- 특정 세션 강제 종료 : `tmux kill-session -t session_number`

<b>명령어</b>
- prefix `[cmd] b` + [key]`


- 모든 명령 목록 출력 : `[cmd] b ?`



<b>Tmux 창 및 관리를 위한 명령어</b>
- `[cmd] b c` : shell이 있는 새 창 만들기
  - `[cmd] b [num]` : window 레벨에서 명령어로 창 이동
- `[cmd] b d` : 현재 프로세스를 보존하면서 tmux 나가기 (결과 : detached from session 1)
  - 해당 session이 더 이상 없는지 (잘 나가졌는지 확인) `tmux ls`
  - `tmux attach` : session 다시 들어가기
- `[cmd] b w` : 목록에서 창 선택
- `[cmd] b 0` : 창 0으로 전환 (숫자 기준)
- `[cmd] b ,` : 현재 창 이름 변경
- `[cmd] b %` : 현재 창을 두 개 창으로 가로 분할
- `[cmd] b "` : 현재 창을 두 개 창으로 수직 분할
- `[cmd] b o` : 다음 창으로 이동
- `[cmd] b ;` : 현재 창과 이전 창 사이 전환
- `[cmd] b x` : 현재 pane 종료
- `[cmd] b &` : window 종료
- detach - `tmux kill-session -t 0` : 전체 session 종료

- `[cmd] b` : tmux 시작
- `[cmd] b [화살표키]` : pane 사이 이동

pane : 나눠진 창

tmux가 세션을 시작할 때, 0이라는 성의없는 이름을 세션에 붙여준다
tmux를 스스로 통제할 수 있으려면 세션의 이름을 관리하는 것이 좋아 보인다. 이와 관련된 명령어를 정리한다
- `tmux new-session -s SESSION_NAME` : SESSION_NAME이라는 이름의 새로운 세션 시작
- `tmux list-sessions` : 현재 열려있는 세션 목록을 보여준다
- `tmux has-session -t TARGET_SESSION` : `TARGET_SESSION`이 열려있는지 확인
- `tmux attach-session -t TARGET_SESSION` : `TARGET_SESSION`으로 들어간다.

- Tmux가 시작되면 파일이 있는 경우 ~/.tmux.conf에서 구성 매개 변수를 읽습니다.
- 다음은 사용자 정의된 상태 표시줄과 몇 가지 추가 옵션이 포함된 ~.tmux.conf 구성 샘플입니다.

```vim
# ~/.tmux.conf

# Improve colors
set -g default-terminal 'screen-256color'

# Set scrollback buffer to 10000
set -g history-limit 10000

# Customize the status line
set -g status-fg  green
set -g status-bg  black
``` 

기본 Tmux 사용 단계
- 명령 프롬프트에 tmux new -smy_session을 입력합니다.
- 원하는 프로그램을 실행합니다.
- `[cmd] b d` 를 사용하여 세션에서 분리합니다.
- tmux attach-session -ty_session을 입력하여 Tmux 세션에 재연결




윈도우 관련 명령어
- 새 윈도우 생성 : `[cmd] b c`
- 새 윈도우 이동 : `[cmd] b b [숫자]`

틀 관련 명령어
- 틀 나누기
  - 좌우로 나누기 : `[cmd] b %`
  - 위아래로 나누기 : `[cmd] b "`
- 틀끼리 이동하기
  - `[cmd] b 방향키`
  - `[cmd] b q`
  - 순서대로 이동 : `[cmd] b o`
- 틀 삭제
  - `[cmd] d`
- 틀 사이즈 조정
  - L,R,U,D 입력하면 상하좌우로 조절됨 : `[cmd] b : resize_pane -L 10`
  - `[cmd] b [alt] 방향키`

단축키 목록 : `[cmd] b ?`

https://edykim.com/ko/post/tmux-introductory-series-summary/
