#!/bin/bash

docker run -d -p 8080:8080 -p 80:80 \
    -v $PWD/traefik.yml:/traefik.yml \
    -v /var/run/docker.sock:/var/run/docker.sock \
    traefik:v2.0

# run test service
docker run -d --name test containous/whoami