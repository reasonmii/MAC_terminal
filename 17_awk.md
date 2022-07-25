
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
    - `-f` option : awk program 파일 실행
      - `awk -f [awk file] [file]`
      - `awk -f awkp.script ./file.txt`
    - `-f` 외 option : awk가 실행할 awk program 코드 직접 지정
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

<b>awk program language</b>
- awk program이 프로그래밍 언어로 작성되는 만큼 다양한 요소들을 사용하여 프로그래밍
- awk 표현식 : C 프로그래밍 언어 표현식과 유사
```
    (E),    $n,     ++E,    --E,    E++,    E--,    E^E,    !E,     +E,
    -E,     E*E,    E/E,    E%E,    E+E,    E-E,    E E,    E<E,    E<=E,
    E!=E,   E==E,   E>E,    E>=E,   E~E,    E!-E,   E in array,     (n) in array, 
    E&&E,   E||E,   E1?E2:E3        V^=E,   V%=E,   V*=E,   V/=E,   V+=E,
    V-=E,   V=E
```
- awk program keyword
```
    BEGIN   delete  END     function    in      printf
    break   do      exit    getline     next    return
    continue        else    for         if      print      while
```
- 특수 목적으로 미리 정의된 변수
  - ARGC        : ARGV 배열 요소 개수
  - ARGV        : command line argument에 대한 배열
  - CONVFMT     : 문자열을 숫자로 변경할 때 사용할 형식 ex) `%.6g`
  - ENVIRON     : 환경변수에 대한 배열
  - FILENAME    : 경로를 포함한 입력 파일 이름
  - FNR         : 현재 파일에서 현재 레코드의 순서 값
  - FS          : 필드 구분 문자 (default : space)
  - NF          : 현재 레코드 내 필드 개수
  - NR          : 입력 시작 점에서 현재 레코드의 순서 값
  - OFMT        : 문자열을 출력할 때 사용할 형식
  - OFS         : 결과 출력 시 필드 구분 문자 (default : space)
  - ORS         : 결과 출력 시 레코드 구분 문자 (default : newline)
  - RLENGTH     : match 함수에 의해 매칭된 문자열 길이
  - RS          : 레코드 구분 문자 (default : newline)
  - RSTART      : match 함수에 의해 매칭된 문자열의 시작 위치
- 함수
  - Arithmetic Functions : `atan2(y,x), cos(x), sin(x), exp(x), log(x), sqrt(x), int(x), rand(), srand([expr])`
  - String Functions : `gsub(ere, repl[, in]), index(s, t), length[([s])], match(s, ere), split(s, a[, fs ]), sprintf(fmt, expr, expr, ...), sub(ere, repl[, in ]), substr(s, m[, n ]), tolower(s), toupper(s)`
  - Input/Output and General Functions : `close(expression), getline, getline var, system(expression)`

<b>기본 출력</b>
- `awk '{print}' [file]` : 파일 전체 내용 출력
- `print $n` : n번째 field 값 출력
  - `awk '{print $0}' [file]` : record 출력
  - `awk '{print $1}' [file]` : 1번째 field 값 출력
  - `awk '{ print $1,$2 }' [file]` : 1, 2번째 field 값 출력
- `awk '{print "STR"$1, "STR"$2}' [file]` : 필드 값에 임의 문자열 같이 출력

<b>부분 출력</b>
- `awk '/STR/' [file]` : 지정된 문자열을 포함하는 레코드만 출력
  - `/regex/` : 정규 표현식 (Regular Expression) 사용하여 pattern 검색 가능
  - `awk '/pp/' [file]` : 'pp'가 포함된 레코드
  - `awk '/[2-3]0/' [file]` : 20, 30 이 포함된 레코드
- 특정 레코드만 출력
  - `exit` 키워드 사용하여, 조건에 따라 awk 실행 중지
  - `awk '{ print $0; exit }' [file]` : 1번째 레코드만 출력하고 실행 중지
  - `awk 'NR == 2 { print $0; exit }' [file]` : 2번째 레코드만 출력하고 실행 중지
- 필드 중 최대 값 출력
  - `awk '{max = 0; for (i=3; i<NF; i++) max = ($i > max) ? $i : max ; print max}' [file]`
- 특정 필드 값 비교를 통해 선택된 레코드만 출력
  - awk program language의 표현식 사용
  - `awk '$1 == 2 { print $2 }' [file]` : 1번째 field가 2인 레코드의 1번째 필드 출력
  - `awk '$3 > 70 { print $0 }' [file]` : 3번째 field가 70보다 큰 레코드 출력
  - `awk '$3 == 30 && $4 == 40 { print $2 }' [file]` : 3번째 field가 30이고 네 번째 필드가 40인 레코드의 두 번째 필드 출력

<b>연산</b>
- 특정 필드들의 합 구하기 : `awk '{sum += $3} END { print sum }' [file]`
- 여러 필드들의 합 구하기	: `awk '{ for (i=2; i<=NF; i++) total += $i }; END { print "TOTAL : "total }' [file]`
- 레코드 단위로 필드 합 및 평균 값 구하기 :	`awk '{ sum = 0 } {sum += ($3+$4+$5) } { print $0, sum, sum/3 }' [file]`
- 필드에 연산을 수행한 결과 출력
  - `awk '{print $1, $2, $3+2, $4, $5}' [file]` : 3번째 필드에 2를 더한 값 출력

<b>기타</b>
- 필드 구분 문자 변경
  - `awk -F ':' '{ print $1 }' [file]`
  - `awk -F ',' '{ print $1 }' [file]`
- awk 실행 결과 레코드 정렬
  - `awk '{ print $0 }' [file]`
  - awk + sort
    - `awk '{ print $0 }' file.txt | sort` : 출력 레코드를 오름차순 정렬
    - `awk '{ print $0 }' file.txt | sort -r` : 출력 레코드를 내림차순 정렬
- 레코드/필드 문자열 길이 검사
  - `awk ' length($0) > 20' [file]` : 레코드 길이가 20보다 큰 경우
  - `awk ' length($2) > 4 { print $0 } ' [file]` : 두 번째 field 길이가 4보다 큰 레코드
- 출력 필드 너비 지정
  - `printf` 함수를 사용하여 필드 값 출력 format 지정 (C언어와 동일)
  - `awk '{ printf "%-3s %-8s %-4s %-4s %-4s\n", $1, $2, $3, $4, $5}' [file]`

---

참고
- https://recipes4dev.tistory.com/171
