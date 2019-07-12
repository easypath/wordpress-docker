#!/bin/bash

# Generate random passwords
export MYSQL_PASSWORD="$(date +%s | sha256sum | base64 | head -c 32 ; echo)"
export WORDPRESS_DB_PASSWORD=${MYSQL_PASSWORD}

# Deploy Docker stack
docker stack rm wordpress
docker swarm leave --force
docker swarm init
docker stack deploy -c stack.yml wordpress
