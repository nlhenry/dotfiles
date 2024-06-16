# Installing Dotfiles

[Here's a description of how my dotfiles work](https://shaky.sh/simple-dotfiles/).

## Clone repository with git and cd into directory:
```
git clone https://github.com/nlhenry/dotfiles
```
```
cd <this-repo>
```
## Bootstrap Script:
```
./install/bootstrap.sh
```

## Local ZSH Config

If there's customization you want ZSH to load on startup that is specific to 
this machine (stuff you don't want to commit into the repo), create `~/.env.sh`
and put it in there. It will be loaded near the top of `.zshrc`.
