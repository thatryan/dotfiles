BREW_PREFIX="$(brew --prefix)"

autoload -Uz compinit
compinit

source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
