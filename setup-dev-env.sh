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

append_if_missing "source $HOME/dev-env/zshrc.local" "$HOME/.zshrc"

