
### crontab
- = window scheduler
- 특정 시간에 특정 작업을 해야하는 경우
- 한 줄에 하나의 명령만 쓰기
  - ex) `* * * 5 5 /home/script/test.sh` - 줄 나누면 안됨
- 주석 처리 : `#`
  - `# 주석 #`
  - `#--------------------#`
  - `# 이것은 주석입니다. #`
  - `#--------------------#`

<b>기본 사용</b>
- `crontab -e` : crontab을 설정하는 편집기 열기
  - 각종 crontab 명령어 입력 후 `:wq` - 갱신
- `crontab -l` : 현재 crontab 내용 확인 (표준 출력)
- `crontab -r` : crontab 삭제
- 기본 사용 예시
  - `crontab -e`
  - 내용 입력 : `* * * * * ls -al`
    - 별 다섯 개 = "매 분마다 실행" 

<b>주기 결정</b>
- `* * * * *`
- 각 별 위치에 따라 주기를 다르게 설정 가능
- 순서 : 분(0-59) - 시간(0-23) - 일(1-31) - 월(1-12) - 요일(0-7)
- 별 대신 괄호 안 숫자 범위로 입력 가능
  - 요일 : 1 월요일, 6 토요일, 0/7 일요일
- `* , - /` 를 이용해서 여러 가지 방법으로 주기 설정 가능

<b>주기별 예제</b>
- 매분 'test.sh' 실행 : `* * * * * /home/script/test.sh`
- 특정 시간 실행
  - 매주 금요일 오전 5시 45분 'test.sh' 실행
  - `45 5 * * 5 /home/script/test.sh`
- 반복 실행
  - 매일 매 시간 0분, 20분, 40분 'test.sh' 실행
  - `0,20,40 * * * * /home/script/test.sh`
- 범위 실행
  - 매일 1시 0분부터 30분까지 매분 'tesh.sh' 실행
  - `0-30 1 * * * /home/script/test.sh`
- 간격 실행
  - 매 10분마다 'test.sh' 실행
  - `*/10 * * * * /home/script/test.sh`
- 복잡한 실행 설정
  - 5일에서 6일까지 2시, 3시, 4시에 매 10분마다 'test.sh' 실행
  - `*/10 2,3,4 5-6 * * /home/script/test.sh`

<b>cron logging</b>
- log 안 남길 때 : `* * * * * /home/script/test.sh > /dev/null 2>&1`
- 처리 내역 log 남길 때
  - `* * * * * /home/script/test.sh > /home/script/test.sh.log 2>&1`
    - 매분마다 'test.sh.log' 파일 갱신 → 작업 내용이 어떻게 처리 되었는지 알 수 있음
    - 만약 `2>&1` 을 제거하면 shell script에서 표준 출력 내용만 나옴
  - 누적 log 쌓기 : log를 계속 남겨야 하는 경우
    - `* * * * * /home/script/test.sh >> /home/script/test.sh.log 2>&1`
    - but, 과도하게 쌓이면 Linux 퍼포먼스에 영향 → 가끔씩 비워주거나 파일을 새로 만들어 줄 것

<b>crontab backup</b>
- 주기적으로 crontab backup 필요
- 실수로 directory 삭제하거나 (`crontab -r`) 기존 cron 내용이 날아갈 수 있기 때문
- `crontab -l > /home/bak/crontab_bak.txt`
  - 크론탭 내용을 txt 파일로 만들어 저장
  - 자동화 code : `50 23 * * * crontab -l > /home/bak/crontab_bak.txt`
    - 매일 오후 11시 50분에 크론탭 백업

참고
- https://jdm.kr/blog/2
- https://jdm.kr/blog/4

