# Joix
## Simpliest media server ever - Press enter configuration  
![screenshot](https://i.ibb.co/9HjkKJ6/Screenshot-2021-09-01-160921.png)  

## Tonton Jo - 2021  
### Join the community:
[![Youtube channel](https://github-readme-youtube-stats.herokuapp.com/subscribers/index.php?id=UCnED3K6K5FDUp-x_8rwpsZw&key=AIzaSyA3ivqywNPQz0xFZBHfPDKzh1jFH5qGD_g)](http://youtube.com/channel/UCnED3K6K5FDUp-x_8rwpsZw?sub_confirmation=1)
[![Discord Tonton Jo](https://badgen.net/discord/members/2NQskxZjfp?label=Discord%20Tonton%20Jo,%20&icon=discord)](https://discord.gg/2NQskxZjfp)
### Support the channel with one of the following link:
[![Buymeacoffee](https://badgen.net/badge/Buy%20me%20a%20Coffee/Link?icon=buymeacoffee)](https://www.buymeacoffee.com/tontonjo)
[![Infomaniak](https://badgen.net/badge/Infomaniak/Affiliated%20link?icon=K)](https://www.infomaniak.com/goto/fr/home?utm_term=6151f412daf35)
[![Express VPN](https://badgen.net/badge/Express%20VPN/Affiliated%20link?icon=K)](https://www.xvinlink.com/?a_fid=TontonJo)  

You can watch a demonstration [here](https://www.youtube.com/watch?v=XqYi9IQea68)  

## News:  
### 13.10.2021
Following some changes made by linuxserver.io on their registries and to ensure update of your containers, if you installed Joix before 13.10.2021, you should do one of the following:
- Get the new version of joix.yml fro github and update yours in /etc/joix/joix.yml
- Edit your /etc/joix/joix.yml and replace ghcr.io with lscr.io (all but flaresolverr)
- - For debian:
```shell
nano /etc/joix/joix.yml
```  
or on raspberry pi:
```shell
docker-compose -f /etc/joix/joix.yml -p joix up -d
```  
- - For Raspi OS:
```shell
sudo nano /etc/joix/joix.yml
```  
or on raspberry pi:
```shell
sudo docker-compose -f /etc/joix/joix.yml -p joix up -d
```  

## Disclaimer  
Simplicity implies limitations:  
This has not been extensively tested and is provided as-is.  
There's no way to customize storages, targets or anything and no consideration about anything else than what's provided:  
no security, checks, validation or anything else.  
There's certainly a lot of things that can be improved - if you think so, please make a PR.  
## WARNING - ATTENTION:  
The iso is configured with simplicity in mind and is a "press enter" installation - No jokes.  
### This means it will nuke the first hard drive the installer find to install Joix, be carfull on the hardware you use.  
### L'installer de Joix va complétement effacer le premier disque trouvé, faites donc attention a votre matériel.  


## What's in the box?
This Will start the following apps in docker containers with preconfigured storages and default ports ran with "joix" user:  
- Jellyfin       http://joix:8096  /media  
- Navidrome      http://joix:4533  /music  
- Sonarr         http://joix:8989  /tv /downloads  
- Radarr         http://joix:7878  /movies /downloads  
- Lidarr         http://joix:8686  /music /downloads  
- Deluge         http://joix:8112  /downloads  
- Jackett        http://joix:9117
- Flaresolverr   http://joix:8191  
- Watchtower     -> auto-update all apps at 04:00  

An SMB share to access your data at \\joix\joixdata  

The application will use the following content folders:
- /etc/joix/
- /opt/joix/downloads
- /opt/joix/media/
- - /opt/joix/media/tvshows
- - /opt/joix/media/movies
- - /opt/joix/media/music

## Prerequisits that you probably match:
This is intended to be executed by joix.iso installer - the script is not tested with anything else.
- A working internet connexion with DNS and DHCP
- A small tower / NUC or VM  with x86/64 processor only or a raspberry pi (pi 3 tested)
- - LAN networking (debian supported hardware)
- - A single drive or SD card of the biggest size you can afford to loose for storage. Rapid storage is always a +
- - - not tested on NVME drives or special hardware: only sata and vitual hard drive  
## Installation:  
### Computer or VM:
The installation and startup will not allow you to change anything, but once it has booted, it's debian and docker so you can do whatever you want.

- Read the WARNING please :-) -  or cry when you lose everything
- Write ISO on USB key with [RUFUS](https://rufus.ie/) or load it on a VM
- Boot on ISO and press enter to install Joix
- Wait for the magic to happen after 2 reboots
- Configure all the apps you want / need

### Raspberry Pi  
- Write an raspi OS lite image on your SD Card
- Create a file named "ssh" in boot partition
- Boot your raspberry and find his IP adress
- SSH in your Pi with default logi: pi - raspberry
- Execute thoses commands to start Joix Installation  
```shell
sudo wget -q https://raw.githubusercontent.com/Tontonjo/joix/main/pipostinstall.sh
```  
```shell
sudo bash pipostinstall.sh
```  
- If you want to try jellyfin:  
```shell
sudo docker start jellyfin
```  
## After the installation you should:
- Configure the applications to use the path specified at "What's in the box"
- Set a static IP adress
- Change the default passwords
- Ensure your data are safe with backups

## Default password:
- You can ssh on your server with: root:joix  
To change this password:  passwd root  
- You can access smb share with:  joix:joix  
To change this password: smbpasswd -a joix

## Add other containers
If you want to add containers, i'd suggest you to edit /etc/joix/joix.yml and to run  
```shell
docker-compose -f /etc/joix/joix.yml -p joix up -d
```  

## What could be added or enhanced?  
- A lot of things  
- backup / restore configuration
- update tool
- Maybe i'd like to port this to raspberry    
