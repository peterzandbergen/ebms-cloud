# ebms-cloud

Sequence of steps:

1. Start docker host in cloud
1. Modify dns record with ephemeral ip address
1. Create a docker network
1. Create traefik with compose
1. Copy config files to traefik container using docker cp
1. Create ebms-admin with compose
1. Copy secrets to conainer using docker cp
1. Start treafik RP with compose start
1. Start ebms-admin with compose start

### Commando's

https://hub.docker.com/_/traefik

## Docker Network

We need an external network so the containers can communicate with each other.

```
docker network create web
```

## Compose files

The compose files create the services. Because we need to provide the services with configuration information in a docker controlled volume, we need to first create the compose service, copy the files to the container and then start the container.



So for traefik we ececute the following commands:

Execute in the correct directory
```
docker-compose create
docker cp traefik.toml \
    traefik-ebms:/etc/traefik/traefik.toml
docker-compose start
```

Same goes for the ebms adapter

Execute in the correct directory

```
docker-compose create
docker cp <ebms-file> \
    ebms-admin-embedded:/app/secrets/<ebms-file>
docker-compose start
```

## TODO

|Item Number | Description | Status |
|------------|-------------|--------|
| 001 | toml: Make Traefik dashboard protected via https| In Progress |
| 002 | test lets encrypt on traefik | Ready |
| 003 | Create dns to ebms.myhops.com | Ready | 
