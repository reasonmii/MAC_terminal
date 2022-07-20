
### nohup
- Linux에서 terminal session 연결이 끊어져도 process가 계속 동작하게 해 주는 명령어
- terminal session logout 시
  - → Linux가 해당 terminal에서 실행한 process들에게 HUP signal 전달 → 종료
  - 이 HUP signal을 무시하라는 것이 nohup
- nohup 명령어는 표준출력(standard output)을 nohup.out 파일로 redirection
  - process 상태 확인에 유용 : terminal 종료 후에도 nohup.out 파일에 계속 기록됨
  - but, 파일 용량이 매우 커지면 디스크 공간 낭비
  - 꼭 필요한 log만 출력할 것
    - log가 불필요한 경우 rediction을 통해 nohup.out 파일 생성X

<b>사용법</b>
- `nohup [process] &`
  - process : 실행하려는 program, script 지정
    - ★ 파일 권한은 반드시 755 이상이어야 함
  - `&` : background 실행이라는 것 명시
- log : 표준입력(0), 표준출력(1), 표준에러(2)
- `nohup [process] 1>/dev/null 2>&1 &`
  - nohup.out 파일 생성하지 않는 경우, 표준출력, 표준에러를 /dev/null로 redirection
  - `1>/dev/null` : 표준출력 사용X
  - `2>&1` : 표준에러도 표준출력(1)이 기록된 곳에 redirection

<b>예시</b>
- `nohup ./script.sh &`
  - message : " nohup: appending output to `nohup.out` "
  - 프로그램의 표준출력이 nohup을 실행시킨 경로의 nohup.out으로 출력
- `nohup ./script.sh > nohup_script.out`
  - `>`, `>>` 등 redirection으로 다른 파일에 출력
- `nohup ./script.sh > /dev/null` : 표준출력 기록X
- `ps -ef | grep script.sh` : background에서 돌고 있는 것 확인
- `nohup ./script.sh ` > script.out 2 > script.err &`
  - 표준출력(1) : script.out 파일로 redirection
  - 표준에러(2) : script.err 파일로 redirection
- `nohup ./script.sh > script.log 2>&1 &`
  - nohup 표준출력(1)을 script.log에 쓰고
  - 표준에러(2)도 표준출력(1)이 쓰여지는 파일에 redirection


<b>nohup으로 실행한 process 종료하기</b>
```vim
ps -ef | grep [process_name]  # PID 식별
kill -15 [PID]   # 해당 process에 종료 signal 전송 → 종료
kill -9 [PID]    # 종료되지 않으면 강제 종료 (비권장)
```

---

참고
- https://gracefulprograming.tistory.com/128
- https://joonyon.tistory.com/entry/%EC%89%BD%EA%B2%8C-%EC%84%A4%EB%AA%85%ED%95%9C-nohup-%EA%B3%BC-%EB%B0%B1%EA%B7%B8%EB%9D%BC%EC%9A%B4%EB%93%9C-%EB%AA%85%EB%A0%B9%EC%96%B4-%EC%82%AC%EC%9A%A9%EB%B2%95
