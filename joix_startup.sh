#!/bin/sh

# Tonton Jo - 2021

# Settings
username=joix
rootconfigfolder=/etc/joix
rootdatafolder=/opt/joix

## Starting Nextcloud Installation
# Creating environnment and variables

useradd $username
gid=$(id -g $username)
uid=$(id -u $username)

# Creating folders and setting rights
mkdir $rootdatafolder
mkdir $rootconfigfolder

# Getting joix.yml
wget -O $rootconfigfolder/joix.yml https://raw.githubusercontent.com/Tontonjo/joix/main/joix.yml

# Creating .env file with default configuration:
echo "PGID=$gid
PUID=$uid
ROOTCONFIGFOLDER=$rootconfigfolder
ROOTDATAFOLDER=$rootdatafolder" > $rootconfigfolder/joix.env

# Settings rights:
chown -R $uid:$gid $rootdatafolder
chown -R $uid:$gid $rootconfigfolder

# Starting joix using file
docker-compose -f $rootconfigfolder/joix.yml --env-file $rootconfigfolder/joix.env -p joix up -d

# Deleting this script
rm -f $0
