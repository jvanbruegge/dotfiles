#!/usr/bin/env bash

if [ -e "$HOME/.local/share/nvim/site" ]; then
    rm -rf "$HOME/.local/share/nvim/site"
fi

if [ -e "$HOME/.config/nvim" ]; then
    rm -rf "$HOME/.config/nvim"
fi

if [ -e "$HOME/.config/coc" ]; then
    rm -rf "$HOME/.config/coc"
fi

mkdir -p "$HOME/.config/nvim"

ln -s "$(pwd)/neovim/init.vim" "$HOME/.config/nvim/init.vim"
ln -s "$(pwd)/neovim/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"

nvim +PlugInstall +qall
nvim -c "CocInstall coc-json coc-css coc-tsserver" +qall
