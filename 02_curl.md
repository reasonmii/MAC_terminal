[Curl Cookbook](https://catonmat.net/cookbooks/curl)


CLI는 Command Line Interface의 약자로 직역하여 명령 줄 인터페이스
컴퓨터가 수행할 명령을 키보드를 이용해 직접 입력하는 방식의 인터페이스다. 보통 터미널을 통해 직접 커맨드를 입력하는 방식
비슷한 용어로 CUI (Console User Interface)가 있고 거의 상반되는 의미로 GUI (Graphical User Interface)

일반적으로 사용자 명령어를 셸을 통해 분석해서 시스템에 전달
GUI에 비해 불편하다고 느낄 수 있으나 CLI 특유의 장점 또한 많기 때문에 아직도 많이 쓰이고 있는 방식의 사용자 인터페이스다


Curl은 URL을 이용해 데이터를 전송하는 데 사용하는 CLI 도구
curl은 가장 널리 사용하는 인터넷 데이터 전송을 위한 도구
보통은 그냥 사이트에 어떤 리퀘스트를 보내서 내용물을 받거나, 웹에서 파일을 다운로드 받거나, 서버가 잘 동작하는 지 테스트 용도으로 종종 사용하는 유틸리티

Homebrew로 쉽게 설치할 수 있다.
`brew install curl`

curl 버전 확인
`curl --version`

파일 다운로드
$ curl -O http://yourdomain.com/yourfile.tar.gz  # yourfile.tar.gz 으로 저장된다.
$ curl -o newfile.tar.gz http://yourdomain.com/yourfile.tar.gz # newfile.tar.gz 으로 저장된다.

사이트 응답 확인하기
`curl https://google.com`

요청 응답 상세 보기
`-v` (Verbose) 옵션을 줄 경우 상세한 로그도 함께 표시된다.
`curl -v https://google.com`
내용 중에는 요청하는 헤더와 리퀘스트, 그리고 응답으로 오는 헤더와 내용(body)을 전부 확인할 수 있다. 리다이렉트되는 페이지를 확인하려면 헤더까지 확인하지 않으면 제대로 알 수 없는 데 이럴 때 쓸 만하다.


커스텀 헤더
`-H` 옵션을 이용해 헤더를 정의할 수 있다.
`curl -H 'Foo: Bar' https://foo.bar`
당연하겠지만 foo.bar 라는 사이트가 실존하지는 않는다. 그냥 저기에 사이트 주소가 들어가야 한다.

일반적인 POST
POST로 폼(form) 데이터를 함께 요청하려면 -d 옵션을 쓸 수 있다.
`curl -d 'key=value' -d 'foo=bar' https://foo.bar`
JSON 데이터를 POST 하려면 헤더가 별도로 필요하다.
`curl -H 'Content-Type: application/json' -d '{"foo": "bar"}' https://foo.bar`

파일 업로드
파일을 업로드 하려면 -F 혹은 --form 옵션을 사용할 수 있다.
`curl -F 'file=@/foo/bar/path' -F 'key=value' https://foo.bar`
요청은 POST로 multipart/form-data 형식으로 날아간다.
위의 예에서 파일 경로 앞에 골뱅이 @ 가 붙어있는데 오타가 아니라 파일을 구분하는 요소다 위의 key=value 라는 폼 데이터에는 골뱅이가 안 붙어 있는데 일반 폼 데이터라 그렇다.

요청 메소드(Request Method)
GET 이나 POST 는 자주 쓰이는 만큼 위에서 다뤘는데 만약 만약 PUT 이나 DELETE 같은 메소드를 쓰고 싶다면 어떻게 해야 할까?
이럴 때는 별도로 -X 옵션을 이용해야 한다.
`curl -X PUT -d 'foo=bar' https://foo.bar`
REST API를 개발할 때 테스트 용도로 자주 쓸 만하다.

파일 다운로드
일반적인 테스트 내용물의 경우 그냥 라다이펙트 시켜서 파일로 받을 수 있다.
`curl https://foo.bar > foobar.html`
하지만 이보다는 별도의 --output 옵션을 사용하는 편이 좋다.
`curl https://foo.bar/path/to/image.jpg --output downloaded_image.jpg`

# 중간에 Ctrl+C로 연결을 끊었다. 
$ curl -O http://mirror.kakao.com/ubuntu-releases/18.10/ubuntu-18.10-desktop-amd64.iso 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  1 1906M    1 26.2M    0     0  22.1M      0  0:01:26  0:00:01  0:01:25 22.1M^C

# 이어 받기 하는 걸 확인 할 수 있다.
$ curl -C - -O http://mirror.kakao.com/ubuntu-releases/18.10/ubuntu-18.10-desktop-amd64.iso
** Resuming transfer from byte position 46292992
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  4 1862M    4 81.2M    0     0  30.4M      0  0:01:01  0:00:02  0:00:59 30.4M
  
두 개 이상의 파일 다운로드
$ curl -O http://yoursite.com/info.html -O http://mysite.com/about.html 

파일에 있는 URL로 부터 다운로드 하기


외부 IP주소 알아내기
`curl ipinfo.io`
