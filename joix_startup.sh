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

# Sleeping to leave some time for network to be up
echo "- Sleeping 10 seconds"
sleep 10

# Setting shortcut

ln -s $rootconfigfolder /root/joix_config
ln -s $rootdatafolder /root/joix_data
# Getting joix.yml
wget -O $rootconfigfolder/joix.yml https://raw.githubusercontent.com/Tontonjo/joix/main/joix.yml

# Setting up login screen
wget -O $rootconfigfolder/issue.sh https://raw.githubusercontent.com/Tontonjo/joix/main/issue.sh
chmod 755 $rootconfigfolder/issue.sh
echo "#!/bin/sh -e \n$rootconfigfolder/issue.sh \nexit 0" > /etc/rc.local
chmod 755 /etc/rc.local

# Starting joix using file
docker-compose -f $rootconfigfolder/joix.yml -p joix up -d

rm -f $0

# Reboot to enable new login screen
Echo "- Rebooting host"
reboot now
