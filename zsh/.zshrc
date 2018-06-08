# ~/.zshrc
# maintained by waiel

# ============================================================================
# Oh My Zsh
# ============================================================================
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    z
    history-substring-search
    colored-man-pages
    extract
    sudo
)

source $ZSH/oh-my-zsh.sh

# Source additional aliases
[ -f "$HOME/.dotfiles/zsh/aliases.sh" ] && source "$HOME/.dotfiles/zsh/aliases.sh"

# ============================================================================
# PATH
# ============================================================================
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
export PATH="/usr/local/opt/node/bin:$PATH"

# ============================================================================
# History
# ============================================================================
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_REDUCE_BLANKS

# ============================================================================
# Aliases
# ============================================================================
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git
alias g='git'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias ga='git add'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gpl='git pull'
alias gst='git stash'
alias gstp='git stash pop'
alias grb='git rebase'
alias gm='git merge'

# Editor
alias v='vim'
alias vi='vim'
alias c='clear'

# System
alias ports='netstat -tulanp'
alias myip='curl ifconfig.me'
alias weather='curl wttr.in'
alias path='echo $PATH | tr ":" "\n"'

# ============================================================================
# Environment
# ============================================================================
export EDITOR='vim'
export VISUAL='vim'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# ============================================================================
# Functions
# ============================================================================
mkcd() { mkdir -p "$1" && cd "$1"; }

# Quick git commit
gcm() { git add -A && git commit -m "$1"; }

# Find process by name
psg() { ps aux | grep -v grep | grep -i "$1"; }

# Create a .tar.gz archive
targz() { tar -czf "${1}.tar.gz" "$1"; }

extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.gz)      gunzip "$1" ;;
      *.tar)     tar xf "$1" ;;
      *.zip)     unzip "$1" ;;
      *.7z)      7z x "$1" ;;
      *)         echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
