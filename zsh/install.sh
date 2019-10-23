#!/usr/bin/env bash

config="$HOME/.config/zsh"
cache="$HOME/.cache/zsh"

if [ -e "$HOME/.zshrc" ]; then
    rm "$HOME/.zshrc"
fi
ln -s "$(pwd)/zsh/zshrc" "$HOME/.zshrc"

if [ -e "$config" ]; then
    rm -rf "$config"
fi

if [ -e "$cache" ]; then
    rm -rf "$cache"
fi

mkdir -p "$config"
mkdir -p "$cache"
mkdir -p "$cache/omz-custom/themes"

ln -s "$(pwd)/zsh/env" "$config"
ln -s "$(pwd)/zsh/aliases" "$config"

git clone https://github.com/robbyrussell/oh-my-zsh.git "$cache/oh-my-zsh"
git clone https://github.com/bhilburn/powerlevel9k.git "$cache/omz-custom/themes/powerlevel9k"
