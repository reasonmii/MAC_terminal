### 특수문자

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

---

### Redirection
- 표준(standard) stream 흐름 변경
- process의 입/출력을 파일로 사용
- 특수문자 `>`, `<` 사용
- `ls > ls.txt` : `ls` 명령어 출력 결과를 `ls.txt` 파일에 저장
  - `ls`의 출력 stream을 `ls.txt`의 입력 stream으로 전송
- `head < ls.txt` : `ls.txt` 처음 10줄 가져오기
  - `ls.txt`를 `head`의 입력 stream으로 전송
- `head < ls.txt > ls2.txt`
  - `ls.txt` 내용을 `head` 입력 stream으로 전송
  - `head` 명령어는 `ls.txt`의 처음 10줄 출력
  - `head` 명령어의 출력 stream을 `ls2.txt` 파일에 저장

---

### Pipe
- process의 출력 stream을 process의 입력 stream으로 사용할 때
  - redirection 기호 사용하면 오류 발생 : file/directory가 없다
  - → pipe 쓸 것
- 특수문자 `|` 사용
  - `A|B` : `|`를 기준으로 A에 있는 command의 표준 출력을 B에 있는 command의 표준 입력으로 사용
- `ls | grep ls.txt`
  - `ls`의 출력 stream을 `grep`의 입력 stream으로 보냄
  - 현재 directory에 `ls.txt` 파일이 있으면 결과 출력

---

### Redirection & Pipe
- `ls | grep ls.txt > ls3.txt`
  - `ls` 출력 stream을 `grep` 입력 stream으로 연결
  - `ls` 명령어의 출력물을 `grep` 명령어로 필터링
  - 최종 결과를 `ls3.txt` 파일에 기록
- `head dummy.txt 2>> error.txt`
  - `dummy.txt` 파일의 처음 10줄을 출력
  - 오류 stream은 `error.txt`에 연결해서 기록
    - ex) `dummy.txt` 파일이 없는 경우 오류 메시지가 `error.txt` 파일에 기록

---

참고
- https://jdm.kr/blog/4
- https://jdm.kr/blog/74









