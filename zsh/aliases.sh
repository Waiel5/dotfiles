#!/usr/bin/env bash
# aliases.sh - project aliases, git shortcuts, docker shortcuts
# sourced from .zshrc

# ============================================================================
# Docker
# ============================================================================
alias d='docker'
alias dc='docker compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias drm='docker rm $(docker ps -aq)'
alias drmi='docker rmi $(docker images -q --filter "dangling=true")'
alias dprune='docker system prune -af'
alias dlogs='docker logs -f'
alias dexec='docker exec -it'

# Docker compose shortcuts
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcr='docker compose restart'
alias dcl='docker compose logs -f'
alias dcb='docker compose build'
alias dce='docker compose exec'

# ============================================================================
# Project Navigation
# ============================================================================
alias proj='cd ~/projects'
alias dot='cd ~/.dotfiles'
alias dl='cd ~/Downloads'
alias desk='cd ~/Desktop'

# ============================================================================
# File Operations
# ============================================================================
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'
alias df='df -h'
alias du='du -sh'
alias free='free -h 2>/dev/null || vm_stat'

# ============================================================================
# Network
# ============================================================================
alias ping='ping -c 5'
alias headers='curl -I'
alias localip='ipconfig getifaddr en0'
alias flush='dscacheutil -flushcache && killall -HUP mDNSResponder'

# ============================================================================
# Development
# ============================================================================
alias serve='python3 -m http.server 8000'
alias json='python3 -m json.tool'
alias npmls='npm list --depth=0'
alias npmlsg='npm list -g --depth=0'

# ============================================================================
# Kubernetes
# ============================================================================
alias k='kubectl'
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kgn='kubectl get nodes'
alias kga='kubectl get all'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias kds='kubectl describe service'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias ke='kubectl exec -it'
alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'
alias kctx='kubectx'
alias kns='kubens'
alias kpf='kubectl port-forward'
alias kroll='kubectl rollout'
alias krs='kubectl rollout status'
