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

# Settings rights:
chown -R $uid:$gid $rootdatafolder
chown -R $uid:$gid $rootconfigfolder

printf "%s" "Waiting for connexion"
while ! ping -c 1 -n -w 1 1.1.1.1 &> /dev/null
do
    printf "%c" "."
done
printf "\n%s\n"  "Online!"

# Getting joix.yml
wget -O $rootconfigfolder/joix.yml https://raw.githubusercontent.com/Tontonjo/joix/main/joix.yml

# Starting joix using file
docker-compose -f $rootconfigfolder/joix.yml -p joix up -d

# Deleting this script
rm -f $0
