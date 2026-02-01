#!/usr/bin/env bash
# backup.sh - backup important files and configs
# usage: ./backup.sh [destination]

set -euo pipefail

# Configuration
BACKUP_DIR="${1:-$HOME/backups}"
DATE=$(date +%Y-%m-%d_%H%M%S)
BACKUP_NAME="backup_${DATE}"
BACKUP_PATH="${BACKUP_DIR}/${BACKUP_NAME}"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info()  { echo -e "${GREEN}[INFO]${NC}  $1"; }
log_warn()  { echo -e "${YELLOW}[WARN]${NC}  $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Directories to backup
DIRS_TO_BACKUP=(
    "$HOME/.dotfiles"
    "$HOME/.ssh"
    "$HOME/.gnupg"
    "$HOME/projects"
    "$HOME/Documents"
)

# Files to backup
FILES_TO_BACKUP=(
    "$HOME/.zsh_history"
    "$HOME/.bash_history"
)

# ============================================================================
# Main
# ============================================================================
main() {
    log_info "Starting backup: $BACKUP_NAME"
    log_info "Destination: $BACKUP_PATH"

    # Create backup directory
    mkdir -p "$BACKUP_PATH"

    # Backup directories
    for dir in "${DIRS_TO_BACKUP[@]}"; do
        if [ -d "$dir" ]; then
            local dirname=$(basename "$dir")
            log_info "Backing up directory: $dir"
            rsync -a --exclude='.git' --exclude='node_modules' \
                  --exclude='__pycache__' --exclude='.venv' \
                  "$dir/" "$BACKUP_PATH/$dirname/"
        else
            log_warn "Directory not found: $dir (skipping)"
        fi
    done

    # Backup individual files
    mkdir -p "$BACKUP_PATH/misc"
    for file in "${FILES_TO_BACKUP[@]}"; do
        if [ -f "$file" ]; then
            log_info "Backing up file: $file"
            cp "$file" "$BACKUP_PATH/misc/"
        else
            log_warn "File not found: $file (skipping)"
        fi
    done

    # Backup installed packages
    log_info "Saving package lists..."
    mkdir -p "$BACKUP_PATH/packages"

    if command -v brew &>/dev/null; then
        brew leaves > "$BACKUP_PATH/packages/brew-leaves.txt"
        brew list --cask > "$BACKUP_PATH/packages/brew-casks.txt" 2>/dev/null
    fi

    if command -v npm &>/dev/null; then
        npm list -g --depth=0 > "$BACKUP_PATH/packages/npm-global.txt" 2>/dev/null
    fi

    if command -v pip3 &>/dev/null; then
        pip3 list --format=freeze > "$BACKUP_PATH/packages/pip3-packages.txt" 2>/dev/null
    fi

    # Create compressed archive
    log_info "Compressing backup..."
    cd "$BACKUP_DIR"
    tar -czf "${BACKUP_NAME}.tar.gz" "$BACKUP_NAME"
    rm -rf "$BACKUP_NAME"

    local size=$(du -sh "${BACKUP_NAME}.tar.gz" | cut -f1)
    log_info "Backup complete: ${BACKUP_DIR}/${BACKUP_NAME}.tar.gz ($size)"

    # Clean up old backups (keep last 5)
    log_info "Cleaning up old backups..."
    ls -t "$BACKUP_DIR"/backup_*.tar.gz 2>/dev/null | tail -n +6 | xargs -r rm -f
    log_info "Done."
}

main "$@"
