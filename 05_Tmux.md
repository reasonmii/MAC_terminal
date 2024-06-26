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
- 설치 : `brew install tmux`

<b>session 시작</b>
- `tmux` : session 시작
  - shell이 포함된 새 session 열림
  - session명 default : 숫자 (0~9 중 사용 가능한 첫 번째 값)
  - 하단 status bar : 모든 창 목록 표시
- `tmux new -s [session_name]`, `tmux new-session -s [session_name]` : session명 지정해서 시작
  - session명 직접 지정하면 여러 tmux session 실행 시 유용
  - 설명적인 이름이 좋음
- session, window 함께 생성해서 시작하기 : `tmux new -s [session_name] -n [window_name]`

<b>session 명령어</b>
- `tmux ls`, `tmux list-sessions` : 현재 열려있는 세션 목록
- `tmux has-session -t [session_name]` : 세션이 열려있는지 확인
- `tmux attach -t session_number` : 세션 다시 시작
- `[cmd] b d` : 현재 process 보존 + 일반 shell로 돌아가기
  - 나간 후에도 session에서 실행 중인 프로그램은 계속 실행됨
- `tmux attach-session -t [session_name]` : 해당 session 다시 들어가기
  - `tmux ls` : 세션 이름 찾기 (출력의 첫 번째 열)
- `tmux kill-session -t [session_name]` : session 강제 종료

<b>tmux 명령어</b>
- `exit` : 세션 종료
- prefix `[ctrl]+b` : 동시에
- `[ctrl]+b, ?` : 단축키 목록
- `[ctrl]+b, ,` : 현재 창 이름 변경
- `[ctrl]+b, $` : session명 변경
- `[ctrl]+b, ,` : window명 변경
- 생성
  - `[ctrl]+b, c` : shell이 있는 새 window 생성
- 분할
  - `[ctrl]+b, %` : 가로 분할
  - `[ctrl]+b, "` : 수직 분할
- 이동
  - `[ctrl]+b, w` : 목록에서 창 선택
  - `[ctrl]+b, [opt]` : window로 전환
    - num : 0~9 window number
    - n : next window
    - p : prev window
    - l : last window
    - w : window selector
    - f : find by name
  - `[ctrl]+b, o` : 순서대로 pane 이동
  - `[ctrl]+b, ;` : 현재 창과 이전 창 사이 이동
  - `[ctrl]+b, [방향키]` 방향키로 pane 이동
- 삭제/종료
  - `[ctrl]+b, x` : 현재 pane 종료
  - `[ctrl]+b, &`, `[ctrl] d` : window 종료
- pane 사이즈 조정
  - `[ctrl]+b, : resize_pane -L 10` : L,R,U,D = 상하좌우
  - `[ctrl]+b, [alt] 방향키`
- `[ctrl]+b, spacebar` : 틀 레이아웃 변경

<b>키 연결 및 해제</b>
- `[ctrl]+b, : bind-key [-cnr] [-t key-table] key command [arguments]`
- `[ctrl]+b, : unbind-key [-acn] [t key-table] key`

<b>설정 저장하기</b>
- `~/.tmux.conf` 파일 생성
- 옵션 설정
  - `set -g <option-name> <option-value>`  : set-option
  - `setw -g <option-name> <option-value>` : set-window-option
- `set-option -g default-shell /bin/zsh` : 기본 bash zsh로 변경 
- `set -g history-limit 10000` : history 라인 10000
- `set -g default-terminal 'screen-256color'` : Improve colors
- `set -g mouse on` : 마우스 사용
- Customize the status line
  - `set -g status-fg  green`
  - `set -g status-bg  black`

<b>copy mode</b>
- copy mode : console을 스크롤하거나 내용 복사하는 등의 기능 할 수 있는 mode
- `[ctrl]+b, [` : copy mode 진입
- `q`, `esc` : copy mode 나오기
- 이동
  - 방향키 : 커서 이동
  - pageUp, pageDown : 페이지 이동
    - terminal : alt + up/down
    - iTerm : fn + up/down
