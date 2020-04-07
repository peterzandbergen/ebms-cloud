#!/bin/bash

# Create network
docker network create web

# Create traefik with compose
docker-compose up --no-start .

# Copy the config file
docker cp traefik.toml \
    traefik-ebms:/etc/traefik/traefik.toml

# Copy the acme.json file    
docker cp acme.json \
    traefik-ebms:/etc/traefik/acme.json

