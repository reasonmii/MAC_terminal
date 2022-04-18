  1 " Syntax Highlighting
  2 if has("syntax")
  3     syntax on
  4 endif
  5 
  6 set ts=4
  7 set autoindent
  8 
  9 colo onehalfdark
 10 
 11 set laststatus=2
 12 set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
 13 
 14 set hlsearch "검색어 하이라이팅
 15 set nu "줄번호
 16 set autoindent "자동 들여쓰기
 17 set scrolloff=2
 18 set wildmode=longest,list
 19 set ts=4 "tab 크기 
 20 set sts=4 "st select
 21 set sw=1 " 스크롤바 너비
 22 set autowrite " 다른 파일로 넘어갈 때 자동 저장
 23 set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
 24 set cindent " C언어 자동 들여쓰기
 25 set bs=eol,start,indent
 26 set history=256
 27 set laststatus=2 " 상태바 표시 항상
 28 "set paste " 붙여넣기 계단현상 없애기
 29 set shiftwidth=4 " 자동 들여쓰기 너비 설정
 30 set showmatch " 일치하는 괄호 하이라이팅
 31 set smartcase " 검색시 대소문자 구별
 32 set smarttab
 33 set smartindent
 34 set softtabstop=4
 35 set tabstop=4
 36 set ruler " 현재 커서 위치 표시
 37 set incsearch
 38 set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
 39 " 마지막으로 수정된 곳에 커서를 위치함
 40 au BufReadPost *
 41 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 42 \ exe "norm g`\"" |
 43 \ endif
 44 " 파일 인코딩을 한국어로
 45 if $LANG[0]=='k' && $LANG[1]=='o'
 46 set fileencoding=korea
 47 endif
 48 " 구문 강조 사용
 49 if has("syntax")
 50  syntax on
 51 endif
