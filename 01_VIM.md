<b>VIM</b>
- linux의 대표적인 editor
- linux에서 `vi`, `vim` 명령어 모두 vim editor 실행
- 마우스로 클릭하지 않고 단축키로 모든 작업이 가능하니 작업 속도가 매우 빨라짐

<b>VIMRC</b>
- .vimrc 파일 수정을 통해 vim 에디터 설정 변경 가능 (별도 플러그인 설치X)
- `vi ~/.vimrc` : .vimrc 파일 생성, open

<b>color-scheme</b>
- vim 테마 다운 : [Best VIM color-schemes](https://www.slant.co/topics/480/~best-vim-color-schemes)
- `mkdir ~/.vim/colors`
- `mv onehalfdark.vim ~/.vim/colors/`
  - `~/.vim/colors` 경로에 다운받은 테마 파일 이동하면 적용됨

---

### VIM code
- [vim Cheat Sheet](https://vim.rtorr.com/)
- `pwd` : print working directory
- `ls` : check files in the directory
- `open .` : 현재 경로 폴더 열기
- `tab` : 폴더/파일명 자동 완성
- `rm <fileName>` : delete a file
- `rmdir <folderPath>` : delete a directory
- `rm -rf <folderPath>`
  - `rm -r <folderPath>` : recursively delete a directory and all its contents
  - `rm -f <folderPath>` : forcibly delete files without asking

<b>실행</b>
- `vi <fileName>` : open the file
- `vi <file1> <file2>` : file1, file2를 순서대로 열기
- `view <fileName>`, `vi -R <fileName>` : 읽기모드 열기
- `vi + <fileName>` : file 열고 맨 마지막 줄에 커서 위치
- `vi +n <fileName>` : file 열고 n번째 줄에 커서 위치
- `vi -r <fileName>` : 손상된 파일 회복

<b>입력모드 전환</b>
- `i` : 커서 위치에서 입력모드
- `I` : 커서가 위치한 줄 맨 앞에서 입력모드
- `a` : 커서가 위치한 다음 칸에서 입력모드
- `A` : 커서가 위치한 줄 맨 뒤에서 입력모드
- `o` : 커서가 위치한 줄 아래에 빈 줄 삽입
- `O` : 커서가 위치한 줄 위에 빈 줄 삽입
- `R` : 수정모드로 전환

<b>커서이동</b>
- `w` : 다음 단어의 끝 부분으로 커서 이동
- `e` : 다음 단어의 앞 부분으로 커서 이동
- `b` : 이전 단어로 이동
- `^,O` : 줄의 처음으로 이동
- `$` : 줄의 마지막으로 이동
- `H` : 화면 맨 위로 이동
- `M` : 화면 중간으로 이동
- `L` : 화면 맨 아래로 이동
- `G` : 글의 맨 밑으로 이동
- `nG` : n번째 줄로 이동
- `n%` : n퍼센트에 해당하는 위치로 이동
- `[shift] ↑` : 한 페이지 앞으로 이동
- `[shift] ↓` : 한 페이지 뒤로 이동
- `[cmd] i` : 한 화면 위로 이동
- `[cmd] b` : 한 화면 아래로 이동
- `[cmd] d` : 반 화면 위로 이동
- `[cmd] u` : 반 화면 아래로 이동
- `[cmd] e` : 한 줄 위로 이동
- `[cmd] y` : 한 줄 아래로 이동

<b>복사</b>
- `d` : 현재 커서 위치의 단어 복사
- `yy` : 현재 커서가 위치한 줄 복사
- `ny` : 현재 커서가 위치한 줄에서부터 아래로 n줄 복사
- `nyy` : 현재 커서부터 n행만큼 복사
- `:n1,n2y` : n1~n2번째 줄 복사
- `:set paste` : 전체 파일 tab 부분까지 정확히 복사 (붙여 넣을 곳에 `cmd v`)

<b>붙여넣기</b>
- `p` : 커서 뒤에 붙여넣기
- `P` : 커서 앞에 붙여넣기
- `:npu` : n행에 복사되어 있는 내용 붙여넣기

<b>삭제</b>
- `x` : 현재 커서 위치의 문자 삭제
- `dw` : 단어 삭제
- `dd` : 해당 line 삭제
- `ndd` : 현재 커서부터 n줄 삭제
- `d ↑` : 현재 커서에서 위로 2줄 삭제
- `d ↓` : 현재 커서에서 아래로 2줄 삭제
- `D` : 해당 줄에서 커서 뒷부분 모두 삭제
- `u` : 바로 전에 수행한 명령 취소

<b>문자열 대체</b>
- `:s/str/rep` : 현재 줄의 str을 rep로 대체
- `:l,.s/str/rep/` : 1부터 현재 줄의 str을 rep로 대체
- `:%s/str/rep/g` : 파일 전체 str을 rep로 전부 대체
- `:.$/aaa/bbb` : 커서 위치부터 파일 끝까지 있는 모든 aaa를 bbb로 대체

<b>기타</b>
- `v` : multiple line select
- `:set nu` : 줄 번호 보여주기
- `:set nonu` : 줄 번호 보여주기 취소
- `.` : 바로 전에 실행한 명령어 재실행
- `[ctrl] I` : 불필요한 화면 정리 후 다시 표시

<b>저장 및 종료</b>
- `:w` : save
- `:wq`, `:x`, `ZZ` : save and quit
- `:q` : quit (fails if there are unsaved changes)
- `:q!`, `ZQ` : quit and throw away unsaved changes
- `:wqa` : save and quit on all tabs


---

### cat
- `cat [opt] [fileName]`
  - option
    - no option : 파일 내용 그대로 출력
    - `-A`, `-vET` : show all (탭 `^I`, 줄바꿈 `$` 포함)
    - `-n` : 모든 라인 앞에 번호 출력 (빈 라인 포함)
    - `-b` : 비어있지 않은 라인만 번호 출력
    - `-T` : 탭을 `^I`로 출력
    - `-E` : 줄바꿈 `$` 출력 (빈 라인 포함)
    - `-s` : 연속된 빈 라인을 하나로 출력
    - `-v` : 탭`^I`과 줄바꿈`$`을 제외한 nonprinting 문자를 ^, M- 사용하여 출력
    - `-t`, `-vT` : nonprinting 문자 출력 (탭 `^I` 포함)
- `cat > [fileName]` : 터미널 자체에 파일 내용 입력 - `[cmd] c` : 종료
- `cat [file1] [file2] [file3]` : print 'file1', 'file2', 'file3'
- `cat [file1] [file2] > [newName]` : 'file1', 'file2'를 합친 내용 'newName'으로 저장
- `cat [file1] [file2] >> [fileName]` : 'file1', 'file2'를 합친 내용 'fileName'(기존파일)에 이어쓰기
- `cat [fileName] | grep "[word]" | wc -l`
  - ex) `cat test.log | grep "acc" | wc -l`
  - 'test.log' 파일에서 'acc'라는 단어가 있는 line 수를 세라
- `cat --help` : 도움말 표시
- `cat --version` : 버전 표시

<b>head</b>
- `head [opt] [fileName]`
  - option
    - no option : 위 10줄 출력
    - `-c[n]` : 처음 n bytes 출력
    - `-n[n]` : 처음 n줄 출력
    - `-q` (quiet) : header 출력X
    - `-v` (verbose) : header 항상 출력
    - `--help`
    - '--version'

### tail
- `tail [opt] [fileName]`
  - option
    - no option : 아래 10줄 출력
    - `-c[n]` : 마지막 n bytes 출력
    - `-n[n]` : 마지막 n줄 출력
    - `-f`, `-F` (follow) : 추가되는 내용 append 하여 출력
    - `--max-unchanged-stats=N`: N번 바뀌기 전 파일 open (default 5)
    - `-q` (quiet) : header 출력X
    - `--retry` : 접속 안 돼도 계속 다시 시도
    - '-s', '--sleep-interval=N` : iterations 중 N초 sleep
    - `-v` (verbose) : header 항상 출력
    - `--help`
    - '--version'

### history
- 사용한 명령어들을 'RAM history list'에 임시 저장하고, 종료 시점에는 history file을 업데이트하며 모두 추가함
- 기본 확인
  - `echo $HISTFILE` : 저장된 경로 및 파일명 (보통 '.bash_history')
    - ex) `cat $HISTFILE | head -3` : history file에서 위에서 3번째 줄까지 보여줘라
  - `echo $HISTFILESIZE` : history file 최대 크기
  - `echo $HISTSIZE` : history에 저장 가능한 최대 명령어 개수
