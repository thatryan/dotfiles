# Navigation
alias ..="cd .."

# eza
alias ls="eza --group-directories-first"
alias ll="eza -l --header --group-directories-first"
alias la="eza -la --header --group-directories-first"
alias l.="eza -ld .*"
alias lg="eza -lag --git --header --group-directories-first"
alias lt="eza -T --level=2 --group-directories-first"
alias llt="eza -lT --level=2 --header --group-directories-first"

# Git / helpers
alias git-clean-locks='mkdir -p /tmp/git-stale-locks && find .git -type f -name "*.lock" -print -exec sh -c '\''for f; do if ! lsof "$f" >/dev/null 2>&1; then echo "Removing stale lock: $f"; mv "$f" /tmp/git-stale-locks/; fi; done'\'' sh {} +'

alias zshrc='nvim ~/.zshrc'
alias zaliases='nvim ~/.config/zsh/aliases.zsh'
alias zfuncs='nvim ~/.config/zsh/functions.zsh'
alias zhosts='sudo nvim /etc/hosts'
