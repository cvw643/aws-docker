.gitlab-ci.yml
```yaml
push-to-ecr:
  stage: push-to-ecr
  image:
    name: cvw643/aws-docker
    entrypoint: [ "" ]
  services:
    - docker:19.03.7-dind
  script:
    - aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $DOCKER_REGISTRY
    - docker info
  dependencies:
    - publish-to-rdc
  only:
    - master
```