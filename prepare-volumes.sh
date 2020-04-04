#!/bin/bash

# Create volumes for Traefik.
docker run --name traefik-opt --volume traefik-opt:/root alpine
docker cp  traefik.toml --volume traefik-opt traefik-opt:/root/