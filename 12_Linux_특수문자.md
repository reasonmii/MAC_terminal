
<b>표준 출력</b>
- `>` : new (새로쓰기, 덮어쓰기)
  - `ls > test.txt` : ls 명령어 출력 내용을 test.txt 파일에 기록
- `>>` : append (이어쓰기)
  - `ls >> test.txt` : ls 명령어 출력 내용을 test.txt 파일에 이어 기록

<b>표준 입력</b>
- `<`
  - `cat < test.txt` : 표준 입력으로 읽어 화면에 내용 출력

<b>와일드 카드</b>
- `*` : 모든 문자와 일치하는 와일드 카드 특수 문자
  - ex) `ls tes*` : test.txt, tes/123.txt 등 일치하는 모든 file/directory 출력
- `?` : 하나의 문자와 일치하는 특수 문자
  - ex) `ls test.tx?` : test.txt, test.txx 등 하나 일치한 파일 출력

<b>파이프 문자</b>
- `|`
  - 어떠한 프로세스의 표준 출력을 다른 프로세스의 표준 입력으로 보냄
  - ex) `ps -ef | grep tomcat`
    - ps 명령어를 통한 표준 출력을 "tomcat"이 들어간 프로세스를 찾기 위한 표준 입력으로 삽입

<b>명령 command 문자</b>
- `#` : 주석 처리
- `;` : 명령의 끝
- `$` : 변수에 접근
- `&` : 명령을 백그라운드에서 실행
- `||` : 이전의 명령이 실패하면 실행하는 조건문 문자
- `&&` : 이전의 명령이 성공하면 실행하는 조건문 문자

<b>변수 접근 기호</b>
- `0` : stdin (표준 입력)
- `1` : stdout (표준 출력)
- `2` : stderr (에러 출력)
- 해당 문자와 변수 접근 문자를 합쳐서 사용 가능 ex) `&1`, `&2`
  - 'test.sh''을 실행하면서 나온 표준 에러를 test.log 파일에 덧붙여 쓰기
     - `./test.sh >> ./test.log 2>&1`
     - 표준 에러 redirection (stderr만 출력)
  - log 파일이 필요 없을 경우 (표준 출력 필요X) : `./test.sh >> /dev/null 2>&1`

참고
- https://jdm.kr/blog/4
