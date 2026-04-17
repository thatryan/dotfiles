# Create dir and enter it
md() {
  mkdir -p "$@" && cd "$@"
}

# Search shell history
hist() {
  [[ -z "$*" ]] && { echo "usage: hist <pattern>"; return 1; }
  history 0 | grep -i -- "$*"
}

# Go up N directories: up 3
up() {
  local n="${1:-1}"
  local path=""
  for ((i=1; i<=n; i++)); do
    path+="../"
  done
  cd "${path}" || return
}

# Show current path and copy it to clipboard (macOS)
cpath() {
  pwd | tr -d '\n' | pbcopy
  echo "Copied: $(pwd)"
}

# Make a file and open it in default editor
touchopen() {
  [[ -z "$1" ]] && { echo "usage: touchopen <filename>"; return 1; }
  touch "$1" && open "$1"
}

# Extract common archives
extract() {
  [[ -z "$1" ]] && { echo "usage: extract <archive>"; return 1; }
  [[ ! -f "$1" ]] && { echo "not a file: $1"; return 1; }

  case "$1" in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz)  tar xzf "$1" ;;
    *.bz2)     bunzip2 "$1" ;;
    *.rar)     unrar x "$1" ;;
    *.gz)      gunzip "$1" ;;
    *.tar)     tar xf "$1" ;;
    *.tbz2)    tar xjf "$1" ;;
    *.tgz)     tar xzf "$1" ;;
    *.zip)     unzip "$1" ;;
    *.7z)      7z x "$1" ;;
    *)         echo "don't know how to extract: $1" ;;
  esac
}

# Quick local IP
iplocal() {
  ipconfig getifaddr en0 || ipconfig getifaddr en1
}

# Kill process by name, with confirmation
killname() {
  [[ -z "$1" ]] && { echo "usage: killname <process>"; return 1; }
  pgrep -ifl "$1"
  echo -n "Kill matching processes? [y/N] "
  read -r reply
  [[ "$reply" =~ ^[Yy]$ ]] && pkill -f "$1"
}

# Show what's listening on a port
port() {
  [[ -z "$1" ]] && { echo "usage: port <port-number>"; return 1; }
  lsof -nP -iTCP:"$1" -sTCP:LISTEN
}

# Kill whatever is listening on a port
killport() {
  [[ -z "$1" ]] && { echo "usage: killport <port-number>"; return 1; }
  local pids
  pids=$(lsof -tiTCP:"$1" -sTCP:LISTEN)
  [[ -z "$pids" ]] && { echo "nothing listening on port $1"; return 0; }
  echo "$pids" | xargs kill -9
}

# Pretty-print or query a JSON file
json() {
  [[ -z "$1" ]] && { echo "usage: json <file> [filter]"; return 1; }
  jq "${2:-.}" "$1"
}

# Serve current directory over HTTP
serve() {
  local port="${1:-8000}"
  echo "Serving on http://localhost:${port}"
  python3 -m http.server "$port"
}

sshpub() {
  local key="${1:-$HOME/.ssh/id_ed25519.pub}"
  [[ ! -f "$key" ]] && { echo "No public key found: $key"; return 1; }
  pbcopy < "$key"
  echo "Copied: $key"
}

# Show available custom shell functions
fhelp() {
  cat <<'EOF'
Custom functions:
  md <dir>            - create directory and cd into it
  hist <pattern>      - search shell history
  up [n]              - go up n directories
  cpath               - copy current path to clipboard
  touchopen <file>    - create a file and open it
  extract <archive>   - extract common archive types
  iplocal             - show local IP address
  killname <process>  - find and optionally kill a process by name
  port <number>       - show what is listening on a port
  killport <number>   - kill process listening on a port
  sshpub [keyfile]    - copy SSH public key to clipboard
  json <file> [filter]- pretty-print or query JSON with jq
  serve [port]        - serve current directory over HTTP (default: 8000)
  fhelp               - show this help
EOF
}

lhelp() {
  cat <<'EOF'
eza aliases:
  ls   - list files, directories first
  ll   - long list with header
  la   - long list including hidden files
  lt   - tree view
  l.   - show dotfiles / dotdirectories
  lg   - long list with hidden files + git info
  llt  - detailed tree view, depth 2
EOF
}

pathhelp() {
  cat <<'EOF'
Path/runtime helpers:
  echo $PATH                  - show current PATH
  which <cmd>                 - show command location
  command -v <cmd>            - check if a command exists
  php -v                      - show active PHP version
  node -v                     - show active Node version
  npm -v                      - show npm version
  nvm current                 - show current Node version via nvm
EOF
}

githelp() {
  cat <<'EOF'
Git helpers:
  git aliases   - list custom git aliases
  git s         - short status
  git sb        - short branch status
  git sv        - verbose status (shows full diff)
  git l         - pretty recent log (graph)
  git lo        - one-line log
  git lm        - markdown-style log (bullet + hash)
  git d         - diff with stats (clears screen first)
  git co        - switch branch
  git cob       - create and switch to new branch
  git last      - switch to previous branch (like cd -)
  git amend     - amend using previous commit message
  git unstage   - unstage files safely
  git pt        - push and push tags
  git pruneit   - delete local branches whose remote is gone
  git nah       - HARD reset/clean/rebase-abort (dangerous)
EOF
}

dothelp() {
  cat <<'EOF'
Dotfiles locations:
  ~/.zshrc
  ~/.zprofile
  ~/.zshenv
  ~/.config/zsh/aliases.zsh
  ~/.config/zsh/functions.zsh
  ~/.config/zsh/plugins.zsh
  ~/.config/zsh/path.zsh
  ~/.gitconfig
  ~/.gitconfig.local
  ~/.wezterm.lua
  ~/.config/starship.toml
EOF
}

remindme() {
  cat <<'EOF'
Available helper overviews:
  remindme  - show this overview
  fhelp     - custom shell functions (md, hist, up, extract, port, killport, sshpub, ...)
  lhelp     - eza alias reference
  githelp   - custom git alias reminders
  pathhelp  - PATH / runtime checks
  dothelp   - dotfiles/config locations
EOF
}
