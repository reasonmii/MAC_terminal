<b>개념</b>
- Image : template (setup, logic, codes)
  - 읽기/쓰기 access 권한이 있는 instance를 실행하는 container의 blueprint
  - 이미지의 모든 명령은 cache 가능한 layer 생성
    - 레이어는 이미지 재구축, 공유 
- Container : run based on images
  - 여러 컨테이너가 서로 간섭하지 않고 동일한 이미지에 기반해서 실행 가능

<b>Docker Hub</b>
- image 공유 사이트
- ★ 보통 이곳에서 base image 가져오고 내 code를 add 함
- ex) 'node' 검색 - docker official images
  - Terminal : `docker run node`
    - download latest node image automatically
    - run with container
  - `docker run -it node` : interactive node terminal

<b>VS code</b>
- 상단 view - extensions - Docker 검색 - install
- 작업 폴더에 'Dockerfile' 생성
- Terminal - New Terminal
  - `[ctrl] + C 두 번` : 실행 중인 작업 
  - `clear` : terminal 창 깨끗하게

<b>code list</b>
- `docker --help`
- 보기
  - `docker ps` : 실행 중인 모든 container
  - `docker ps -a` : all containers from past
  - `docker images` : 모든 images (repo, tag, id, created time, size)
- 실행
  - `docker run [id]`
  - `docker start [name]`
- 중단
  - `docker stop [name]`
- 삭제
  - `docker rm [name1] [name2] ...` : container 삭제
    - `docker ps -a` 하면 너무 많아서 지저분하니까 정리하기 위함
    - running container인 경우 먼저 stop 필요
  - `docker rmi [image id]`
    - `docker images`로 id 확인
    - 이미지 내부 

<b>Dockerfile</b>

```
FROM node

WORKDIR /app

COPY . /app

RUN npm install

EXPOSE 80

CMD [ "node", "server.js" ]
```

- `FROM [image name]` : docker hub 공식 이름
- `WORKDIR [image/container file system]` : 작업 directory 설정
  - 앞으로의 명령들을 모두 해당 폴더에서 실행할 것임을 docker에게 알림
  - 이거 지정 안 하면 아래 `RUN npm install` 실행했을 때, host file system에서 실행되고 해당 경로에서는 실행 안 돼서 에러 발생
- `COPY [host file system] [image/container file system]`: 어떤 폴더/파일을 복사해서 어디에 저장할지
  - 첫 번째 `.` : 현재 'Dockerfile'이 있는 곳과 같은 폴더에 있는 하위 폴더와 파일들
  - 두 번째 `/app` : 파일이 저장되어야 하는 경로 (존재하지 않으면 생성됨)
    - 앞에서 `WORKDIR`을 지정해줬으니 `/app` 대신 `./` 써도 됨 (current working directory)
    - 하지만 절대경로 `/app` 쓰는 것 선호 (명확히 알 수 있기 때문)
- `RUN [install]` : 파일을 run하기 위해 install이 필요한 부분
- `EXPOSE [port]` : docker에게 이 컨테이너가 실행되면 어떤 port를 local system으로 보여줄 지 알려줌
- `CMD ["node", "server.js"]` : node command를 사용해서 server.js 파일을 실행해라
  - `CMD`와 `RUN`의 차이점
    - 이미지를 기반으로 '컨테이너'를 실행하는 경우만 '서버'를 시작하고 싶으니 'CMD' 사용
    - `RUN node server.js`라고 쓰면? 이미지를 실행할 때마다 서버가 실행됨
    - 즉, 컨테이너가 실행된 후 노드 서버를 실행하고자 하는 것

<b>Terminal code</b>
- `docker build .`
  - `build` : create a new custom image
  - `.` : Dockerfile과 같은 경로
  - 결과로 image id 나옴 (`sha256:` 뒷 부분)
    - id가 너무 길면 다른 id들과 중복되지 않는 앞 일부분만 넣어도 인식됨
