# Ryan’s dotfiles

## Setup

Run this, need command line tools for git and stuffs.

```bash
$ sudo softwareupdate -i -a --restart
```

Once all updated,

```bash
$ xcode-select --install
```

To setup clone the repository from your home directory

```bash
git clone https://github.com/thatryan/dotfiles.git
```

Add symlinks and create some directories

```bash
$ ./yolo
```

## Local Config Files
I keep private infos in local files in Dropbox, so once it is setup and linked to my account I run one of these depending on machine

```bash
ln -s ~/Dropbox/local-dotfiles/.gitconfig.personal ~/.gitconfig.local
ln -s ~/Dropbox/local-dotfiles/.gitconfig.work ~/.gitconfig.local
```

Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```bash
brew tap homebrew/bundle
brew bundle --file ~/dotfiles/Brewfile
```

add logitech apps to readme after brewfile
- logitune
- logioptions+

#### Oh My
https://ohmyz.sh/#install
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
and plugins...
[Suggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
[Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Install and setup P10K
https://github.com/romkatv/powerlevel10k


add plugins to zshrc

```bash
git zoxide zsh-syntax-highlighting zsh-autosuggestions
```

#### Get snazzy!
https://github.com/sindresorhus/iterm2-snazzy

### Editors

Setup [Sublime](/sublime) Text 3 and packages/settings

Add some VS Code config

```bash
"editor.fontSize": 18,
"editor.fontFamily": "FiraCode Nerd Font Mono",
"window.zoomLevel": 1.4,
"terminal.integrated.fontSize": 14,
"terminal.integrated.localEchoStyle": "dim",
```

## Post Setup Reminders

* Setup SSH keys [github](https://help.github.com/articles/connecting-to-github-with-ssh/)

Install NVM and some Node stuffs

```bash
# Node packages
npm install -g gulp
npm install -g gulp-cli
```

#### See if I want need to keep or add/remove apps

* read `brew list` and `brew cask list` to see whats worth reinstalling
* read `npm list -g --depth=0` to see global npm packages


## UPDATES NEEDED

I really need to go over this, here are some spots I want to look for updates in future :)

[webpro article](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)

[Paul's dotfiles](https://github.com/paulirish/dotfiles)

[Webpro's dotfiles](https://github.com/webpro/dotfiles)

[driesvints dotfiles](https://github.com/driesvints/dotfiles)
