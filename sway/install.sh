#!/usr/bin/env bash

config="$HOME/.config/sway"

if [ -e "$config" ]; then
    rm -r "$config"
fi

if [ -e "$HOME/.config/waybar" ]; then
    rm -r "$HOME/.config/waybar"
fi

mkdir -p "$config/conf.d"
mkdir -p "$config/wallpapers"
mkdir -p "$HOME/.config/waybar"

ln -s "$(pwd)/sway/config" "$config/config"

for f in $(ls "$(pwd)/sway/conf.d"); do
    ln -s "$(pwd)/sway/conf.d/$f" "$config/conf.d/"
done

for f in $(ls "$(pwd)/sway/wallpapers"); do
    ln -s "$(pwd)/sway/wallpapers/$f" "$config/wallpapers/"
done

ln -s "$(pwd)/sway/waybar.json" "$HOME/.config/waybar/config"
ln -s "$(pwd)/sway/waybar.css" "$HOME/.config/waybar/style.css"
