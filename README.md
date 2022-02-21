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

removing the auto run, doing it manually for now...

```bash
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile
```

## Sublime

Setup [Sublime](/sublime) Text 3 and packages/settings


#### Linting with Sublime
Confirm setup and install PHPCS, follow this [epic guide](https://webdevstudios.com/2017/04/06/lint-code-like-boss/)


After, if you wish to setup OS X preferences run,
##### Note* open chrome first, so its settings in setup will be applied.

```bash
$ ./setup-prefs
```

### Be sure you read through what the scripts do first! Questions, [just ask](https://github.com/thatryan/dotfiles/issues).

## Local Config Files
I keep private infos in local files in Dropbox, so once it is setup and linked to my account I run these

```bash
ln -s ~/Dropbox/local-dotfiles/.gitconfig.local ~/.gitconfig.local
```

### Mac App Store

> Sign into MAS manually first [bug](https://github.com/mas-cli/mas/issues/164)

Get app from mac app store using [mas](https://github.com/mas-cli/mas)

```bash
source ~/Dropbox/local-dotfiles/mas.sh
```
## Features
*

## Post Setup Reminders

* Setup SSH keys [github](https://help.github.com/articles/connecting-to-github-with-ssh/)

#### See if I want need to keep or add/remove apps

* read `brew list` and `brew cask list` to see whats worth reinstalling
* read `npm list -g --depth=0` to see global npm packages


## UPDATES NEEDED

I really need to go over this, here are some spots I want to look for updates in future :)

[webpro article](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)

[Paul's dotfiles](https://github.com/paulirish/dotfiles)

[Webpro's dotfiles](https://github.com/webpro/dotfiles)

[driesvints dotfiles](https://github.com/driesvints/dotfiles)
