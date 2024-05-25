# i3 Window Manager Setup
## Requirements
#### Working Desktop Environment or Window Manager. I will be using Xfce because it is minimal and includes essential packages built in. 
## Install i3 Window Manager
#### Use this command in the terminal:
```
sudo apt install i3
```
#### The i3 install will give you i3-wm, dunst, i3lock, i3status, and suckless-tools. If the packages do not install automatically for some reason, just install them manually using the command below.
```
sudo apt-get install i3-wm dunst i3lock i3status suckless-tools
```
#### Install some additional packages for further customization:
```
sudo apt-get install compton hsetroot rxvt-unicode xsel rofi fonts-noto fonts-mplus xsettingsd lxappearance scrot viewnior
```
## Explanations of Additional Packages
- Compton is a compositor to provide some desktop effects like shadow, transparency, fade, and transiton. 
- Hsetroot is a wallpaper handler. i3 has no wallpaper handler by default.
- URxvt is a lightweight terminal emulator, part of *i3-sensible-terminal*.
- Xsel is a program to access X clipboard. We need it to make copy-paste in URxvt available. Hit Alt+C to copy, and Alt+V to paste. 
- Rofi is a program launcher, similar with dmenu but with more options.
- Noto Sans and M+ are my favourite fonts used in my configuration.
- Xsettingsd is a simple settings daemon to load fontconfig and some other options. Without this, fonts would look rasterized in some applications.
- LXAppearance is used for changing GTK theme icons, fonts, and some other preferences.
- Scrot is for taking screenshoot. I use it in my configuration for Print Screen button.
I set my Print Screen button to take screenshoot using scrot, then automatically open it using Viewnior image viewer. <br />
## Launching i3
#### Once all packages are installed logout your current session. Then login again with a i3 session. 
## Retrieve Configuration File from Github
```
git clone https://github.com/nlhenry/dotfiles/i3
```
#### My dotfiles contains font, so refresh your font config cache `fc-cache -fv` after You copy the font.
```
fc-cache -fv
```
**Note:** You can deploy this repository recursively using but I recommend you copy the configuration files one by one to give yourself more control.
```
git clone https://github.com/nlhenry/i3.git && cp -a i3/. ~
```
