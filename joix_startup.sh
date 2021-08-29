#!/bin/sh

# Tonton Jo - 2021

# Settings
username=joix

## Starting Nextcloud Installation
# Creating environnment and variables

useradd $username
gid=$(id -g $username)
uid=$(id -u $username)

# Creating folders and setting rights
rootconfigfolder=/etc/joix
rootdatafolder=/opt/joix
mkdir $rootdatafolder
mkdir $rootconfigfolder
chown -R $uid:$gid $rootdatafolder
chown -R $uid:$gid $rootconfigfolder

# Starting joix using file
docker compose -f /opt/joix/joix.yml -p joix up -d
