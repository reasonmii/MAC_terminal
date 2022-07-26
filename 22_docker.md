
### Docker
- Linux Container 구현/관리 도구 (가장 유명)
- Linux kernel들의 기능들을 조합해서 경량 가상화를 구현
  - Cgroup, Namespaces, root 격리, union mount 등
  - 하드웨어까지 가상화하는 가상 머신보다 훨씬 가볍게 애플리케이션 실행 환경을 격리
- 서비스 배포, 테스트 환경 구축, 개발 환경 구성 등 다양한 용도로 활용
- 개발자 필수 기술

<b>Docker Hub</b>
- 이미지 원격 저장 : Push
- 다양한 Official Images 제공 - 다운 : Pull
  - 공식 이미지
    - 다른 이미지를 만들 때 베이스로 활용
    - Nginx, Redis, MySQL 등 응용 애플리케이션을 안전하게 바로 사용할 수 있도록 도와줌



---

참고
- https://www.lainyzine.com/ko/article/summary-of-how-to-use-docker/
- https://www.lainyzine.com/ko/article/how-to-remove-all-docker-contaniers-and-images/
