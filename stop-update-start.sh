#!/bin/bash
# Edit `docker-compose.yml` to update the version, if you have one specified

# Navigate to docker-compose.yml directory
cd /volume1/docker/gitea/gitea-dockercompose

# Stop existing server
docker-compose down
# Pull new images
docker-compose pull
# Start a new container, automatically removes old one
docker-compose up -d
