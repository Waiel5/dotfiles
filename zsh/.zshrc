# ~/.zshrc
# maintained by waiel

# ============================================================================
# PATH
# ============================================================================
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# ============================================================================
# History
# ============================================================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# ============================================================================
# Prompt
# ============================================================================
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'
setopt PROMPT_SUBST
PROMPT='%F{cyan}%~%f %F{yellow}${vcs_info_msg_0_}%f
%F{green}$%f '

# ============================================================================
# Completion
# ============================================================================
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

# ============================================================================
# Key bindings
# ============================================================================
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ============================================================================
# Aliases
# ============================================================================
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias g='git'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph'
alias gd='git diff'
alias ga='git add'
alias gco='git checkout'

alias v='vim'
alias c='clear'

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
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.gz)      gunzip "$1" ;;
      *.tar)     tar xf "$1" ;;
      *.zip)     unzip "$1" ;;
      *)         echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
