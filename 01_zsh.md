### ZSH

- mac terminal 기본 shell : bash (검정바탕 흰글씨) -> 너무 무서움
  - 많은 사용자가 shell 환경설정 변경 (colors, font)
    - github에서 이러한 dotfiles만 모아서 추천해줌 (but 초보자가 보기 어려움)
  - 그래서 Zsh : On-My-Zsh 사용
- 상호작용 로그인 shell
- shell script를 위한 강력한 명령 줄 interpreter로 사용할 수 있는 unix shell
- bash, ksh, tcsh의 일부 기능을 포함하여 수많은 개선 사항이 갖추어진 확장형 Bourne shell
- 주요 특징
  - 실행 중인 모든 shell끼리 명령어 history 공유
  - 간단한 설정을 통해 문법 오류 정정 (e.g. gut → git)
  - 다양한 테마 지원

<b>ZSH 설치</b>
1) Homebrew 설치 후 zsh 설치 : `brew install zsh`
2) zsh 설치 확인 : `zsh --version`
3) bash로 되어 있는 기본 쉘을 zsh로 변경
   - 쉘의 위치 확인 : /bin/zsh : `which zsh`
   - 기본 쉘 변경 : `chsh -s /bin/zsh`
   - 쉘의 위치 확인 + 기본 쉘 변경 : `chsh -s 'which zsh'`
4) 터미널 종료 후 재시작 -> 기본 쉘이 zsh인 것 확인 : `echo $SHELL` → 결과 : /bin/zsh

<b>Oh-My-Zsh</b>
- zsh의 환경설정을 다루는 plugin framework (zsh에서 가장 널리 사용됨)
- terminal 환경을 획기적으로 변경
  - 많은 내장 plugin과 화려한 테마, 편리한 기능 제공
  - 커뮤니티 활동이 매우 활발하여 120여 개의 테마와 120여 개의 플러그인이 준비되어 있음
- terminal/iTerm/Linux 상관없이 같은 환경으로 작업 가능

<b>Oh-My-Zsh 설치</b>
- wget 으로 설치 : `curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`
- 설치된 파일 확인 : `vi ~/.zshrc`
  - ZSH_THEME = "robbyrussell" (default)
    - agnoster : 가장 많이 씀
    - "random" : terminal 열 때마다 다른 테마
    - [모든 theme 미리보기](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)

<b>폰트 설치</b>
- terminal 껐다가 다시 열어보면 파란 물음표 발생 -> 폰트 깨져서 그럼 -> 폰트 설치 필요
- 폰트 다운 및 설치 : [Source Code Pro](https://github.com/powerline/fonts/blob/master/SourceCodePro/Source%20Code%20Pro%20for%20Powerline.otf)
  - clone : `git clone https://github.com/powerline/fonts.git --depth=1`
  - install : `cd fonts` `./install.sh`
  - clean-up a bit : `cd ..` `rm -rf fonts`
- 상단 - 터미널 - 환경설정 - 프로파일 - 텍스트 : 서체변경 : 'Source Code Pro for Powerline'

---

<b>plugin</b>
- `vi ~/.oh-my-zsh/plugins`
- 200개 가까운 plugin 있음
- 많이 사용되는 플러그인의 alias를 미리 정의
  - ex) alias ga = "git add" → ga 입력 시 git add로 인지
- `vi ~/.zshrc` 파일에 원하는 plugin을 space로 구분하여 하나씩 입력


<b>Terminal 사용자 이름 삭제</b>

```console
vi ~/.zshrc

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}
```

<b>new line</b>
- 코드가 길어지면 자동 줄 바꾸기 기능
- `vi ~/.oh-my-zsh/themes/agnoster.zsh-theme`
- build_prompt() {} 구문 찾아 `prompt_newline`을 `prompt_hg`와 `prompt_end` 사이에 추가
- 코드 제일 아래에 내려가서 `prompt_newline()` 기능을 정의하는 코드 입력

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

<b>이모티콘 적용</b>
- `vi ~/.zshrc`
- terminal 실행 시 랜덤 이모티콘 적용하는 코드 작성
- `${emojis[$RAND_EMOJI_N]}` 부분을 원하는 이모티콘으로 채우면 그 이모티콘만 나옴

```console
prompt_context() { 
  # Custom (Random emoji) 
  emojis=("🌙" "📌" "🦄" "👑" "🌈")
  RAND_EMOJI_N=$(( $RANDOM % ${#emojis[@]} + 1)) 
  prompt_segment black default "{하고싶은이름} ${emojis[$RAND_EMOJI_N]} " 
}
```

<b>Syntax Highlight 적용</b>
- `brew install zsh-syntax-highlighting`
- `vi ~/.zshrc`
  - 입력 : `source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh`

---

### iTerm2

- A replacement for Terminal and the successor to iTerm
- Mac 기본 Terminal보다 더 유용한 기능 많이 제공


<b>iTerm2 설치</b>
- [iTerm2 다운로드](https://iterm2.com/)
- 폰트 깨질 때
  - 상단 iTerm2 메뉴바 - Preferences - Profiles - Text - Font
  - monaco → 'Source Code Pro for Powerline'으로 변경

<b>iTerm color theme</b>
- https://iterm2colorschemes.com/
- 원하는 theme 선택 (e.g. 'Framer')
- 아래 코드 입력 : curl -LO + 해당 color theme URL
- 상단 iTerm2 메뉴바 - Preferences - Profiles - colors (단축키 cmd ,)
  - 우측 하단 color presets 선택
  - import - 방금 다운 받은 Framer 테마 설정

```console
brew install curl
mkdir util && cd util   # util directory 생성 + 이동
curl -LO                # Framer color theme를 download
ls                      # 결과 : Framer.itermcolors
```

---

### Error

`zsh: command not found: brew`
- zshrc 파일에 코드 추가 : `port PATH=/opt/homebrew/bin:$PATH`
- iTerm 껐다 켜기

