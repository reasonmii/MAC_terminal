
ls : 현재 경로에 있는 파일들
pwd : print working directory
open . : 현재 경로 폴더 열기

tab : 폴더/파일명 자동 완성
rm <fileName> : 파일삭제

Error : permission denied 
- solution : chmod 755 명령어
  - read, write 권한을 주는 거

작성 중인 파일 내에서 작업
- esc
- dd : 해당 line 삭제
- 종료
  - :wq or :x or ZZ - write (save) and quit
  - :q - quit (fails if there are unsaved changes)
  - :q! or ZQ - quit and throw away unsaved changes
  - :wqa - write (save) and quit on all tabs
