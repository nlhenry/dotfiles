# ---
# Retreive configuration files
# ---
git clone https://github.com/nlhenry/dotfiles

rm -rf ~/.config/i3 ~/.config/i3status

cp -r ~/git/i3 ~/.config/ && cp -r ~/git/i3status ~/.config/
