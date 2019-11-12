#!/usr/bin/env bash
if [ -e "$HOME/.config/alacritty" ]; then
    rm "$HOME/.config/alacritty"
fi

ln -s "$(pwd)/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
