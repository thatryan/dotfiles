# Ryan’s dotfiles

### Note

This has only been tested on OS X 10.10+ and these are very much in flux, mostly notes to myself here so I would not run this unless you know what you are doing until I finalize it all :)

## Setup


Run this, need command line tools for git and stuffs.

```bash
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

After, if you wish to setup OS X preferences run,

```bash
$ ./setup-prefs
```

### Be sure you read through what the scripts do first! Questions, [just ask](https://github.com/thatryan/dotfiles/issues).

## Local Config Files
I keep private infos in local files in Dropbox, so once it is setup and linked to my account I run these

```bash
ln -s ~/Dropbox/local-dotfiles/.gitconfig.local ~/.gitconfig.local
ln -s ~/Dropbox/local-dotfiles/.aliases.local ~/.aliases.local
```

## Features
* The [pure prompt](https://github.com/sindresorhus/pure)
* Awesome [z](https://github.com/rupa/z) directory jumping
* Sweet [syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

## Sublime Text

My editor of choice so a special section for getting it set back up lives [**here**](sublime) until I can find how to automate it.

## Known Issues

* Need to find a way to auto start Alfred
* Column View as default finder window not working right
* Want to add options for customizing finder sidebar items
* Need to adjust trackpad and key repeats, way too fast but I don't know what options there are :)

## Bugs & Forks

Hey, there may be bugs in here. If you play around with this and find something or a way to do stuff better be sure to [let me know](https://github.com/thatryan/dotfiles/issues)! Also, be sure you read some of the scripts before blindly executing; always a good idea to have some idea of what all is going on. If you run this and your computer catches fire, don't blame me :see_no_evil:

If you decide to fork this project, be sure you substitute my name and info with yours in the initial setup clone and in the gitconfig.

## Updating

To update the dotfiles, just run script.

```bash
$ sh setup-mac 2>&1 | tee ~/setup-mac.log
```

The update process will do basically the same things as setup, but instead of downloading the dotfiles, it will just fetch the latest changes.

####TODO:

* Add something to track what cannot be automated for new machine setup similar to [Kevin Elliott's gist](https://gist.github.com/kevinelliott/0726211d17020a6abc1f)

## Migration Reminders

#### Need Manual Installation

These are the current apps that cannot be added via casks yet, or because I purchased via app store.

* [Annotate](https://www.driftt.com/annotate-mac)
* [SEO Spider](http://www.screamingfrog.co.uk/seo-spider)
* [Adobe Stuffs](https://www.adobe.com)
* [Tweetbot](http://tapbots.com/tweetbot/mac)

#### See if I want need to keep or add/remove apps

* read `brew list` and `brew cask list` to see whats worth reinstalling
* read `npm list -g --depth=0` to see global npm packages

#### Alfred Workflows

Sweet collection of [workflows](https://github.com/zenorocha/alfred-workflows)

#### Apps to re-link to their cloud prefs.

* 1Password
* Dropbox
* Transmit
* Text Expander
* Glui

#### Other app settings

Automate somehow...?

* Bartender
* Sublime
* Tweetbot
* iStat menus
* Xtra Finder
* MAMP config / hosts

## Acknowledgements

Inspiration and code was taken from many sources, including:

* [Cătălin’s dotfiles](https://github.com/alrra/dotfiles)
* [Paul Millr's dotfiles](https://github.com/paulmillr/dotfiles)
* [Paul Irish's dotfiles](https://github.com/paulirish/dotfiles)
* [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Nicolas Gallagher's dotfiles](https://github.com/necolas/dotfiles)
* [Hannes's osx script](https://github.com/hjuutilainen/dotfiles/blob/master/bin/osx-user-defaults.sh)
* [thoughtbot's laptop](https://github.com/thoughtbot/laptop)


## License

The code is available under the [MIT license](LICENSE.txt).
