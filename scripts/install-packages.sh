log_file=~/install_progress_log.txt

# ---
# Install starter packages
# ---
sudo apt -y install git
if type -p git > /dev/null; then
    echo "git Installed" >> $log_file
else
    echo "git FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt -y install curl
if type -p curl > /dev/null; then
    echo "curl Installed" >> $log_file
else
    echo "curl FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt -y install i3
if type -p i3 > /dev/null; then
    echo "i3 Installed" >> $log_file
else
    echo "i3 FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt -y install i3blocks
if type -p i3blocks > /dev/null; then
    echo "i3blocks Installed" >> $log_file
else
    echo "i3blocks FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt -y install lightdm
if type -p lightdm > /dev/null; then
    echo "lightdm Installed" >> $log_file
else
    echo "lightdm FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt -y install x11-xserver-utils 
if type -p x11-xserver-utils > /dev/null; then
    echo "x11-xserver-utils Installed" >> $log_file
else
    echo "x11-xserver-utils FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt -y install pulseaudio
if type -p pulseaudio > /dev/null; then
    echo "pulseaudio Installed" >> $log_file
else
    echo "pulseaudio FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt -y install nm-tray
if type -p nm-tray > /dev/null; then
    echo "nm-tray Installed" >> $log_file
else
    echo "nm-tray FAILED TO INSTALL!!!" >> $log_file
fi

# ---
# Retreive configuration files
# ---
git clone https://github.com/nlhenry/dotfiles

rm -rf ~/.config/i3 ~/.config/i3status

cp -r ~/git/i3 ~/.config/ && cp -r ~/git/i3status ~/.config/

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Complete -Nik"
rm $log_file
