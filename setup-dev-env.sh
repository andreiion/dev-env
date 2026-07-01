#!/bin/bash

#Disclaimer: This script replaces any default configuration for:
#nvim, tmux, ghostty, git. Make sure you understand that before proceeding.

set -euo pipefail

PROJECT_PATH="$(cd "$(dirname "$0")" && pwd)"

function create_backup() {
    local app_basename="$1"

    if [[ -d ~/.config/${app_basename} ]]; then
        echo "${app_basename} directory already exists. Creating backup."
        mv ~/.config/"${app_basename}" ~/.config/"${app_basename}".bkup
    fi
}

function append_if_missing() {
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

function add_to_path() {
    local dir="$1"
    local rc_file="$HOME/.zshrc"

    case ":$PATH:" in
        *":${dir}:"*)
            echo "${dir} already in PATH. Do nothing."
            return 0 ;;
    esac

    printf '\nexport PATH="$PATH:%s"\n' "${dir}" >> "${rc_file}"
    echo "Added ${dir} to PATH in ${rc_file}. source rc file to take effect."
}

function neovim_install_stable() {
    local neovim_arch="linux-x86_64"
    local neovim_release_url="https://github.com/neovim/neovim/releases/download/stable/nvim-${neovim_arch}.tar.gz"
    local etag="$HOME/.cache/dev-env/nvim-${neovim_arch}.etag"

    mkdir -p "$(dirname "${etag}")"

    echo "Installing neovim stable."
    echo "Downloading neovim for ${neovim_arch}"

    response_code=$(curl \
        --progress-bar -fL \
        --etag-compare "${etag}" \
        --etag-save "${etag}" \
        -O "${neovim_release_url}" \
        -w "%{response_code}")

    case "${response_code}" in
        200)
            sudo rm -rf /opt/nvim-linux-x86_64
            sudo tar -xzf nvim-linux-x86_64.tar.gz -C /opt

            rm -rf nvim-${neovim_arch}.tar.gz
            echo "Done installing neovim."
            ;;
        304)
            echo "Neovim already on latest stable. Nothing to do."
            return 0
            ;;
        *)
            echo "Unexpected status ${response_code}" >&2
            return 1
            ;;
    esac
}

function main() {

    append_if_missing "source $HOME/dev-env/zshrc.local" "$HOME/.zshrc"
    add_to_path "/opt/nvim-linux-x86_64/bin"
    neovim_install_stable

    echo "Creating symlinks for config files."
    for app in "${PROJECT_PATH}"/dot-config/*; do
        app_basename=$(basename "${app}")

        if ! [[ -h ~/.config/$(basename "${app}") ]]; then
            echo "Create symlink for ${app_basename}."
            create_backup "${app_basename}"
            ln -s "${app}" ~/.config/
        else
            echo "Link for ${app} already exists."
        fi
    done

    echo "Dev environment config done."
}

main "$@"
