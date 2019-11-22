#!/usr/bin/env bash

config="$HOME/.config/sway"

if [ -e "$config" ]; then
    rm -r "$config"
fi

mkdir -p "$config/conf.d"

ln -s "$(pwd)/sway/config" "$config/config"

for f in $(ls "$(pwd)/sway/conf.d"); do
    ln -s "$(pwd)/sway/conf.d/$f" "$config/conf.d/"
done
