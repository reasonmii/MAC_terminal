### git
- Mac은 Apple 전용의 git 가지고 있음 (but, 옛날 버전) -> 새로 설치 필요
- git 설치하기 : `brew install git`
- 설치된 git 정보 확인 : `brew info git`
  - Dependencies 부분에서 pcre에 X 표시가 되어 있으면 추가 설치 필요 : `brew install pcre`
- Check version : `git --version`

<b>github 계정 초기 setting</b>
- `git config --global user.name "githubUserName"`
- `git config --global user.email "githubEmail"`
- `which git` : git 저장 경로 확인

<b>github repository 연동하기</b>
- github에서 특정 repository 주소 복사 `~.git`
- 터미널 : `git clone ~.git`

<b>원격 repo 변경사항 반영하기</b>
- `git pull origin master`

<b>local repository 만들기</b>
- `cd gitTest/`
- gitTest 내에서 명령어 입력
  - `git init`
  - 파일 확인 : `ls`

<b>local 작업 후 github 업로드</b>
- add + commit
  - 방법1 : `git add .` → `git commit -m "message"`
  - 방법2 : `git commit -am "message"`
- `git push origin master` : online git master branch upload
  - `git push -f origin main` : ignore error
  - ★ 보통은 master 말고 개인 branch에 업로드

<b>log 확인</b>
- `git log` : git log 확인
- `git checkout [3a5c6c7]` : log 목록 중 index를 통해 특정 부분 상세 확인
- `git checkout HEAD~1` : 이전 commit으로 돌아가기

<b>master branch로 merge 하기</b>
- `git switch [branch name]`
- `git merge master`

<b>local repository와 online repository가 연결되어 있는지 확인</b>
- `git remote -v`
  - 결과값이 없는 경우 : 연결 안 된 것
  - 연결 방법 : `git remote add origin repository주소.git`
  - 연결 재확인 : `git remote -v`
 
