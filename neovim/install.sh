#!/usr/bin/env bash

if [ -e "$HOME/.local/share/nvim/site" ]; then
    rm -rf "$HOME/.local/share/nvim/site"
fi

if [ -e "$HOME/.config/nvim" ]; then
    rm -rf "$HOME/.config/nvim"
fi

mkdir -p "$HOME/.config/nvim"

ln -s "$(pwd)/neovim/init.vim" "$HOME/.config/nvim/init.vim"

nvim +PlugInstall +qall
