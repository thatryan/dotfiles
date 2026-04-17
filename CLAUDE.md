# Dotfiles — Claude Context

## What this is
Personal dotfiles for macOS. Managed by Ryan (@thatryan). Primary machine is a Mac used for web dev (WordPress/PHP), iOS dev (Xcode/Swift), and general use.

## Repo structure
```
dotfiles/
├── zsh/              # zsh config files
├── wezterm/          # WezTerm terminal config
├── starship/         # Starship prompt config
├── git/              # gitconfig + global gitignore
├── sublime/          # Sublime Text user preferences
├── jetbrains/        # PhpStorm settings export (zip)
├── homebrew/         # Brewfile, Brewfile.fonts, Brewfile.mas
└── macos/            # bootstrap script, defaults.sh, notes.md
```

## Bootstrap process (fresh Mac)
Order matters — follow this sequence:

1. `sudo softwareupdate -i -a --restart` — update macOS
2. `xcode-select --install` — CLI tools (required before Homebrew)
3. Install Homebrew manually
4. Sign into the App Store (required before `mas` installs)
5. Clone repo (conventionally to `~/dotfiles`)
6. `./macos/bootstrap` — creates directories and symlinks shared config files
7. Run Brewfiles in order: `Brewfile` → `Brewfile.fonts` → `Brewfile.mas`
8. Sign into Dropbox and let it sync, then link local config files (see below)
9. `./macos/defaults.sh` — applies macOS system preferences
10. Open Xcode once or run `sudo xcodebuild -runFirstLaunch`

Manual installs not in Brewfile: Microsoft Office (setup.office.com), Spencer App.

## Shell — zsh
Shared zsh files are symlinked into:
```
~/.config/zsh/
```

Main startup files (at `~/`):
- `.zshrc`
- `.zprofile`
- `.zshenv`

Shared sourced files (in `~/.config/zsh/`):
- `aliases.zsh`
- `functions.zsh`
- `plugins.zsh`
- `path.zsh`

Optional local/work files (not committed, sourced if present):
- `laptop-work.zsh`
- `aliases-work.zsh`

Prompt: Starship — config at `~/.config/starship.toml` (symlinked from repo).

Terminal: WezTerm — config at `~/.wezterm.lua` (symlinked from repo).

## Git config
Global config committed at `git/gitconfig`.
Machine identity (name, email, signing key) lives in `~/.gitconfig.local`, which is **not** committed.

Personal machine:
```bash
ln -s ~/Dropbox/local-dotfiles/.gitconfig.personal ~/.gitconfig.local
```

Work machine:
```bash
ln -s ~/Dropbox/dotfiles-local/.gitconfig.work ~/.gitconfig.local
```

## Homebrew
Three Brewfiles — all committed:
- `Brewfile` — core tools and casks (run first)
- `Brewfile.fonts` — fonts
- `Brewfile.mas` — Mac App Store apps (requires App Store sign-in first)

Brewfile is the source of truth for installed tools. If something should be added, add it there.

## Editors / IDEs
**Sublime Text** — installed via Homebrew. Settings are copied (not symlinked) into:
```
~/Library/Application Support/Sublime Text/Packages/User/
```
Files: `Preferences.sublime-settings`, `Default (OSX).sublime-keymap`
Also install: Package Control, SideBarEnhancements.

**PhpStorm** — import settings from `jetbrains/PhpStormSettings.zip`.
Also use JetBrains Backup and Sync if enabled.

## Local / private config (not committed)
Private and machine-specific files live in Dropbox and are linked in after Dropbox syncs:

- Git identity: `~/Dropbox/local-dotfiles/.gitconfig.personal` or `.gitconfig.work`
- Work zsh: `~/Dropbox/dotfiles-local/laptop-work.zsh`, `aliases-work.zsh`

No secrets or tokens are committed to this repo. API keys and credentials are managed in 1Password.

## Machine directories
Personal: `~/Developer`
Work: `~/code`

## What Claude should know
- `macos/bootstrap` handles symlinking — understand what it does before suggesting manual symlink changes
- The bootstrap script is self-locating (derives its path from `BASH_SOURCE[0]`) — the repo does not have to live at `~/dotfiles`
- The three Brewfiles are intentionally split — don't consolidate them
- `~/.gitconfig.local` must exist for git identity to work; it's never committed
- Don't suggest hardcoding credentials or tokens anywhere in this repo
- Sublime Text and PhpStorm are the editors in use — not VS Code
- Some zsh files are optional (work/machine-specific) and only sourced if present — that's intentional
- `zprofile` runs `brew shellenv` which exports `HOMEBREW_PREFIX` — zsh config files depend on this being set, so load order matters
- `defaults.sh` covers a comprehensive set of macOS preferences (Finder, Dock, keyboard, typing, trackpad, screenshots, windows, privacy, etc.) — don't change without confirming; see `notes.md` for settings that cannot be scripted
