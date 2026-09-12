#!/bin/sh

set -eu

DOTFILES_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

link_if_missing() {
    src="$1"
    dest="$2"

    if [ -L "$dest" ]; then
        printf 'skip: %s already exists as a symlink\n' "$dest"
        return
    fi

    if [ -e "$dest" ]; then
        printf 'skip: %s already exists\n' "$dest"
        return
    fi

    ln -s "$src" "$dest"
    printf 'linked: %s -> %s\n' "$dest" "$src"
}

mkdir -p "$HOME/.config"

link_if_missing "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
link_if_missing "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_if_missing "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
