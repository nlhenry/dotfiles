## Installing Oh-My-Posh
##### Run this to install Oh My Zsh:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
##### Run this to install PowerLevel10K:
```
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```
##### Now that it’s installed, open the ”~/.zshrc” file with your preferred editor and change the value of “ZSH_THEME” as shown below:
```
#ZSH_THEME="powerlevel10k/powerlevel10k"
```
##### To reflect this change on your terminal, restart it or run this command:
```
#source ~/.zshrc
```
##### Run command below to configure theme:
```
#p10k configure
```
