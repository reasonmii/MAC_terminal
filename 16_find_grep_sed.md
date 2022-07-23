
### find
- `find [option] [경로] [표현식]`
  - option
    - P : 심볼릭 링크를 따라가지 않고, 심볼릭 링크 자체 정보 사용
    - L : 심볼릭 링크에 연결된 파일 정보 사용
    - H : 심볼릭 링크를 따라가지 않으나, Command Line Argument를 처리할 땐 예외
    - D : 디버그 메시지 출력
  - 경로
    - 상대 경로, 절대 경로 모두 가능
    - 생략하면?
      - 리눅스 : 현재 위치(.)를 입력받은 것으로 간주
      - 유닉스 : 에러 발생
  - 표현식
    - name : 해당 이름의 파일 찾기 (정규표현식 활용)
    - type : 지정된 파일 type에 해당하는 파일 검색
    - user : 해당 user에게 속한 파일 검색
    - empty : 빈 directory or 크기가 0인 파일 검색
    - delete : 검색된 파일 혹은 directory 삭제
    - exec : 검색된 파일에 대해 지정된 명령 실행
    - path : 지정된 문자열 패턴에 해당하는 경로에서 검색
    - print : 검색 결과 출력, 검색 항목은 newline으로 구분
    - print0 : 검색 결과 출력, 검색 항목은 null로 구분
    - size : 파일 크기를 사용하여 파일 검색
    - mindepth : 검색을 시작할 하위 directory 최소 깊이 지정
    - maxdepth : 검색할 하위 directory 최대 깊이 지정
    - atime : n일 이내에 access된 파일을 찾기
    - ctime : n일 이내에 만들어진 파일을 찾기
    - mtime : n일 이내에 수정된 파일을 찾기
    - cnewer file : 해당 파일보다 최근에 수정된 파일을 찾기
- 보통 option은 거의 사용되지 않고 표현식을 통해 찾을 target 정함
- 표현식은 중첩을 통해 대상 범위 축소 가능

<b>-name</b>
- 파일명으로 찾기
- 가장 많이 사용되는 표현식
- 와일드 카드 `*` 를 포함하여 자신이 원하는 파일들과 확장자들을 찾아서 나열
- `find . -name "*test*"` : 현재 directory에서 test가 포함된 파일 찾기
- `find . -name "test*"` : 현재 directory에서 test로 시작되는 파일 찾기
- `find . -name "*test"` : 현재 directory에서 test로 끝나는 파일 찾기
- `find . -name "*.txt"` : 현재 directory에서 .txt 확장자 모두 찾기
- `find . -name "*.txt" -delete` : 현재 directory에서 .txt 확장자 파일 검색 후 모두 삭제

<b>-type</b>
- type으로 찾기
- 특정 파일 type만 추출 가능
  - d : directory
  - f : 일반적인 파일
  - l : symbolic link
- `find . -type d` : 현재 directory에서 모든 directory 찾기
- `find . -name "*test*" -type d` : 현재 directory에서 test가 들어가는 directory 찾기
- `find . -type f` : 현재 directory에서 모든 파일 찾기

<b>-empty, -size</b>
- 파일 크기로 찾기
- size 단위
  - b : block
  - c : byte
  - k : kbyte
  - w : 2byte word
- `find . -empty` : 현재 directory에서 빈 directory or 크기가 0인 파일 검색
- `find . -name "*test*" -empty -delete` : 현재 directory에서 test가 들어가는 빈 directory or 크기가 0인 파일 검색하여 삭제
- `find . -size 1024c` : 현재 directory에서 1024byte 파일 검색
- `find . -size +1024c` : 현재 directory에서 1024byte 이상인 파일 검색
- `find . -size -1024c` : 현재 directory에서 1024byte 미만인 파일 검색
- `find . -size +1k -size -10k` : 현재 directory에서 1kb보다 크고 10kb보다 작은 파일 검색
 
<b>-exec</b>
- 검색된 파일에서 추가 명령 실행하기
- `find . -name "*test*" -exec ls -l {} \;` : 현재 directory에 "test"가 들어가는 파일을 찾아서 상세 정보 출력
- `find . -type f -exec grep "test" {} \;` : 현재 directory에 있는 파일에서 "test"가 들어가는 내용 찾기 
- `find . -name "*.txt" -exec rm {} \;` : 현재 directory에 ".txt" 확장자를 찾아서 모두 삭제
exec를 사용하여 검색한 대상에 추가 명령어를 수행할 수도 있습니다.

