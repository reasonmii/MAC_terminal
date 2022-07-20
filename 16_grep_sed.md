
### grep
- `grep [opt] [pattern] [file/directory name]`
- pattern : 정규식 Regular Expression 사용
- grep을 pipe 입력 stream으로 주는 경우 filter처럼 동작
  - file/directory name을 안 써도 입력 stream으로 받은 내용, pattern을 바탕으로 grep 명령어 시행

---
  
### sed : stream editor
- `ed` + `grep` 명령어
  - 파일을 수정할 수 있지만 `ed`처럼 대화식 처리는 불가능
- line 1개 씩 읽고 표준출력 (원본파일 변경X)
  - 각 line을 읽을 때마다 ed와 같은 완전한 형식의 대치 연산자 사용
  - 일치하는 문자열이 없으면 그 line은 수정하지 않고 그대로 출력
- ed보다 좋은점
  - 아주 큰 파일을 처리할 때 주로 사용됨
  - line을 한 개씩 읽고 수정/출력하니, 기억장치 안의 buffer 사용X → 파일 크기 제한X
    - ed : buffer 사용 → buffer보다 큰 파일 처리 불가능
    - 보통 buffer 크기는 1MB 정도

<b>변경</b>
- `sed 's/addrass/address/' list.txt`
  - addrass를 address로 변경하여 출력
- `sed 's/\t/\/` list.txt
  - tab 문자를 enter로 변환하여 출력

<b>삭제</b>
- `sed '/TD/d' 1.html` : TD문자가 포함된 줄 삭제하여 출력
- `sed '/Src/!d' 1.html` : Src 문자가 있는 줄만 삭제X
- `sed '1.2d' 1.html` : 처음 1줄, 2줄 삭제
- `sed '/^$/d 1.html` : 공백라인 삭제 ★

<b>예제</b>
- 특정 문자열 변경
  - `sed 's/hello/goodbye/' data`
    - data 파일에서 각 라인 첫 번째 등장하는 hello를 goodbye로 변경
- 특정 문자열 포함한 행 삭제
  - `sed '/hello/d' data | cat -n`, `grep -v hello data | cat -n`
    - hello를 포함한 라인을 모두 찾아 삭제
- 특정 문자열만 삭제
  - `sed "s/hello//g" data | cat -n`
    - hello만 삭제 (라인 전부 삭제X)
- 라인 범위 지정해서 편집
  - `sed '3,7s/hello//g' data | cat -n`
    - 3~7행의 hello 삭제
- 문맥 범위 지정해서 편집
  - `sed "/hello/,/goodbye/s/bad/good/" data | cat -n`
    - hello를 포함한 라인부터 goodbye를 포함한 라인까지 중 "첫 번째" bad → good 변경
  - `sed "/hello/,/goodbye/s/bad/good/g" data | cat -n`
    - hello를 포함한 라인부터 goodbye를 포함한 라인까지 중 "모든" bad → good 변경
- 세 번째 라인 삭제
  - `sed '3d' data | cat -n`
- hello가 있는 라인만 프린트
  - `sed -n '/hello/p' data | cat -n`
- hello가 있는 라인은 두 번씩 프린트
  - `sed '/hello/p' data | cat -n`
- hello, Hello를 포함한 라인 모두 삭제
  - `sed '/[hH]ello/d' data | cat -n`
- 라인 1 ~ hello를 포함한 첫 번째 라인까지 모든 라인 삭제
  - `sed '1,/hello/d' data | cat -n`
- data 파일 모든 라인마다 첫 세 글자 삭제
  - `sed 's/...//' data | cat -n`
- data 파일 모든 라인마다 마지막 세 글자 삭제
  - `sed 's/...$//' data | cat -n`
- 각 라인 첫 번째 공백 ~ 마지막까지 삭제
  - `who | sed 's/ .*$//'`
- 각 라인 처음부터 마지막 공백까지 삭제
  - `who | sed 's/^.*//'`
- 각 라인의 처음부터 문자가 있는 곳(':' 포함)까지 삭제
  - `who | sed 's/^.*://'

<b>하이라이트</b>
- 각 라인마다 뒤에 Hello World! 입력
  - `sed 'a\\Hello World\!' data | cat -n`
- 3번째 라인 뒤 Good Morning 문자 삽입
  - `sed '3a\\Good Morning' data | cat -n`
- 기존 라인들을 Oh! My God!!! 문자로 대체
  - `sed 'c\\Oh! My God!!!' data | cat -n`
- 2라인만 보여주고 중지
  - `q` : 명시된 라인에 도착 후 중지
  - `sed '2q' data | cat -n`
- 특정 라인 문자 치환
  - `sed -n '5s/hello/#####/gp' data | cat -n`
  - 특정 문자 전체 치환 : `sed 's/hello/#####/g' data | cat -n`
- `/^$/` : 공백라인
  - 라인의 시작, 끝 사이 아무것도 없는 라인과 부합
  - space도 안됨 (문자이기 때문)

- 모든 공백 라인 제거
  - `sed '/^$/d' data | cat -n`
  - `sed '/^ *$/d' : space 공백까지 제거
- 각 라인마다 공백라인 추가
  - `sed 'a\\' data | cat -n`
- 각 라인의 시작을 5 space로 대체
  - `sed 's/^/     /' data | cat -n`

<b>기타</b>
- `-f` : 명령어를 일일이 키보드에서 입력하지 않고 하나의 파일에 기억시켜 놓고 사용 가능
  - `sed -f command.file in.file`
  - 여러 개의 명령어를 연속적으로 자주 사용할 때 유용
  - ex) 아래와 같이 복수 개의 명령어가 파일에 기억되어 있는 경우
    - vi command.file
    - s/hello/goodbye
    - s/good/bad
  - 다음과 같은 명령어 입력하면? `echo "1234hello5678" | sed -f command.file
    - 결과 : 1234badbye5678

---

참고
- https://jhnyang.tistory.com/287
- https://spadework-blog.tistory.com/94
