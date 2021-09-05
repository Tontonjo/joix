#!/bin/sh

# Tonton Jo - 2021
# Version 1.0

# This script is automatically executed by the preseed file

# Permit Root login:
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Installing docker and samba for netbios resolution
apt update -y
apt install -y docker-ce docker-ce-cli containerd.io docker-compose samba

# Download startup script and make it executable
wget -O /root/joix_startup.sh https://raw.githubusercontent.com/Tontonjo/joix/main/joix_startup.sh
chmod +x /root/joix_startup.sh

# Add script to be executed on boot then removed once ran
echo "#!/bin/sh -e \n/root/joix_startup.sh \nrm -f /etc/rc.local \nexit 0" > /etc/rc.local
chmod 755 /etc/rc.local
