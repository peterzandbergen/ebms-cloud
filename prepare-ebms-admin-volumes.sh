#!/bin/bash

# Create network
docker network create web

# Create volumes for traefik.
docker run --name traefik-opt --volume traefik-opt:/root alpine
# Copy traefik config
docker cp  traefik.toml traefik-opt:/root/
docker cp  traefik.yml traefik-opt:/root/
# Copy empty acme file
docker cp  acme.json traefik-opt:/root/
# Clean up container
docker rm traefik-opt

# Create volumes for EbMS admin
docker run --name ebms-secrets --volume ebms-secrets:/root alpine
# Copy the keystores.
docker cp ebms-secrets/truststore.p12 ebms-secrets:/root/
# Repeat for each keystore.
# 
# Clean up container.
docker rm ebms-secrets

exit 

# Start traefik
docker run -d -p 8080:8080 -p 80:80 \
    -v $PWD/traefik.yml:/etc/traefik/traefik.yml \
    -v /var/run/docker.sock:/var/run/docker.sock \
    traefik:v2.0

# Start ebms-admin
