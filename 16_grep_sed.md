
### grep
- `grep [opt] [pattern] [file/directory name]`
- pattern : 정규식 Regular Expression 사용
- grep을 pipe 입력 stream으로 주는 경우 filter처럼 동작
  - file/directory name을 안 써도 입력 stream으로 받은 내용, pattern을 바탕으로 grep 명령어 시행
  
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


---

참고
- https://jhnyang.tistory.com/287
- https://spadework-blog.tistory.com/94
