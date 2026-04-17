# Ryan’s dotfiles

Personal Mac setup repo for:

- zsh
- git
- WezTerm
- Starship
- Sublime Text settings
- PhpStorm settings export
- Homebrew installs
- macOS setup notes/scripts

## What this repo manages

### Shell / terminal
- `zsh/zshrc`
- `zsh/zprofile`
- `zsh/zshenv`
- `zsh/aliases.zsh`
- `zsh/functions.zsh`
- `zsh/plugins.zsh`
- `zsh/path.zsh`
- `wezterm/wezterm.lua`
- `starship/starship.toml`

### Git
- `git/gitconfig`
- `git/gitignore_global`

### Editors / IDEs
- `sublime/Preferences.sublime-settings`
- `sublime/Default (OSX).sublime-keymap`
- `jetbrains/PhpStormSettings.zip`

### macOS / setup
- `homebrew/Brewfile`
- `homebrew/Brewfile.fonts`
- `homebrew/Brewfile.mas`
- `macos/bootstrap`
- `macos/defaults.sh`
- `macos/notes.md`

## Fresh Mac setup

### 1. Update macOS

```bash
sudo softwareupdate -i -a --restart
```

### 2. Install Command Line Tools

This is needed before Homebrew.

```bash
xcode-select --install
```

### 3. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 4. Sign in to the App Store

Do this **before** running any `mas` installs from the Brewfile.

### 5. Clone this repo

From your home directory:

```bash
git clone https://github.com/thatryan/dotfiles.git
cd ~/dotfiles
```

### 6. Run bootstrap

This should create needed directories and symlink the shared config files.

```bash
chmod +x ~/dotfiles/macos/bootstrap ~/dotfiles/macos/defaults.sh
./macos/bootstrap
```

### 7. Run the Brewfiles

Run the main Brewfile first. Fonts and MAS apps can wait if needed.

```bash
brew bundle --file ~/dotfiles/homebrew/Brewfile
brew bundle --file ~/dotfiles/homebrew/Brewfile.fonts
brew bundle --file ~/dotfiles/homebrew/Brewfile.mas
```

### 8. Sign in to Dropbox and let local config sync

I keep private / machine-specific files outside this repo in Dropbox.

Once Dropbox is installed and synced, link the local files I need.

## Local config files

These are **not** committed in this repo.

### Git local config

Personal machine:

```bash
ln -s ~/Dropbox/local-dotfiles/.gitconfig.personal ~/.gitconfig.local
```

Work machine:

```bash
ln -s ~/Dropbox/local-dotfiles/.gitconfig.work ~/.gitconfig.local
```

### Work-only zsh files

```bash
ln -s ~/Dropbox/dotfiles-local/laptop-work.zsh ~/.config/zsh/machine-work.zsh
ln -s ~/Dropbox/dotfiles-local/aliases-work.zsh ~/.config/zsh/aliases-work.zsh
```

### Machine directories

Work:

```bash
mkdir -p ~/code
```

Personal:

```bash
mkdir -p ~/Developer
```

## Xcode setup

After Xcode is installed, open it once **or** run:

```bash
sudo xcodebuild -runFirstLaunch
```

Then verify the active developer path:

```bash
xcode-select -p
xcodebuild -version
```

If needed:

```bash
sudo xcode-select --switch /Applications/Xcode.app
```

## Manual installs

These are not handled in the Brewfile.

### Microsoft Office
- Source: https://setup.office.com/
- Priority: day 1 if needed
- Sign in and install only the apps I actually want

### Spencer App
- Source: https://macspencer.app/
- Priority: later

## zsh layout

Shared zsh files are expected in:

```text
~/.config/zsh/
```

Main startup files:

- `~/.zshrc`
- `~/.zprofile`
- `~/.zshenv`

Shared sourced files:

- `aliases.zsh`
- `functions.zsh`
- `plugins.zsh`
- `path.zsh`

Optional local/work files:

- `machine-work.zsh`
- `aliases-work.zsh`

## Git config layout

Shared global git config is committed in this repo.

Machine/private identity info is loaded from:

```text
~/.gitconfig.local
```

That file is symlinked from my Dropbox local config.

## Sublime Text setup

Install Sublime via Homebrew, then copy these files into:

```text
~/Library/Application Support/Sublime Text/Packages/User/
```

Files:

- `sublime/Preferences.sublime-settings`
- `sublime/Default (OSX).sublime-keymap`

Then install:
- Package Control / package manager
- SideBarEnhancements

## PhpStorm setup

Import the saved settings zip from:

```text
jetbrains/PhpStormSettings.zip
```

Also use JetBrains Backup and Sync if enabled.

## Notes

- App Store sign-in must happen before `mas` installs.
- After Xcode installs, open it once or run `sudo xcodebuild -runFirstLaunch`.
- Verify `xcode-select -p` and switch to `/Applications/Xcode.app` if needed.
- `macos/bootstrap` should create `~/.config/zsh` and place/symlink the shared zsh files there.
- Some machine/work config is intentionally kept out of the repo and linked in later from Dropbox.
