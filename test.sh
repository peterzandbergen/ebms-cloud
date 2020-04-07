#!/bin/bash

# Create network
docker network create web

# Create volumes for traefik and ebms-admin secrets

# Traefik volume
# Copy traefik config

# Copy empty acme file

# EbMS volume
# Copy ebms-keystores

# Start traefik
docker run -d -p 8080:8080 -p 80:80 \
    -v $PWD/traefik.yml:/etc/traefik/traefik.yml \
    -v /var/run/docker.sock:/var/run/docker.sock \
    traefik:v2.0

# Start ebms-admin
