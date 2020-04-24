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

for f in "$(pwd)"/sway/conf.d/*; do
    ln -s "$f" "$config/conf.d/"
done

for f in "$(pwd)"/sway/wallpapers/*; do
    ln -s "$f" "$config/wallpapers/"
done

ln -s "$(pwd)/sway/waybar.json" "$HOME/.config/waybar/config"
ln -s "$(pwd)/sway/waybar.css" "$HOME/.config/waybar/style.css"

ln -s "$(pwd)/sway/lock.sh" "$config/lock.sh"
ln -s "$(pwd)/sway/env" "$config/env"

ln -s "$(pwd)"/sway/systemd/* "$HOME/.config/systemd/user/"

sudo ln -sf "$(pwd)/sway/xkb/us_de_diff" "/usr/share/X11/xkb/symbols/"
sudo ln -sf "$(pwd)/sway/xkb/us_de" "/usr/share/X11/xkb/symbols/"

sudo systemctl daemon-reload

for s in "$(pwd)"/sway/systemd/*.service; do
    if [ "$s" != "sway.service" ]; then
        systemctl --user enable "$(basename "$s")"
    fi
done
