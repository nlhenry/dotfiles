log_file=~/install_progress_log.txt

# ---
# Install git and curl
# ---
sudo apt -y install git
if type -p git > /dev/null; then
    echo "git Install Complete" >> $log_file
else
    echo "git Failed to Install" >> $log_file
fi

sudo apt -y install curl
if type -p curl > /dev/null; then
    echo "curl Install Complete" >> $log_file
else
    echo "curl Failed to Install" >> $log_file
fi

# ---
#Install i3 window manager and other packages for i3wm
# ---
sudo apt -y install i3
if type -p i3 > /dev/null; then
    echo "i3 Install Complete" >> $log_file
else
    echo "i3 Failed to Install" >> $log_file
fi

sudo apt -y install i3blocks
if type -p i3blocks > /dev/null; then
    echo "i3blocks Install Complete" >> $log_file
else
    echo "i3blocks Failed to Install" >> $log_file
fi

sudo apt -y install lightdm
if type -p lightdm > /dev/null; then
    echo "lightdm Install Complete" >> $log_file
else
    echo "lightdm Failed to Install" >> $log_file
fi

sudo apt -y install x11-xserver-utils 
if type -p x11-xserver-utils > /dev/null; then
    echo "x11-xserver-utils Install Complete" >> $log_file
else
    echo "x11-xserver-utils Failed to Install" >> $log_file
fi

sudo apt -y install pulseaudio
if type -p pulseaudio > /dev/null; then
    echo "pulseaudio Install Complete" >> $log_file
else
    echo "pulseaudio Failed to Install" >> $log_file
fi

sudo apt -y install nm-tray
if type -p nm-tray > /dev/null; then
    echo "nm-tray Install Complete" >> $log_file
else
    echo "nm-tray Failed to Install" >> $log_file
fi

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Complete -Nik"
rm $log_file
