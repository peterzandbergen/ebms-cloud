#!/bin/bash

# Create network
docker network create web

# Create traefik with compose
docker-compose up --no-start

# Copy the config file
docker cp traefik.toml \
    traefik-ebms:/etc/traefik/traefik.toml

# Copy the acme.json file    
docker cp acme.json \
    traefik-ebms:/etc/traefik/acme.json

# Windows sucks
# Set 600 on acme.json in container
docker run --rm --volume traefik-ebms_etc-traefik:/work \
    alpine chmod 600 /work/acme.json

# Start traefik
docker-compose start
