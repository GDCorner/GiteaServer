# Gitea Server

Docker and Docker-Compose files for hosting a Gitea Server

These scripts are shared purely for information, and do not necessarily reflect best practices. No guarantees provided.

## Setup

1. On your synology, or other docker host, create a user and group called gitea. Grab the UID from the /etc/passwd file, and the GID from the /etc/group file on your host.
2. Create a share called docker
3. Create a folder within that share called gitea
4. Create subfolders for the scripts, and a subfolder for data

```bash
#Update these locations to match your setup.
#Data directory
mkdir /volume1/docker/gitea/dataFolder/data
#Scripts directory
mkdir /volume1/docker/gitea/gitea-dockercompose
```

4. Change ownership of this new gitea directory to the gitea user and group

```bash
chgrp -R gitea /volume1/docker/gitea
chown -R gitea /volume1/docker/gitea
```

5. Update the GID and UID in the docker-compose.yml file.
6. If required update the ports in the docker-compose.yml file
7. Update the timezone in the timezone file.
8. Update the location of your scripts directory in stop-update-start.sh
8. Running stop-update-start.sh should create a new gitea instance. The first time you run it, it may complain about the container not existing.
9. During the first run wizard, make sure to specify the correct URL with the ports specified in the docker-compose.yml, by default these are
* 3000 for http
* 222 for ssh.

## Updating

Simply run stop-update-start.sh. This will update to the latest gitea version by default. If you wish, you can change the tag to update to in the docker-compose.yml file.

I schedule this to run once a week.

## Backups

Note, I have tested these backups for myself, however provide no guarantees they work. Please run and verify your own backups.

Running a new backup will delete any backups already existing in /volume1/docker/gitea/dataFolder/data/backup. This is not meant to be the final backup location.

1. Run, and preferably schedule backup.sh to run. This should run on the host and will execute a command within the container.
2. Verify your backup now exists in /volume1/docker/gitea/dataFolder/data/backup
3. Move/copy this backup to your desired safekeeping space.
