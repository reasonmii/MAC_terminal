
`#!/bin/bash` = `#!/bin/sh`
- 보통 script 맨 위에 작성되어 있음
- 의미
  - #! : script를 실행할 shell 지정
  - /bin/bash : 해당 파일을 bash shell로 실행해라
- bash는 풍부한 기능과 다양한 문법을 지원
  - 단점 : 기능이 많다보니 성능이 떨어짐 (script가 복잡해질수록 속도↓)
  - 해결방법 : 상대적으로 가벼운 dash를 스크립트 실행에 사용
- history 명령어 지원 (bash만 가능)
  - 옵션 포함 명령어 전체 확인 + 실행 가능
  - dash는 가벼운 대신 사용자 interaction할 수 있는 기능이 거의 없음
  - 따라서 로그인쉘로 bash 사용하는 경우가 여전히 대부분
