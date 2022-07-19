
### symbolic link
- 특정 file, directory에 대한 참조를 포함하는 특별한 파일
- Windows 운영체제 ‘바로 가기’ 와 같은 기능


<b>사용법</b>
- `ln -s [original file path] [symbolic file path]`
  - `ln` : link라는 system 호출(call) 사용
  - `-s` : symlink 시스템 호출이 대신 사용되면서 심볼릭 링크가 생성
- original file path (대상 경로) : symbolic link가 가리키는 상대/절대 경로 (존재하지 않는 대상 지정도 가능)
- 예시
  - 테스트할 `test.txt` 파일 생성 : `echo "hi" > test.txt`
  - 테스트 파일에 대한 `link_a` 심볼릭 링크 생성
    - `ln -s test.txt link_a`
    - `ls -l`
    - 결과
      - lrwxrwxrwx  1 kimtaeng other    8 2020-09-02 18:39 link_a -> test.txt
      - -rw-r--r--  1 kimtaeng other    3 2020-09-02 18:38 test.txt