- `export HISTSIZE=0` : history 사용하고 싶지 않을 때 (이력 남기기 싫을 때)
- `history [opt]`
  - option
    - `-c` : RAM에 있는 history list 삭제
      - '.bash_history' 파일이 삭제되는 것 아님 (로그아웃, 로그인해야 파일 내용도 완전히 삭제)
    - `-n` : history list에만 있는 내용을 "출력하고" history 파일에 추가
    - `-a` : history list에만 있는 내용을 (종료 안했어도) "지금" history 파일에 추가
    - `-d offset` : history 파일에서 offset(줄번호) 위치의 명령어 삭제
    - `-r` : history 파일을 읽고 history list에 내용 추가
    - `-w [fileName]` : 현재 history를 새로운 파일로 저장
      - fileName 안 쓰면 기본 history 파일에 overwrite
    - `--help`
- 이전 명령어 실행
  - `!!` : 바로 직전에 실행한 재실행
  - `!ps` : 특정 문자가 들어간 최근 명령어 재실행
  - `![n]` : history 파일에서 n번째에 저장된 명령어 실행
  - `![-n]` : history 파일에서 마지막에서 n번째 저장된 명렁어 실행
  - `![str]`, `!?[str]` : 'str'로 시작하는 가장 최근에 실행한 명령어 실행
  - `![str]:p` : 'str'로 시작하는 가장 최근에 실행한 명령어 출력 (실행X)
    - `:p`는 `!?[str]`과는 같이 쓸 수 없음
- `[cmd] r` : reverse-i-search 모드로 들어감
  - 입력하는 글자에 부합하는 명령어 하나씩 보여줌
  - ex) 'world' 입력 - 'world'가 들어간 명령어 모두 출력
- `history | grep [str]` : history에서 'str'이 있는 부분 출력
  - `history | grep ^[str]` : history에서 'str'로 시작하는 명령어만 출력
- `cat [historyfile] | grep ^[str] | tail -n 1` : history 파일에서 str로 시작하는 가장 최근 명령어 출력

---

### Error
- vi, ls, mkdir, rm 등 아무 것도 인식 못 할 때
  - `vi ~/.zshrc` - 경로 추가 : `export PATH=%PATH:/bin:/usr/local/bin:/usr/bin` - `source ~/.zshrc`
- permission denied 
  - `chmod 755 명령어` : read, write 권한을 주는 거

