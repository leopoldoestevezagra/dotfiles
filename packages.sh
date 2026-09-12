#!/bin/sh

set -eu

NVM_VERSION="v0.40.7"
RIPGREP_VERSION="15.2.0"

# -------------------------------------------------------------------
# Helpers
# -------------------------------------------------------------------

has_command() {
    command -v "$1" >/dev/null 2>&1
}

info() {
    printf '\n==> %s\n' "$1"
}

skip() {
    printf '    already installed, skipping.\n'
}

# -------------------------------------------------------------------
# Package installers
# -------------------------------------------------------------------

install_neovim() {
    info "Installing Neovim"

    if has_command nvim; then
        skip
        return
    fi

    tmp_dir=$(mktemp -d)
    trap 'rm -rf "$tmp_dir"' EXIT

    curl -fL -o "$tmp_dir/nvim-linux-x86_64.appimage" \
        "https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage"

    chmod +x "$tmp_dir/nvim-linux-x86_64.appimage"

    "$tmp_dir/nvim-linux-x86_64.appimage" --version

    sudo mv "$tmp_dir/nvim-linux-x86_64.appimage" /usr/local/bin/nvim

    trap - EXIT
    rm -rf "$tmp_dir"
}

install_nvm() {
    info "Installing NVM"

    if [ -s "$HOME/.nvm/nvm.sh" ]; then
        skip
        return
    fi

    tmp_file=$(mktemp)

    curl -fL --proto '=https' --tlsv1.2 \
        -o "$tmp_file" \
        "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh"

    bash "$tmp_file"

    rm -f "$tmp_file"
}

install_ripgrep() {
    info "Installing ripgrep"

    if has_command rg; then
        skip
        return
    fi

    tmp_dir=$(mktemp -d)
    trap 'rm -rf "$tmp_dir"' EXIT

    curl -fL -o "$tmp_dir/ripgrep.deb" \
        "https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep_${RIPGREP_VERSION}-1_amd64.deb"

    sudo dpkg -i "$tmp_dir/ripgrep.deb"

    trap - EXIT
    rm -rf "$tmp_dir"
}

install_tmux() {
    info "Installing tmux"

    if has_command tmux; then
        skip
        return
    fi

    sudo apt update
    sudo apt install -y tmux
}

install_ohmyzsh() {
    info "Installing Zsh and Oh My Zsh"

    # Install Zsh if needed
    if ! has_command zsh; then
        sudo apt update
        sudo apt install -y zsh
    else
        printf '    zsh already installed.\n'
    fi

    # Make Zsh the default shell
    current_shell=$(getent passwd "$USER" | cut -d: -f7)
    zsh_path=$(command -v zsh)

    if [ "$current_shell" = "$zsh_path" ]; then
        printf '    zsh is already the default shell.\n'
    else
        printf '    changing default shell to zsh...\n'
        chsh -s "$zsh_path"
    fi

    # Install Oh My Zsh
    if [ -d "$HOME/.oh-my-zsh" ]; then
        printf '    Oh My Zsh already installed.\n'
    else
        printf '    installing Oh My Zsh...\n'
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
}

install_general_utils() {
    info "Installing general utilities"

    # ---------------------------------------------------------------
    # APT packages
    # ---------------------------------------------------------------

    packages=""

    has_command git || packages="$packages git"
    has_command neofetch || packages="$packages neofetch"
    has_command wget || packages="$packages wget"
    has_command curl || packages="$packages curl"
    has_command unzip || packages="$packages unzip"
    has_command fc-cache || packages="$packages fontconfig"

    if [ -n "$packages" ]; then
        sudo apt update
        sudo apt install -y $packages
    else
        printf '    apt packages already installed.\n'
    fi

    # ---------------------------------------------------------------
    # JetBrainsMono Nerd Font
    # ---------------------------------------------------------------

    if [ -d "$HOME/.local/share/fonts/JetBrainsMono" ]; then
        printf '    JetBrainsMono Nerd Font already installed.\n'
    else
        printf '    installing JetBrainsMono Nerd Font...\n'

        tmp_dir=$(mktemp -d)
        trap 'rm -rf "$tmp_dir"' EXIT

        curl -fL -o "$tmp_dir/JetBrainsMono.zip" \
            "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/JetBrainsMono.zip"

        mkdir -p "$HOME/.local/share/fonts/JetBrainsMono"
        unzip -q "$tmp_dir/JetBrainsMono.zip" \
            -d "$HOME/.local/share/fonts/JetBrainsMono"

        fc-cache -fv >/dev/null

        trap - EXIT
        rm -rf "$tmp_dir"
    fi

    # ---------------------------------------------------------------
    # Tree-sitter CLI
    # ---------------------------------------------------------------

    if has_command tree-sitter; then
        printf '    tree-sitter already installed.\n'
    else
        printf '    installing Tree-sitter CLI...\n'

        tmp_dir=$(mktemp -d)
        trap 'rm -rf "$tmp_dir"' EXIT

        curl -fL -o "$tmp_dir/tree-sitter.zip" \
            "https://github.com/tree-sitter/tree-sitter/releases/download/v0.27.0/tree-sitter-cli-linux-x86.zip"

        mkdir -p "$HOME/.local/bin"

        unzip -q "$tmp_dir/tree-sitter.zip" \
            -d "$tmp_dir/tree-sitter"

        chmod +x "$tmp_dir/tree-sitter/tree-sitter"

        mv "$tmp_dir/tree-sitter/tree-sitter" \
            "$HOME/.local/bin/tree-sitter"

        trap - EXIT
        rm -rf "$tmp_dir"

        printf '    installed tree-sitter to ~/.local/bin/tree-sitter\n'
    fi
}


# -------------------------------------------------------------------
# Menu
# -------------------------------------------------------------------

printf '%s\n' "What do you want to install?"
printf '\n'
printf '1) Neovim\n'
printf '2) NVM\n'
printf '3) ripgrep\n'
printf '4) tmux\n'
printf '5) zsh\n'
printf '6) General utilities\n'
printf '7) All\n'
printf 'q) Quit\n'
printf '\n'

printf 'Selection: '
read -r selection

case "$selection" in
    1)
        install_neovim
        ;;
    2)
        install_nvm
        ;;
    3)
        install_ripgrep
        ;;
    4)
        install_tmux
        ;;
    5)
        install_ohmyzsh
        ;;
    6)
        install_general_utils
        ;;
    7)
        install_general_utils
        install_neovim
        install_nvm
        install_ripgrep
        install_tmux
        install_ohmyzsh
        ;;
    q|Q)
        exit 0
        ;;
    *)
        printf 'Invalid selection.\n'
        exit 1
        ;;
esac

printf '\nDone.\n'
