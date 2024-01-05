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

Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```bash
brew tap homebrew/bundle
brew bundle --file ~/dotfiles/Brewfile
```

Install and setup P10K
https://github.com/romkatv/powerlevel10k

https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961

## Sublime

Setup [Sublime](/sublime) Text 3 and packages/settings

## Post Setup Reminders

* Setup SSH keys [github](https://help.github.com/articles/connecting-to-github-with-ssh/)

Install NVM and some Node stuffs

```bash
# Node packages
npm install -g gulp
npm install -g gulp-cli
npm install -g tldr
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
