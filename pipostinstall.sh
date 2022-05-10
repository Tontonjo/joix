#!/bin/sh

# Tonton Jo - 2021
# Version 1.0

# This script has to be ran on a brand new raspbian-lite installation
# sudo bash pipostinstallation.sh

# Default PI login:
# user: pi - Password: raspberry

# Settings
# Username used to create debian user and samba user
username=joix
# password used to create debian user and samba user
userpassword=joix
# Storage paths:
rootconfigfolder=/etc/joix
rootdatafolder=/opt/joix
homefolder=/home/pi

echo "- Starting installation -  this may take a while"
echo "- Process speed depends on your pi, internet speed and sd card speed"
sleep 5

# check if root
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as sudo" ; exit 1 ; fi

# Update and install dependencies
apt update -y
# apt upgrade -y
apt install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

# Installing Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Setting this disable samba prompt about netbios configuration
echo "samba-common samba-common/dhcp boolean false" | debconf-set-selections
echo "samba-common samba-common/do_debconf boolean true" | debconf-set-selections

# Installing docker and samba for netbios resolution
apt update -y
apt install -y docker-ce-cli containerd.io docker-compose samba

# Starting Joix Installation
useradd $username
usermod -aG docker joix
usermod -aG docker pi
gid=$(id -g $username)
uid=$(id -u $username)

# Set password for SMB user 
(echo $userpassword; echo $userpassword) | smbpasswd -a $username

# Creating folders and setting rights
mkdir $rootdatafolder
mkdir $rootconfigfolder


# Setting shortcut in 
ln -s $rootconfigfolder $homefolder/config
ln -s $rootdatafolder $homefolder/data

# Getting joix.yml for deployment
wget -O $rootconfigfolder/joix.yml https://raw.githubusercontent.com/Tontonjo/joix/main/joix.yml

# Setting up login screen
wget -O /usr/local/bin/issue.sh https://raw.githubusercontent.com/Tontonjo/joix/main/issue.sh
chmod 755 /usr/local/bin/issue.sh

chmod 777 /etc/rc.local
echo '#!/bin/sh -e' > /etc/rc.local
echo "/usr/local/bin/issue.sh" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
chmod 755 /etc/rc.local

# Correction of UID ang GID in $rootconfigfolder/joix.yml
sed -i 's/1000/'"$uid"'/g' $rootconfigfolder/joix.yml

# Checking that docker is running
if service --status-all | grep -Fq 'docker'; then    
	echo "Docker Installed: check if running:"
		if service --status-all | grep -Fq '[ - ]  docker'; then    
			echo "- Docker not running: starting"
			sudo systemctl docker start
		elif service --status-all | grep -Fq '[ + ]  docker'; then
			echo " - Docker running correctly"
		fi
fi

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
  
# Settings rights:
chown -R $uid:$gid $rootdatafolder
chown -R $uid:$gid $rootconfigfolder
chmod -R 775 $rootconfigfolder
chmod -R 775 $rootdatafolder

# Setting hostname
sed -i 's/raspberrypi/joix/g' /etc/hostname
sed -i 's/raspberrypi/joix/g' /etc/hosts

# Stopping Jellyfin because i find the pi way too slow
echo "- Stopping jellyfin because PI is kind of underpowered for it"
echo "- Feel free to try it by yourself if you want with the following command: "
echo "- sudo docker start jellyfin"

docker stop jellyfin
docker stop flaresolverr

echo "- Waiting 5 minutes for containers to start before rebooting"

secs=$((5 * 60))
while [ $secs -gt 0 ]; do
   echo -ne "Seconds before reboot: $secs\033[0K\r"
   sleep 1
   : $((secs--))
done
# Reboot to enable new login screen

echo "- Rebooting host"
reboot now