- `docker run [image id]` : 컨테이너 실행 중
  - 그러나 인터넷 주소창에 `localhost:3000` 입력하면 결과 안 보임
  - New Terminal 열고 `docker ps` 입력해 보기 : 현재 실행 중인 프로세스 표시
    - 방금 실행한 컨테이너 계속 실행 중인 것 볼 수 있음 (STATUS 부분 : UP ~)
  - `docker stop [name]` : 실행 중지 (shutdown)
  - `docker ps` : 결과 없음
  - `docker ps -a` : 실행 끝난 컨테이너들 보여줌
- `docker run -p [local port]:[internal docker container expose port] [image id]` : 실행
  - `-p` : publish
  - `[local port]` : 인터넷 주소창에서 localhost 몇으로 하고 싶은지
  - `[internal docker container expose port]` : Dockerfile EXPOSE 부분에 쓴 PORT 번호
- 인터넷 주소창 `localhost:[local port]` 입력하면 결과 보임 
  - ex) localhost:3000

<b>코드 변경이 있는 경우</b>
- image는 한 번 build 되면 lock 됨 (읽기 전용)
- 'Dockerfile'에서 `COPY`로 기존 코드를 snapshot처럼 가지고 있기 때문
- 코드가 변경되면 docker를 **rebuild** 필요
  - `docker build .`
- 이전에 build 했던 것과 코드 중복이 많은 걸 알고 docker가 이전보다 빨리 build 함
  - 과정에 보면 'Using cache' 라고 써 있음

<b>layer based architecture</b>
- Dockerfile 내 모든 명령은 한 줄 한 줄 Layer라고 불림
- 이미지는 이렇게 Layer들로 구성됨
- layer 한 개가 변경될 때마다 모든 subsequent layer들도 재실행
  - ex) 파일 중 일부가 변경됨 = `COPY` 부분 재실행 필요 -> 그 아래 layer들 전부 재실행
- 문제점 : 'server.js' 파일 일부가 변경되었다고 매번 `RUN npm install`을 재실행할 필요 없음
- 해결방법 : 아래와 같이 코드 변경
  - `COPY . /app` 코드가 제일 아래에 있으니 앞으로는 source code가 변경되어도 불필요하게 다른 부분까지 재실행하지 않음
  - npm install을 하지 않으니 build 시간 훨씬 

```
FROM node

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

EXPOSE 80

CMD [ "node", "server.js" ]
```

<b>attach/detach - run vs start</b>
- `docker run [id]` : create a new container based on an image
  - default : attach mode
    - terminal 코드 입력 불가능
    - The container is running in the **foreground**
    - 인터넷 주소창 들어가서 화면에서 뭔가 입력하면 terminal에도 log message 동시 입력됨
  - detach mode : `docker run -p 8000:80 -d [id]`
    - 자동으로 생성된 container id 출력됨
- `docker start [name]` : 변경사항 없이 다시 실행하고 싶을 때
  - default : detach mode
    - terminal 코드 입력 가능
    - The container is running in the **background**
  - attach mode : `docker start -a [name]`
- `docker attach [name]` : detach 된 걸 다시 attach 하기
  - `docker ps` : name 확인
- `docker logs [name]` : detach/종료 상태에서도 log message 가져오기
  - `docker logs -f [name]`
  - `docker logs --help`

---

### python

<b>python 파일 생성</b>
- **사용자 입력**이 필요한 파일로 생성
```
from random import randint

min_number = int(input('Please enter the min number: '))
max_number = int(input('Please enter the max number: '))

if (max_number < min_number): 
  print('Invalid input - shutting down...')
else:
  rnd_number = randint(min_number, max_number)
  print(rnd_number)
```

<b>Dockfile</b>
```
FROM python

WORKDIR /app

COPY . /app

CMD ["python", "rng.py"]
```

<b>Terminal</b>
- `docker build .`
- `docker run [id]` -> error 발생 : 사용자 입력을 받아야 하는 파일이기 때문
  - `docker run --help`
- 실행방법1 : `docker run -it [id]`    
  - `-i` interactive mode : attach mode가 아닌 경우에도 container에 입력 가능
  - `-t` pseudo TTY 할당 : terminal 생성
  - `-it` : container에 입력하면 terminal에 노출
- 실행방법2 : `docker start -a -i [name]`
  - `-a` : attach mode
  - `-i` : interactive mode
- `docker stop [name]`
  
