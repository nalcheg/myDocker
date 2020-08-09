#!/usr/bin/env bash

docker rm -f dind-ssh

docker build --build-arg AUTHORIZED_KEYS="${AUTHORIZED_KEYS}" -t nalcheg/dind-ssh .
docker push nalcheg/dind-ssh

docker run -dti --name dind-ssh --privileged -p 44422:22 nalcheg/dind-ssh
docker exec -ti dind-ssh /usr/sbin/sshd -e
