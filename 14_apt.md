### apt : Advanced Packing Tool
- .deb 형식의 package 관리 tool (설치, 삭제, update)

<b> apt vs. apt-get (apt-cache)</b>
- 내부 동작 차이는 거의 없음
- apt : 자주 사용하는 option만으로 구성
  - 장점 : 사용자들이 사용하고 보기 편함 (예쁜 출력 + 추가 정보)
    - 색깔O
    - 진행 바를 통해 현재 진행상황 확인 가능
    - 상세한 출력 메시지
  - 단점 : 일부 기능 제한
- apt-get : 전체 option 사용 가능
  - manual 봐도 apt보다 apt-get이 4배
  - 추가 option을 통해 apt처럼 만들 수는 있음
  - 보통 `apt`를 사용하지만 script 작성 시에는 `apt-get`이 더 좋음
    - 다양한 기능 사용, 안정적, 호환성 높음 
- 둘 차이 확인 코드 : `sudo apt-get install python3-pip`, 'sudo apt install gcc`

---

참고
- https://coding-groot.tistory.com/90
