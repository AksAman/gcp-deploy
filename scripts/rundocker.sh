#!/bin/sh

TAG=fastapi-example
docker rm $(docker ps -a --filter ancestor=$TAG -q)
# docker build -t gogcp --no-cache Dockerfile
docker build -t $TAG --no-cache -f ./Dockerfile .
docker run -p 8080:8080 $TAG

