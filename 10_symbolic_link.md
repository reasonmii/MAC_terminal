
### symbolic link
- 특정 file, directory에 대한 참조를 포함하는 특별한 파일
- Windows 운영체제 ‘바로 가기’ 와 같은 기능

<b>생성</b>
- `ln -s [original file path] [symbolic file path]`
  - `ln` : link라는 system 호출(call) 사용
  - `-s` : symlink 시스템 호출이 대신 사용되면서 심볼릭 링크가 생성
  - original file path (대상 경로) : symbolic link가 가리키는 상대/절대 경로 (존재하지 않는 대상 지정도 가능)
- 방법1 : 파일 연결하기
  - `echo "hi" > test.txt` : test 파일 생성
  - `ln -s test.txt link_a` : symbolic link 파일 'link_a' 생성, test.txt 파일 연결
  - `ls -l` : 결과 확인 - `cd link_a`
- 방법2 : 폴더 연결하기
  - `ln -s test link_test` : symbolic link 파일 'link_test' 생성, test 폴더에 연결
  - `ls -al` : 결과 확인 - `cd link_test`

<b>삭제</b>
- symbolic link 파일은 단순 바로가기 파일이기 때문에, 링크를 삭제해도 Original 파일 삭제X
- 방법
  - `mkdir test` : 테스트할 directory 생성
  - `ln -s test link_sym` : 테스트 directory에 대한 symbolic link 'link_sym' 생성 
  - `rm link_sym` : 삭제
  - `rm link_sym/` : ★ 이름 끝에 /를 붙이게 되는 경우 삭제되지 않음
  - `rm -r link_sym` : directory 내부 파일 삭제

<b>변경</b>
- 링크를 유지한 상태에서 가리키는 원본 대상만 변경
- `ln -Tfs [새로운 대상 경로] [변경할 심볼릭 링크]`
- 옵션
  - `-T` : 링크를 일반 파일로 취급
  - `-f` : 기존 심볼릭 링크가 있는 경우 덮어쓰기
    - 이 옵션이 없으면, 이미 심볼릭 링크가 존재하는 경우 변경이 안됨
- 방법
  - `mkdir test1 && mkdir test2` : 테스트 directory 'test1', 'test2' 생성
  - `ln -s test1 link_a` : test1 directory에 대한 symbolic link 생성
  - `ln -s test2 link_a` : 이미 'test1'이 'link_a'와 연결되어서 변경이 안됨
  - `ln -Tfs test2 link_a` : 원본 타겟 변경

---

### hard link
- hard link는 디스크 상 원본과 같은 파일을 가리킴 
- 원본과 동일한 inode를 가짐
  - symbolic link는 원본 파일과 다른 inode 가짐
- 원본 파일이 삭제되더라도 사용 가능
- `ln [original file path] [symbolic file path]`
- 방법
  - `echo "hi" > test.txt`
  - `ln -s test.txt link_s` : symbolic link 생성
  - `ln text.txt link_h` : hard link 생성
  - `ls -li` : 현재 경로 출력 (inode 정보 포함)
- 원본 파일 삭제하는 경우
  - `rm test.txt`
  - `cat link_s` : symbolic link 결과 'cat: link_s: 그런 파일이나 디렉터리가 없습니다'
  - `cat link_h` : hard link 결과 'hi'

