#!/bin/sh

docker rm $(docker ps -a --filter ancestor=gogcp -q)
# docker build -t gogcp --no-cache Dockerfile
docker build -t gogcp --no-cache -f ./Dockerfile .
docker run -p 8080:8080 gogcp