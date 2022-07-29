<b>개념</b>
- Image : template (setup, logic, codes)
- Container : run based on images

<b>Docker Hub</b>
- image 공유 사이트
- ★ 보통 이곳에서 base image 가져오고 내 code를 add 함
- ex) 'node' 검색 - docker official images
  - Terminal : `docker run node`
    - download latest node image automatically
    - run with container
  - `docker run -it node` : interactive node terminal
  - 종료 : `[ctrl] + C 두 번`

<b>VS code</b>
- 상단 view - extensions - Docker 검색 - install
- 작업 폴더에 'Dockerfile' 생성
- Terminal - New Terminal

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
- `docker run -p 3000:3000 [id]` : 실행
- 인터넷 주소창 `localhost:3000` 입력하면 결과 보임 
- `docker ps` : 실행 중인 docker 확인
  - `docker ps -a` : show all
- `docker stop [name]` : docker 실행 중지
- 

