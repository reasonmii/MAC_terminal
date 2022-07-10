<b>VIM code</b>
- [vim Cheat Sheet](https://vim.rtorr.com/)
- pwd : print working directory
- ls : check files in the directory
- open . : 현재 경로 폴더 열기
- tab : 폴더/파일명 자동 완성
- rm <fileName> : delete a file
- rmdir <folderPath> : delete a directory
- rm -rf <folderPath>
  - rm -r <folderPath> : recursively delete a directory and all its contents
  - rm -f <folderPath> : forcibly delete files without asking
- Error : permission denied 
  - solution : chmod 755 명령어
  - read, write 권한을 주는 거

<b>VIM file code</b>
- i - insert
- dd : 해당 line 삭제
- p : paste
- v : multiple line select
- :set paste enter - 전체 파일 tab 부분까지 정확히 복사 (붙여 넣을 곳에 cmd v)
- :wq or :x or ZZ - write (save) and quit
- :q - quit (fails if there are unsaved changes)
- :q! or ZQ - quit and throw away unsaved changes
- :wqa - write (save) and quit on all tabs
  
<b>VIMRC</b>
- .vimrc 파일 수정을 통해 vim 에디터 설정 변경 가능 (별도 플러그인 설치X)
- .vimrc 파일 생성/open
```
vi ~/.vimrc
```

<b>color-scheme</b>
- vim 테마 다운 : [Best VIM color-schemes](https://www.slant.co/topics/480/~best-vim-color-schemes)
- vim 테마 적용 : ~/.vim/colors 경로에 다운받은 테마 파일 이동
```
mkdir ~/.vim/colors
mv onehalfdark.vim ~/.vim/colors/
```

