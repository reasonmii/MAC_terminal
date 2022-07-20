
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
    - 단, script 파일 권한이 755 이상이어야 함
  - `&` : background 실행이라는 것 명시
- `nohup [process] 1>/dev/null 2>&1 &`
  - nohup.out 파일 생성하지 않는 경우, 표준출력, 표준에러를 /dev/null로 redirection
  - `1>/dev/null` : 표준출력 사용X
  - `2>&1` : 표준에러를 표준출력과 같게 만듦

<b>nohup으로 실행한 process 종료하기</b>
- ps 명령어로 PID 식별
- kill을 통해 해당 process에 종료 signal 전송 → 종료

```vim
ps -ef | grep [process_name]

# PID 식별 후
kill -15 [PID]

# 종료되지 않으면 강제 종료 (비권장)
kill -9 [PID]
```

---

참고
- https://gracefulprograming.tistory.com/128

