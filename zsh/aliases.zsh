# Navigation
alias ..="cd .."
alias o='open .'

# Shell
alias reload='exec zsh'

# eza
alias ls="eza --group-directories-first"
alias ll="eza -l --header --group-directories-first"
alias la="eza -la --header --group-directories-first"
alias l.="eza -ld .*"
alias lg="eza -lag --git --header --group-directories-first"
alias lt="eza -T --level=2 --group-directories-first"
alias llt="eza -lT --level=2 --header --group-directories-first"

# Tools
alias lzg='lazygit'

# Config editing
alias zshrc='nvim ~/.zshrc'
alias zaliases='nvim ~/.config/zsh/aliases.zsh'
alias zfuncs='nvim ~/.config/zsh/functions.zsh'
alias zhosts='sudo nvim /etc/hosts'
