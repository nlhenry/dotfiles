## Install Oh My Posh on MacOS and Linux Shell
#### Run this to install Oh My Zsh:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
#### Or install oh-my-posh using homebrew with this command:
```
brew install jandedobbeleer/oh-my-posh/oh-my-posh
```
#### After installation run this command to update, upgrade and execute Oh My Posh:
```
brew update oh-my-posh && brew upgrade oh-my-posh && exec zsh
```
## Install Oh My Posh on Windows Powershell
#### Run this to install Oh My Zsh:
```
winget upgrade JanDeDobbeleer.OhMyPosh -s winget
```
#### Or install oh-my-posh using scoop with this command:
```
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
```
#### After installation run this command to update and upgrade oh my posh:
```
scoop update oh-my-posh && scoop upgrade oh-my-posh
```
#### For oh-my-posh to start when opening a new shell you have to update the $PROFILE file. Open $PROFILE:
```
nvim $PROFILE
```
If the above gives you an error, create the file using this command:
```
New-Item -Path $PROFILE -Type File -Force
```
Now add the line below:
```
oh-my-posh init pwsh | Invoke-Expression
```
## Install PowerLevel10K Theme
#### Run this to install PowerLevel10K:
```
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```
#### Now that it’s installed, open the ”~/.zshrc” file with your preferred editor and change the value of “ZSH_THEME” as shown below:
```
ZSH_THEME="powerlevel10k/powerlevel10k"
```
#### To reflect this change on your terminal, restart it or run this command:
```
source ~/.zshrc
```
## Install Nerd Font
```
???
```
## Install ZSH Plugins
#### Install zsh-autosuggestions:
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
#### Install zsh-syntax-highlighting:
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
#### Open the ”~/.zshrc” file in your desired editor and modify the plugins line to what you see below.
```
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)
```
#### Load these new plugins by running:
```
source ~/.zshrc
```
