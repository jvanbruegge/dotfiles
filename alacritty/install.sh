#!/usr/bin/env bash
if [ -e "$HOME/.config/alacritty" ]; then
    rm -r "$HOME/.config/alacritty"
fi

mkdir -p "$HOME/.config/alacritty"
ln -s "$(pwd)/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
