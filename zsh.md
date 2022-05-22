맥에서 터미널 실행시키면 원래 bash라는 shell 실행
텍스트로 되어 있고 까만 화면에 하얀색 -> 너무 무서움
그래서 많은 사용자가 shell 환경설정을 변경하여 색상, 폰트 설정
github에서 이러한 dotfiles만 모아서 추천해줌
그러나 이건 초보자가 보기엔 어려움

Oh-My-Zsh은 bash보다 최근에 나온 shell인 zsh의 환경설정을 다루는 프레임워크
커뮤니티 활동이 매우 활발하여 120여 개의 테마와 120여 개의 플러그인이 준비되어 있음
먼저 zsh이 설치되어 있어야 함
curl이나 wget, git이 설치되어 있어야 함

Zsh란?
Z shell(Zsh)은 Bash와 같이 유닉스 쉘의 일종으로 1990년 처음 개발되었습니다.1 주요 특징으로는 다음과 같습니다.2
1 실행 중인 모든 Shell은 명령어의 history를 쉘 끼리 공유합니다.
2 간단한 설정을 통해 문법 오류를 정정해줍니다. (e.g. gut → git)
3 다양한 테마를 지원합니다.

1) zsh 설치
Homebrew 설치 후
brew install zsh

2) zsh 설치되어 있는지 확인
zsh --version

3) bash로 되어 있는 기본 쉘을 zsh로 변경
which zsh   # 쉘의 위치 확인 : /bin/zsh
chsh -s /bin/zsh   # 기본 쉘 변경
chsh -s 'which zsh' # 쉘의 위치 확인 + 기본 쉘 변경

4) 터미널 종료 후 재시작 -> 기본 쉘이 zsh인 것 확인
echo $SHELL    # /bin/zsh

5) Oh-My-Zsh 설치
ZSH에서 가장 널리 사용되는 플러그인 프레임 워크
많은 내장 플러그인과 테마 제공
ZSH은 전체 패키지 관리자인 Antigen을 포함한 다른 플러그인 프레임 워크도 가지고 있지만 Oh-My-Zsh에는 많은 플러그인이 내장되어 있으며 제대로 작동함
화려한 테마와 편리한 기능을 가짐
터미널 환경을 획기적으로 변경
iTerm이던 터미널 앱이든 리눅스든 상관없이 같은 환경으로 작업 가능

wget 으로 설치
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh




