#!/bin/bash

sudo docker pull ubuntu
sudo docker run -i -t --name bionic-dev ubuntu:18.04 /bin/bash

docker ps
docker ps -a

docker rm <container_id> [container_id]

docker start <container_id> [container_id]
docker stop <container_id> [container_id]
docker stop $(docker ps -a -q)

docker attach <container_id>

docker rmi <image_id>

docker rmi -f <image_id> # 컨테이너와 동시 삭제