---

### grep
- `grep [opt] [pattern] [file/directory name]`
  - opt
    - -c : 일치하는 행의 수 출력
    - -i : 대소문자를 구별X
    - -v : 일치하지 않는 행 출력
    - -n : 행번호 함께 출력
    - -l : 패턴이 포함된 파일명 출력
    - -w : 단어와 일치하는 행만 출력
    - -x : 라인과 일치하는 행만 출력
    - -r : 하위 디렉토리를 포함한 모든 파일에서 검색
    - -m 숫자 : 최대로 표시될 수 있는 결과 제한
    - -F : 패턴을 문자열로 검색
  - pattern : 정규식 Regular Expression 사용
  - 파일은 여러 개 지정 가능
- 파일에서 특정 문자열, 정규표현식을 포함한 행 출력
- tail이나 ls 등 다양한 명령어와 조합하여 응용
- grep을 pipe 입력 stream으로 주는 경우 filter처럼 동작
  - file/directory name을 안 써도 입력 stream으로 받은 내용, pattern을 바탕으로 grep 명령어 시행

<b>종류</b>
- grep : 다중 패턴 검색 (정규표현식 사용)
- egrep : 정규 표현식 패턴으로 검색 (정규표현식 사용)
- fgrep : 문자열 패턴으로 검색 (정규표현식 사용X)

<b>문자열 검색</b>
- `grep 'error' [file name]` : 파일 내 문자열 'error' 찾기
- `grep 'error' [file name1] [file name2]` : 여러 파일에서 문자열 'error' 찾기
- `grep 'error' *` : 현재 directory 내에 있는 모든 파일에서 문자열 'error' 찾기
- `grep 'error' *.log` : 특정 확장자를 가진 모든 파일에서 문자열 'error' 찾기

<b>정규표현식 검색</b>
- `grep 'a*' [file name]` : 파일에서 a로 시작하는 모든 단어 찾기
- `grep [a-c] [file name]` : 파일에서 a, b, c로 시작하는 단어 찾기
- `grep 'a...z' [file name]` : 파일에서 a로 시작하고 z로 끝나는 5자리 단어 찾기
- `grep [aA]pple [file name]` : 파일에서 apple/Apple 단어 찾기
- `grep '^[ab]' [file name]` : 파일에서 a나 b로 시작되는 행 찾기
- `grep 'apple'[0-9] [file name]` : 파일에서 apple로 시작 + 숫자 0~9로 끝나는 모든 행을 찾기

<b>기타</b>
- 실시간 로그 보기 (tail + grep)
  - `tail -f mylog.log | grep 192.168.15.86`
  - 의미 : mylog파일을 실시간으로 액세스하고 IP주소가 192.168.49.16인 행만 추출
- 특정 파일에서 여러개 문자열 찾기
  - `|` (파이프) + `grep` 으로 특정 파일에서 여러 개 문자열 찾기 가능
  - `cat mylog.txt | grep 'Apple' | grep 'Banana'`
  - 의미 : mylog.txt 파일에서 Apple과 Banana이 있는 문자열 찾기
- grep 한 결과 값 txt 파일로 저장
  - grep한 결과가 길면 터미널에서 확인이 어렵기 때문에 txt파일로 저장하여 확인
  - `grep -n 'Apple' mylog.txt > result.txt`
  - 의미 : mylog.txt 파일에서 Apple이 있는 문자열들을 result.txt 파일에 저장

---
  
### sed : streamlined editor
- `ed` + `grep`
  - 파일을 수정할 수 있지만 `ed`처럼 대화식 처리는 불가능
