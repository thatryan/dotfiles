# Ryan’s dotfiles

### Note

This has only been tested on OS X 10.10 - 10.13 and these are very much in flux, mostly notes to myself here so I would not run this unless you know what you are doing until I finalize it all :)

## Setup


Run this, need command line tools for git and stuffs.

```bash
$ sudo softwareupdate -i -a --restart
$ xcode-select --install
```

To setup clone the repository recursively from your home directory, the setup process will offer you several options along the way.

```bash
git clone --recursive git://github.com/thatryan/dotfiles.git
```

Once cloned, run it. This will do lots, create some directories, setup symlinks install brews/casks/node modules...

```bash
$ sh setup-mac 2>&1 | tee ~/setup-mac.log
```

Install [Composer](https://getcomposer.org/download/)

## Sublime

Setup Sublime Text 3 and packages/settings


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

Get app from mac app store using [mas](https://github.com/mas-cli/mas)

```bash
source ~/Dropbox/local-dotfiles/mas.sh
```
## Features
* [Hyper](https://hyper.is/) terminal
* The [pure prompt](https://github.com/sindresorhus/pure)
* [Hyper Snazzy!](https://github.com/sindresorhus/hyper-snazzy)
* Awesome [z](https://github.com/rupa/z) directory jumping
* Sweet [syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

## Bugs & Forks

Hey, there may be bugs in here. If you play around with this and find something or a way to do stuff better be sure to [let me know](https://github.com/thatryan/dotfiles/issues)! Also, be sure you read some of the scripts before blindly executing; always a good idea to have some idea of what all is going on. If you run this and your computer catches fire, don't blame me :see_no_evil:

## Migration Reminders

* Setup SSH keys [github](https://help.github.com/articles/connecting-to-github-with-ssh/)
* Setup [vvv](https://varyingvagrantvagrants.org/docs/en-US/installation/)
* More [hyper](https://github.com/bnb/awesome-hyper) stuff


#### See if I want need to keep or add/remove apps

* read `brew list` and `brew cask list` to see whats worth reinstalling
* read `npm list -g --depth=0` to see global npm packages
* read `gem list` to see current gem files
