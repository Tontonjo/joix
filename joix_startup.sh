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
chown -R $uid:$gid $rootdatafolder
chown -R $uid:$gid $rootconfigfolder

# Getting joix.yml
wget -O /etc/joix/joix.yml https://raw.githubusercontent.com/Tontonjo/joix/main/joix.yml

# Starting joix using file
docker compose -f /opt/joix/joix.yml -p joix up -d

# Deleting this script
rm -f $0
