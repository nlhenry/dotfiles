#This line is known as the shebang. This will tell the interpreter to run the Zsh program located in /bin/sh.
#!/bin/zsh

#Install zsh-autosuggestions:
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#Install zsh-syntax-highlighting:
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#Open the ”~/.zshrc” file in your desired editor and modify the plugins line to what you see below.
#plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

#Load these new plugins by running:
source ~/.zshrc
