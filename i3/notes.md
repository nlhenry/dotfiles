How to do a minimal operating system installation using debian and i3 window manager?

Hardware and software you need:
-Laptop/Desktop
-Flashdrive (with at lease 8 gigs of storage)
-Debian ISO File
-i3wm (Window Manager)
-i3blocks (feed generator for text based status bars)
-lightdm (Display Manager) *Look into using ly as an alternative.
-x11-xserver-utils 
-pulseaudio
-nm-tray (simple NetworkManager front end with information icon in the system tray)

Install debian:
1. On the BIOS install screen select "Install". The screen will then boot into the install manager. 
2. Next select a language to use for the installation process and click continue. 
3. Next enter the hostname for the system. I choice debian-i3, then clock continue.
4. Next configure the network. This will ask for a domain name. (I always leave these entries empty)
5. Next setup users and passwords for root. (I always leave these entries empty to avoid administration privilage issues.)
6. Next create a full name for the new user. Then click continue.
7. Next create a good password for the new user and then click continue.
8. Next partition disk. I don't usually dual boot so I normally select "Guided - use entire disk" option. Click continue when done. 

*Installation command for WM and DM config: (from youtube source. see below for rewrite)
sudo install i3 i3blocks lightdm x11-xserver-utils pulseaudio nm-tray


Install Ly, a terminal based (CLI) display manager. (https://github.com/fairyglade/ly)
Install dependencies for ly:
sudo apt install build-essential libpam0g-dev libxcb-xkb-dev

Clone and Compiling:
Clone the repository:
git clone https://github.com/fairyglade/ly

Change the directory to ly:
cd ly

Compile:
zig build

Test in a tty:
zig build run

Install Ly and the provided systemd service file:
zig build installsystemd

Enable the service:
systemctl enable ly.service 

If you need to switch between ttys after Ly's start you also have to disable getty on Ly's tty to prevent "login" from spawning on top of it:
systemctl disable getty@tty2.service
