"Syntax Highlighting : 구문 강조
if has("syntax")
    syntax on
endif

"color 테마 : onehalfdark 적용
colo onehalfdark

"Syntax Highlighting은 기본제공이라 안 예쁠 수 있음
" → 아래와 같이 추가 편집
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hlsearch            "검색어 하이라이팅
set nu                  "줄번호 표시
set autoindent          "자동 들여쓰기

"the number of context lines you would like to see above and below the cursor
"→ 2 lines visible while scrolling
set scrolloff=2

"on first <Tab> it will complete to the longest common string
"and will invoke wildmenu (a horizontal and unobtrusive little menu). On next <Tab> it will complete the first alternative and it will start to cycle through the rest. You can go back and forth with <Tab> and <S-Tab> respectively.
set wildmenu
set wildmode=longest,list



set ts=4                "tab 크기 
set sts=4               "st select
set sw=1                "스크롤바 너비
set autowrite           "다른 파일로 넘어갈 때 자동 저장
set autoread            "작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set cindent             "C언어 자동 들여쓰기
set bs=eol,start,indent
set history=256
"set paste               "붙여넣기 계단현상 없애기
set shiftwidth=4         "자동 들여쓰기 너비 설정
set showmatch            "일치하는 괄호 하이라이팅
set smartcase            "검색시 대소문자 구별
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set ruler                "현재 커서 위치 표시
set incsearch

"항상 상태바 표시
set laststatus=2
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

"마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

"파일 인코딩을 한국어로
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif
