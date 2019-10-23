#!/usr/bin/env bash

config="$HOME/.config/sway"

if [ -e "$config" ]; then
    rm -r "$config"
fi

mkdir -p "$config"

ln -s "$(pwd)/sway/config" "$config/config"
