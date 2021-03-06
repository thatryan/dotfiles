# Load main files
source ~/.aliases
source ~/dotfiles/shell/functions
source ~/github/z/z.sh
source ~/github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Setup prompt
autoload -U promptinit && promptinit
prompt pure

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# History settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# Paths

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /usr/local/opt/ruby/bin
  /usr/local/share/npm/bin
  /usr/{bin,sbin}
  /{bin,sbin}
  $path
)

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"

export PATH="$PATH:/usr/local/bin/eslint"

export PATH="$PATH:/usr/local/bin/sass-lint"
