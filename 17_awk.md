
### awk
- awk 기능 디자이너들의 이니셜 조합 : 'A'ho + 'W'einberger + 'K'ernighan
- 'awk programming language'로 작성된 프로그램 실행
  - Linux에서 Shell Script로 작성된 파일을 Linux Shell로 실행하는 것과 같음
- 파일을 record(line), field 단위로 파일 식별
  - field : text를 공백 문자로 구분
  - ★ record 구분 문자(newline), field 구분 문자(space, tab) → awk 프로그램 option으로 변경 가능
- 주어진 패턴과 일치하는 record를 찾아 지정된 action 실행
- 주 사용
  - 텍스트 파일 전체 내용 출력
  - 패턴이 포함된 레코드 출력
  - 필드 값 비교에 따라 레코드 출력
  - 파일의 특정 필드 출력
  - 특정 필드에 문자열을 추가해서 출력
  - 특정 필드에 연산 수행 결과 출력

<b>사용법</b>
- `awk [option] '[awk program]' [argument]`
  - option
    - `-F` : 필드 구분 문자 지정
    - `-f` : awk program 파일 경로 지정
    - `-v` : awk program에서 사용될 특정 variable 값 지정
  - awk program
    - option 보다는 awk program 작성으로 대부분 조작
    - `-f` option이 아닌 경우 : awk가 실행할 awk program 코드 직접 지정
    - ' '(single quotation marks) 안에 작성
    - ★ 기본 구조 : `'pattern [action]'`
  - argument : 입력 파일 / variable 값 지정
- record, field 지정
  - `$0` : record 하나 전체
  - `$1, $2, ..., $n` : 특정 record에 포함된 각 field (순서대로)
  - 예시 : record 길이가 10 이상인 경우, 3~5번째 field 출력
    - `awk 'length($0) > 10 {print $3, $4, $5} ' ./file.txt`

<b>awk program</b>
- 다양한 표현식, 변수, 함수 등 사용
- `pattern` 생략 시 모든 record 선택 (default)
  - `awk '{ print }' ./file.txt` : file.txt의 모든 record 출력
- `action` 생략 시 `print` 적용 (default)
  - `awk '/p/' ./file.txt` : file.txt에서 p를 포함하는 record 출력
- pattern
  - BEGIN : 입력 데이터에서 첫 번째 record 처리 전 BEGIN에 지정된 액션을 실행
  - END : 모든 record 처리 후 END에 지정된 액션 실행
  - `awk 'BEGIN {print "TITLE : Field value 1,2"} {print $1, $2} END {print "Finished"}' file.txt`

<b>명령어 예시</b>
- 파일 전체 내용 출력 : `awk '{ print }' [FILE]`
- 필드 값 출력	: `awk '{ print $1 }' [FILE]`
- 필드 값에 임의 문자열을 같이 출력	: `awk '{print "STR"$1, "STR"$2}' [FILE]`
- 지정된 문자열을 포함하는 레코드만 출력	: `awk '/STR/' [FILE]`
- 특정 필드 값 비교를 통해 선택된 레코드만 출력 :	`awk '$1 == 10 { print $2 }' [FILE]`
- 특정 필드들의 합 구하기 :	`awk '{sum += $3} END { print sum }' [FILE]`
- 여러 필드들의 합 구하기	: `awk '{ for (i=2; i<=NF; i++) total += $i }; END { print "TOTAL : "total }' [FILE]`
- 레코드 단위로 필드 합 및 평균 값 구하기 :	`awk '{ sum = 0 } {sum += ($3+$4+$5) } { print $0, sum, sum/3 }' [FILE]`
- 필드에 연산을 수행한 결과 출력하기 :	`awk '{print $1, $2, $3+2, $4, $5}' [FILE]`
- 레코드 또는 필드의 문자열 길이 검사 : `awk ' length($0) > 20' [FILE]`
- 파일에 저장된 awk program 실행 : `awk -f [AWK FILE] [FILE]`
- 필드 구분 문자 변경하기 :	`awk -F ':' '{ print $1 }' [FILE]`
- awk 실행 결과 레코드 정렬하기 : `awk '{ print $0 }' [FILE]`
- 특정 레코드만 출력하기 : `awk 'NR == 2 { print $0; exit }' [FILE]`
- 출력 필드 너비 지정하기 :	`awk '{ printf "%-3s %-8s %-4s %-4s %-4s\n", $1, $2, $3, $4, $5}' [FILE]`
- 필드 중 최대 값 출력 : `awk '{max = 0; for (i=3; i<NF; i++) max = ($i > max) ? $i : max ; print max}' [FILE]`


---

참고
- https://recipes4dev.tistory.com/171