- ![#f03c15]line 1개 씩 읽고 표준출력 (원본파일 변경X) ★★
  - 각 line을 읽을 때마다 ed와 같은 완전한 형식의 대치 연산자 사용
  - 일치하는 문자열이 없으면 그 line은 수정하지 않고 그대로 출력
- ed보다 좋은점
  - 아주 큰 파일을 처리할 때 주로 사용
  - line을 한 개씩 읽고 수정/출력하니, 기억장치 안의 buffer 사용X → 파일 크기 제한X
    - ed : buffer 사용 → buffer보다 큰 파일 처리 불가능
    - 보통 buffer 크기는 1MB 정도
- ※ `/^$/` : 라인의 시작, 끝 사이 아무것도 없는 공백 라인 - space도 안됨 (문자이기 때문)

<b>일부 출력</b>
- `sed -n '1p' [file]` : 첫 라인 출력
  - `p` : print
- `sed -n '1,3p' [file]` : 1~3 라인 출력
- `sed -n '8,$p' [file]` : 8~끝 라인 출력
- `sed -n '/hello/p' [file]` : hello가 있는 라인만 프린트
- `sed '/hello/p' [file]` : hello가 있는 라인은 두 번씩 프린트
- `sed '2q' [file]` : 2라인만 보여주고 중지
  - `q` : 명시된 라인에 도착 후 중지

<b>변경</b>
- `sed 's/addrass/address/' [file]` : 파일에서 각 라인 첫 번째 등장하는 addrass를 address로 변경
- `sed 's/\t/\/' [file]` : tab 문자를 enter로 변경
- `sed 'c\\Oh! My God!!!' [file]` : 모든 라인을 'Oh! My God!!!' 문자로 대체
- `sed 's/hello/#####/g' [file]` : 특정 문자 전체 치환
- `sed -n '5s/hello/#####/gp' [file]` : 특정 라인 문자 치환

<b>삽입</b>
- `sed 's/^/     /' data | cat -n` : 각 라인의 시작을 5 space로 대체
- `sed 'a\\Hello World\!' [file]` : 각 라인마다 뒤에 Hello World! 라인 삽입
- `sed '3a\\Good Morning' [file]` : 3번째 라인 뒤 Good Morning 라인 삽입
- `sed 'a\\' [file]` : 각 라인마다 공백라인 추가

<b>삭제</b>
- 특정 문자열만 삭제
  - `sed "s/hello//g" [file] | cat -n` : hello만 삭제 (라인 전부 삭제X)
    - ※ `cat -n` : 모든 라인 앞에 숫자 출력
  - `sed 's/...//' [file]` : 파일 내 모든 라인마다 첫 세 글자 삭제
  - `sed 's/...$//' [file]` : 파일 내 모든 라인마다 마지막 세 글자 삭제
- 라인 삭제
  - `sed '/TD/d' [file]` : TD문자가 포함된 라인 삭제
  - `sed '/[hH]ello/d' [file]` : hello, Hello를 포함한 라인 모두 삭제
  - `sed '/hello/!d' [file]` : hello 문자가 있는 라인만 삭제X
    - = `grep -v hello [file]`
  - `sed '1.2d' [file]` : 1~2 라인 삭제
  - `sed '3d' [file]` : 3 라인 삭제
  - `sed '/^$/d [file]` : 공백 라인 삭제 ★
- 모든 공백 라인 제거
  - `sed '/^$/d' [file]`
  - `sed '/^ *$/d' : space 공백까지 제거
- 범위 삭제
  - `sed '1,/hello/d' [file]` : 라인 1 ~ hello를 포함한 첫 번째 라인까지 모든 라인 삭제
  - `who | sed 's/ .*$//'` : 각 라인 첫 번째 공백 ~ 마지막까지 삭제
  - `who | sed 's/^.*//'` : 각 라인 처음부터 마지막 공백까지 삭제
  - `who | sed 's/^.*://'` : 각 라인의 처음부터 문자(`:` 포함)가 있는 곳까지 삭제

<b>범위 지정</b>
- 라인 범위 지정해서 편집
  - `sed '3,7s/hello//g' [file]` : 3~7행의 hello 삭제
- 문맥 범위 지정해서 편집
  - `sed "/hello/,/goodbye/s/bad/good/" [file]`
    - hello를 포함한 라인부터 goodbye를 포함한 라인까지 중 "첫 번째" bad → good 변경
  - `sed "/hello/,/goodbye/s/bad/good/g" [file]`
    - hello를 포함한 라인부터 goodbye를 포함한 라인까지 중 "모든" bad → good 변경

<b>기타 : `-f`</b>
- 명령어를 일일이 키보드에서 입력하지 않고 하나의 파일에 기억시켜 놓고 사용 가능
- 여러 개의 명령어를 연속적으로 자주 사용할 때 유용
- ex) `sed -f command.file in.file`
- 파일 내 아래와 같이 복수 개의 명령어 입력
```
vi command.file
s/hello/goodbye
s/good/bad
```
- 이후 다음과 같은 명령어 입력하면? `echo "1234hello5678" | sed -f command.file`
  - 결과 : 1234badbye5678

---

참고
- https://coding-factory.tistory.com/804
- https://coding-factory.tistory.com/802
- https://jhnyang.tistory.com/287
- https://spadework-blog.tistory.com/94
