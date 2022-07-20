### apt : Advanced Packing Tool
- .deb 형식의 package 관리 tool (설치, 삭제, update)
- index는 `/etc/apt/sources.list'에서 관리

<b> apt vs. apt-get/apt-cache</b>
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
- 둘 차이 확인 코드
  - `sudo apt-get install python3-pip`
  - `sudo apt install gcc`

<b>설치</b>
- `apt install [package name]` : package 설치
  - package name 여러 개 지정하여 한 번에 설치 가능 (공백 구분)

<b>목록</b>
- `apt list` : package 목록
  - option 지정 : 상태 별 package 목록 조회
    - `apt list --installed` : 설치된 package 수
    - `apt list --upgradable` : 설치된 package 중 upgrade 대상 package 수
    - `apt list --all-versions` : repository에 등록된 package의 모든 version 수
  - ex) `apt list |wc -l` : repository에 등록된 package 수
    - `apt list --installed |wc -l`
- `apt search [key word]` : package 목록 검색
  - ex) `apt search docker`
- `apt show [package name]` : package 상세 정보 출력
  - version, 분류, 의존성 package, download 위치, site
  - ex) `apt show docker.io`

<b>update/upgrade</b>
- `apt update` : repository index update
  - repository 목록은 `/etc/apt/sources.list` 파일에서 관리
  - ex) `sudo apt update` : `/var/lib/apt/lists` package 목록 update
- `apt upgrade` : 모든 package를 최신 버전으로 upgrade
  - ex) `sudo apt upgrade`
- `apt full-upgrade` : 전체 시스템을 새 버전으로 upgrade

<b>삭제</b>
- `apt remove [package name]` : package 삭제
  - 저장한 package만 제거
  - 해당 package 설정과 관련된 파일은 삭제X
  - ex) `sudo apt remove docker.io`
- `apt purge [package name]` : package와 관련 설정 파일 제거
  - ex) `sudo apt purge wget`
- `apt autoremove` : 불필요한 package 제거 (현재 사용되지 않는 package)
  - ex) `sudo apt autoremove`

<b>기타</b>
- `apt edit-sources` : source list 편집

---

참고
- https://coding-groot.tistory.com/90
- http://taewan.kim/tip/apt-apt-get/
