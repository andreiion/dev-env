#!/bin/bash

ln -s ~/dev-env/nvim/ ~/.config/
ln -s ~/dev-env/tmux.conf ~/.tmux.conf
ln -s ~/dev-env/gitconfig ~/.gitconfig

append_if_missing() {
    local line="$1"
    local file="$2"

    grep --line-regexp --quiet --fixed-strings "$line" "$file"
    if [ $? -ne 0 ]; then
        echo "Adding $line in $file"
        printf '%s\n' "$line" >> "$file"
    else
        echo "$line config already set in $file"
    fi

}

neovim_install_stable ()
{

    #TODO: Use nicer  method to detect arch. For example:
    #os="$(uname -s)"
    #arch="$(uname -m)"
    echo "Installing neovim stable"
    local neovim_arch="linux-x86_64"
    echo "Downloading neovim for $neovim_arch"
    curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-$neovim_arch.tar.gz
    sudo rm -rf /opt/nvim-linux-x86_64
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
    echo "Remove archive"
    rm -rf nvim-$neovim_arch.tar.gz
}

append_if_missing "source $HOME/dev-env/zshrc.local" "$HOME/.zshrc"
append_if_missing "export PATH=\"$PATH:/opt/nvim-linux-x86_64/bin\"" "$HOME/.zshrc"

neovim_install_stable


