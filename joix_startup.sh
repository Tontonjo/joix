#!/bin/sh

# Tonton Jo - 2021
# Version 1.0

# Settings
# Username used to create debian user and samba user
username=joix
# password used to create debian user and samba user
userpassword=joix
# Storage paths:
rootconfigfolder=/etc/joix
rootdatafolder=/opt/joix

## Starting Joix Installation
# Creating environnment and variables

useradd $username
gid=$(id -g $username)
uid=$(id -u $username)


# Creating folders and setting rights
mkdir $rootdatafolder
mkdir $rootconfigfolder

# Sleeping to leave some time for network to be up
echo "- Sleeping 15 seconds"
sleep 15

# Setting shortcut

ln -s $rootconfigfolder /root/config
ln -s $rootdatafolder /root/data

# Getting joix.yml for deployment
wget -O $rootconfigfolder/joix.yml https://raw.githubusercontent.com/Tontonjo/joix/main/joix.yml

# Setting up login screen
wget -O /usr/local/bin/issue.sh https://raw.githubusercontent.com/Tontonjo/joix/main/issue.sh
chmod 755 /usr/local/bin/issue.sh
echo "#!/bin/sh -e \n/usr/local/bin/issue.sh \nexit 0" > /etc/rc.local
chmod 755 /etc/rc.local

# Starting Joix using file
docker-compose -f $rootconfigfolder/joix.yml -p joix up -d

# Create SMB Share:
echo "[global]
  workgroup = WORKGROUP
# Joix Data
[joixdata]
  comment = Joix Data
  path = $rootdatafolder
  read only = no
  guest ok = no
  valid users = $username" > /etc/samba/smb.conf

# Set password for SMB user 
(echo $userpassword; echo $userpassword) | smbpasswd -a $username

# Settings rights:
chown -R $uid:$gid $rootdatafolder
chown -R $uid:$gid $rootconfigfolder
chmod -R 775 $rootconfigfolder
chmod -R 775 $rootdatafolder

rm -f $0

# Reboot to enable new login screen
echo "- Rebooting host"
reboot now
