default: docker_build

docker_build:
  @docker build \
    --build-arg VCS_REF=`git rev-parse --short HEAD`