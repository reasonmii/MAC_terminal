<b> VIM code </b>
- [vim Cheat Sheet](https://vim.rtorr.com/)
- ls : check files in the directory

<b> VIM file code </b>
- i - insert
- :wq or :x or ZZ - write (save) and quit
- :q - quit (fails if there are unsaved changes)
- :q! or ZQ - quit and throw away unsaved changes
- :wqa - write (save) and quit on all tabs

<b> VIMRC </b>
- .vimrc 파일 수정을 통해 vim 에디터 설정 변경 가능 (별도 플러그인 설치X)
- .vimrc 파일 생성/open
```
vi ~/.vimrc
```

<b> color-scheme </b>
- vim 테마 다운 : [Best VIM color-schemes](https://www.slant.co/topics/480/~best-vim-color-schemes)
- vim 테마 적용 : ~/.vim/colors 경로에 다운받은 테마 파일 이동
```
mkdir ~/.vim/colors
mv onehalfdark.vim ~/.vim/colors/
```

