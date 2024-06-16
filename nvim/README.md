### Install scoop as administrator:
`iex "& {$(irm get.scoop.sh)} -RunAsAdmin"`
### Install GNU Compiler Collection and binutils:
`scoop install gcc`
### Install Neovim
`scoop install neovim`
## Install LazyVim
### Make a backup of your current Neovim files:
`# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak`

`# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak`

### Clone the starter
`git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim`

### Remove the .git folder, so you can add it to your own repo later
`Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force`

### Start Neovim!
`nvim`
