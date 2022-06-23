### CLI

- Command Line Interface : 명령 줄 인터페이스
- 컴퓨터가 수행할 명령을 보통 terminal을 통해 키보드로 직접 command 입력하는 방식의 인터페이스
- 일반적으로 사용자 명령어를 shell을 통해 분석해서 시스템에 전달
- 비슷한 용어 : CUI (Console User Interface)
- 거의 반대되는 용어 : GUI (Graphical User Interface)
  - GUI에 비해 불편하다고 느낄 수 있으나 CLI 특유의 장점 또한 많기 때문에 많이 쓰임

### cURL
- URL을 이용해 인터넷 데이터를 전송하기 위해 가장 많이 사용되는 CLI 도구
  - It is a command-line tool and application library used to transfer data to or from a server
  - It uses URL syntax, such as HTTP and HTTPS
- 주로 사용하는 용도 : 특정 사이트에 request / web에서 파일 download / server가 잘 동작하는 지 test
- [Curl cheatsheet](https://devhints.io/curl)
- [Curl Cookbook](https://catonmat.net/cookbooks/curl)

<b>설치</b>
- Homebrew로 설치 : `brew install curl`
- curl 버전 확인 : `curl --version`

<b>파일 download</b>

```console
curl -O http://yourdomain.com/yourfile.tar.gz                 # yourfile.tar.gz 으로 저장
curl -o newfile.tar.gz http://yourdomain.com/yourfile.tar.gz  # newfile.tar.gz 으로 저장

# 두 개 이상의 파일 다운로드
curl -O http://yoursite.com/info.html -O http://mysite.com/about.html

# 일반적인 text는 redirect file로 다운로드 가능
curl https://foo.bar > foobar.html
# 별도의 `--output` 옵션 사용하는 편이 좋음
curl https://foo.bar/path/to/image.jpg --output downloaded_image.jpg
  
# 파일 다운로드 중 중간에 끊었다가 다시 받는 방법
curl -O http://mirror.kakao.com/ubuntu-releases/18.10/ubuntu-18.10-desktop-amd64.iso       # 연결 끊기 : ctrl + C
curl -C - -O http://mirror.kakao.com/ubuntu-releases/18.10/ubuntu-18.10-desktop-amd64.iso  # 이어받기
```

- 사이트 응답 확인 : `curl https://google.com`
- 요청 응답 상세 보기 : `curl -v https://google.com`
  - `-v` (Verbose) : 상세 로그 표시
    - 요청 header/request, 응답 header/body 등
    - header 확인해야 redirect page는 확인 가능
- 외부 IP주소 알아내기 : `curl ipinfo.io`
- custom header : `curl -H '사이트주소' https://foo.bar`
  - `-H` : header 정의

<b>POST</b>
- POST로 form 데이터를 함께 요청 : `-d` 옵션 사용
  - `curl -d 'key=value' -d 'foo=bar' https://foo.bar`
- JSON 데이터를 POST 하는 경우 header 별도 필요
  - `curl -H 'Content-Type: application/json' -d '{"foo": "bar"}' https://foo.bar`

<b>파일 upload</b>
- `-F` or `--form` 옵션 사용
  - `curl -F 'file=@/foo/bar/path' -F 'key=value' https://foo.bar`
- 요청은 POST로 multipart/form-data 형식으로 날아감
- @ : 파일을 구분하는 요소
  - `key=value`는 일반 form이라 @ 없음

<b>Request method</b>
- GET/POST가 아닌 PUT/DELETE method 사용하고 싶은 경우 : `-X` 옵션 이용
  - `curl -X PUT -d 'foo=bar' https://foo.bar`
- REST API 개발 시 test 용도로 자주 사용

