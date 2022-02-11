#!/bin/bash

#navigate to backups folder and delete old backups
# Navigate to docker-compose.yml directory
cd /volume1/docker/gitea/dataFolder/data/backup
rm *.zip

#run new backup
docker exec -u git -w /data/backup $(docker ps -qf "name=gitea") bash -c '/app/gitea/gitea dump -c /data/gitea/conf/app.ini'
