# Minimal operating system installation using Debian and i3 window manager?

## Hardware and software you need:
- Laptop/Desktop
- Flashdrive (with at least 8 gigs of storage)
- Debian ISO File
- i3wm (Window Manager)
- i3blocks (feed generator for text-based status bars)
- lightdm (Display Manager) *Look into using ly as an alternative.
- x11-xserver-utils 
- pulseaudio
- nm-tray (simple NetworkManager front end with information icon in the system tray)

## Install Debian:
1. On the BIOS install screen select "Install". The screen will then boot into the install manager. 
2. Next select a language to use for the installation process and click continue. 
3. Next enter the hostname for the system. I chose debian-i3, then click continue.
4. Next configure the network. This will ask for a domain name. (I always leave these entries empty)
5. Next setup users and passwords for root. (I always leave these entries empty to avoid administration privilege issues.)
6. Next create a full name for the new user. Then click continue.
7. Next create a good password for the new user and then click continue.
8. Next partition disk. I don't usually dual boot so I normally select the "Guided - use entire disk" option. Click continue when done. 

## Post Install:
```
# Install Git and Curl.
sudo apt install git && curl
```
```
# Install i3 window manager and lightdm.
sudo apt install i3 i3blocks lightdm x11-xserver-utils pulseaudio nm-tray
```
<!-- Retreive i3 configuration files using git. -->
<!-- Copy i3 configuration files to the local .config folder. -->
