# Joix - simpliest media server ever
![screenshot](https://i.ibb.co/9HjkKJ6/Screenshot-2021-09-01-160921.png)  

## Tonton Jo - 2021  
Join me on Youtube: https://www.youtube.com/c/tontonjo  
If you find this usefull, please think about
<a href="https://www.buymeacoffee.com/tontonjo"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png"></a>
and to [Subscribe to my youtube channel](http://youtube.com/channel/UCnED3K6K5FDUp-x_8rwpsZw?sub_confirmation=1)

## Disclaimer  
This is provided as-is whith simplicity for beginner or testers in mind.  
This implies there's no way to customize storages, targets or anything and that no consideration about anything else than what's provided: no security, checks, validation or anything else implied.  
There's certainly a lot of things that can be improved - if you think so, please make a PR or dont complain.  
## WARNING:
The iso is configured with simplicity in mind and is a "press enter" installation - No jokes.  
This means it will nuke the first hard drive the installer find to install Joix.
So: be carfull on the hardware you use  

## What's in the box?
This Will start the following apps in docker containers with preconfigured storages and default ports ran with "joix" user
- Jellyfin       http://joix:8096  
- Sonarr         http://joix:8989  
- Radarr         http://joix:7878  
- Lidarr         http://joix:8686  
- Deluge         http://joix:8112  
- Flaresolverr   http://joix:8191  
- Watchtower     -> auto-update all apps at 04:00  
- An SMB share to access your data at \\joix\joixdata
- The following content folders:
- - /etc/joix/
- - /opt/joix/downloads
- - /opt/joix/media/
- - - /opt/joix/media/tvshows
- - - /opt/joix/media/movies
- - - /opt/joix/media/music

## Prerequisits that you probably match:
This is intended to be executed by joix.iso installer - the script is not tested with anything else.
- A working internet connexion with DNS and DHCP
- A small tower / NUC or VM you want to use with LAN networking (debian supported hardware) and a single drive of the biggest size you can afford to loose for storage

## Usage:

- Find a machine with sufficient hardware and storage
- Read the WARNING please :-) -  or cry when you lose everything
- Write ISO on USB key or load it on a VM
- Boot on ISO and press enter to install Joix
- Wait for the magic to happen after 2 reboots
- Configure all the apps you want / need

The installation and startup will not: 
Allow you to change anything, but once it has booted, it's debian and docker so you can do whatever you want.

## After the installation you should:
- Set a static IP adress
- Change the default passwords
- Ensure your data are safe with backups

## Default password:
You can ssh on your server with:
root:joix  
To change this password:  passwd root
You can access smb share with:
joix:joix  
To change this password: smbpasswd -a joix

## Storage
Configurations are stored in /etc/joix/  
Data are stored in /opt/joix/  

## What could be added?  
A lot of things, but do i want to?
