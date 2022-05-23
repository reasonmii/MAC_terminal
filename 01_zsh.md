<b>Z shell</b>
- 상호작용 로그인 shell
- shell script를 위한 강력한 명령 줄 interpreter로 사용할 수 있는 unix shell
- bash, ksh, tcsh의 일부 기능을 포함하여 수많은 개선 사항이 갖추어진 확장형 Bourne shell
- 주요 특징
  - 실행 중인 모든 shell은 명령어의 history를 shell 끼리 공유
  - 간단한 설정을 통해 문법 오류 정정 (e.g. gut → git)
  - 다양한 테마를 지원

<b>Oh-My-Zsh</b>
- 사용 이유
  - 맥에서 터미널 실행시키면 원래 bash shell 실행됨 (검정바탕 흰글씨) -> 너무 무서움
  - 많은 사용자가 shell 환경설정을 변경하여 색상, 폰트 설정
    - github에서 이러한 dotfiles만 모아서 추천해줌 (그러나 이건 초보자가 보기엔 어려움)
- Oh-My-Zsh은 bash보다 최근에 나온 shell인 zsh의 환경설정을 다루는 framework
  - 커뮤니티 활동이 매우 활발하여 120여 개의 테마와 120여 개의 플러그인이 준비되어 있음
- 먼저 zsh, curl, wget, git 등이 설치되어 있어야 함

<b>Oh-My-Zsh 설치 방법</b>
1) Homebrew 설치 후 zsh 설치 `brew install zsh`
2) zsh 설치 확인 `zsh --version`
3) bash로 되어 있는 기본 쉘을 zsh로 변경
`which zsh`           # 쉘의 위치 확인 : /bin/zsh
`chsh -s /bin/zsh`    # 기본 쉘 변경
`chsh -s 'which zsh'` # 쉘의 위치 확인 + 기본 쉘 변경
4) 터미널 종료 후 재시작 -> 기본 쉘이 zsh인 것 확인
`echo $SHELL`         # 결과 : /bin/zsh

<b>Oh-My-Zsh 설치</b>
- ZSH에서 가장 널리 사용되는 플러그인 프레임 워크
- 많은 내장 플러그인과 테마 제공
- ZSH은 전체 패키지 관리자인 Antigen을 포함한 다른 플러그인 프레임 워크도 가지고 있지만 Oh-My-Zsh에는 많은 플러그인이 내장되어 있으며 제대로 작동함
- 화려한 테마와 편리한 기능을 가짐
- 터미널 환경을 획기적으로 변경
- iTerm이던 터미널 앱이든 리눅스든 상관없이 같은 환경으로 작업 가능

```console
# wget 으로 설치
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# 설치된 파일 확인
vi ~/.zshrc
# robbyrussell : default 테마
# 만약 ZSH_THEME = "random" 으로 하면 터미널을 열 때마다 여러 다양한 테마 체험 가능
# agnoster도 많이 씀
```
[모든 theme 미리보기](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)

<b>plugin</b>
vi ~/.oh-my-zsh/plugins
200개 가까운 plugin 있음
많이 사용되는 플러그인의 alias를 미리 정의해 놓은 것 (별명)
ex) alias ga = "git add" 로 정의하면 ga만 입력해도 git add 입력한 것과 같이 됨
vi ~/.zshrc 파일에 원하는 플러그인을 스페이스로 구분하면서 하나씩 나열하면서 입력

8) 터미널 껐다가 다시 열어보면 파란 물음표 발생
-> 폰트 깨져서 그럼 -> 폰트 설치 필요

폰트 다운 및 설치
[Source Code Pro]<https://github.com/powerline/fonts/blob/master/SourceCodePro/Source%20Code%20Pro%20for%20Powerline.otf>

```console
git clone https://github.com/powerline/fonts.git --depth=1
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```

9) 상단 - 터미널 - 환경설정 - 프로파일 - 텍스트
서체변경 : 'Source Code Pro for Powerline'

10) new line
코드가 길어지면 계속 옆에 쓰지 않고 자동으로 줄 바꿔서 다음 줄에 이어지게 써지게 하기
vi ~/.oh-my-zsh/themes/agnoster.zsh-theme
쭉 script 보면서 build_prompt() {} 구문 찾기
prompt_newline을 prompt_hg와 prompt_end 사이에 넣기

그리고 코드 제일 아래에 내려가서
prompt_newline()에 대한 기능을 정의하는 코드 입력

```console
prompt_newline() {
    if [[ -n $CURRENT_BG ]]; then
        echo -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{%k%F{blue}%}$SEGMENT_SEPARATOR"
    else
        echo -n "%{%k%}"
    fi

    echo -n "%{%f%}"
    CURRENT_BG=''
}
```

11) shell에 이모티콘 적용하기
vi ~/.zshrc

```console
prompt_context() { 
  # Custom (Random emoji) 
  emojis=("⚡️" "🔥" "🇰" "👑" "😎" "🐸" "🐵" "🦄" "🌈" "🍻" "🚀" "💡" "🎉" "🔑" "🚦" "🌙")
  RAND_EMOJI_N=$(( $RANDOM % ${#emojis[@]} + 1)) 
  prompt_segment black default "{하고싶은이름} ${emojis[$RAND_EMOJI_N]} " 
}
```

-> 터미널을 킬 때마다 랜덤으로 위의 작성된 이모티콘 적용됨
코드에서 ${emojis[$RAND_EMOJI_N]} 이 부분을 원하는 이모티콘으로 채우면 그 이모티콘만 나옴

12) Syntax Highlight 적용 
brew install zsh-syntax-highlighting
# ~/.zshrc에 들어가서 아래의 코드를 입력해줍니다.
vi ~/.zshrc
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

---
item2 설치하기
https://iterm2.com/ -> 다운로드
iTerm2 is a replacement for Terminal and the successor to iTerm

1) 상단 iTerm2 메뉴바에서 클릭 - Preferences - Profiles
1-1) Text - Font
monaco 로 되어 있는데 'Source Code Pro for Powerline'으로 변경
1-2) Colors 원하는 색으로 설정

2) 터미널에서 사용자 이름 삭제하기
vi ~/.zshrc
아래 콛 추가
```console
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}
```

3) iTerm color theme
https://iterm2colorschemes.com/
난 이 중 'Framer' 이 테마가 마음에 듬

brew install curl
cf) 자꾸 에러 뜨는 경우
- 에러 : zsh: command not found: brew
- zshrc 파일에 이 코드 추가 : export PATH=/opt/homebrew/bin:$PATH
- iTerm 껐다 켜기

# util이라는 이름의 directory를 생성하고 이동
mkdir util && cd util

# Framer color theme를 download
# 만약 다른 color 테마를 다운로드 할 경우 curl -LO 이후에 해당 URL을 넣으면 됨
curl -LO

ls
결과 : Framer.itermcolors

iterm preferences - profiles - colors (단축키 cmd ,)
우측 하단 color presets 선택
import - 방금 다운 받은 Framer 테마 설정



