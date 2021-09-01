# Joix - simpliest media os server ever
## Disclaimer  
This is provided as-is whith simplicity for beginner or testers in mind.  
This implies there's no way to customize storages, targets or anything and that no consideration about anything else than what's provided: no security, checks, validation or anything else implied.  
There's certainly a lot of things that can be improved - if you think so, please make a PR or dont complain.  
## WARNING:
The iso is configured with simplicity in mind and is a "press enter" installation - No jokes.  
This means it will nuke the first hard drive the installer find to install Joix.
So: be carfull on the hardware you use  

## What's in the box?
This Will start the following apps in docker containers with preconfigured storages and default ports
- Jellyfin       http://joix:8096  
- Sonarr         http://joix:8989  
- Radarr         http://joix:7878  
- Lidarr         http://joix:8686  
- Deluge         http://joix:8112  
- Flaresolverr   http://joix:8191  
- Watchtower     -> auto-update all apps at 04:00  

## Usage:
This is intended to be executed by joix.iso installer - the script is not tested with anything else.
- Read the WARNING please :-) -  or cry when you lose everything
- Write ISO on USB key or load it on a VM
- Boot on ISO and press enter to install Joix
- Wait for the magic to happen after 2 reboots
- Configure all the apps you want / need

## What could be added?  
A lot of things, but do i want to?
