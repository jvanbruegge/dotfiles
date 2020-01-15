#!/bin/bash

set -e

config="$HOME/.config/sway"
wallpapers="$config/wallpapers"
list="$config/lockscreen-wallpapers.txt"

if [ ! -e "$list" ]; then
    ls "$wallpapers" | shuf > "$list"
fi

file=$(head -n 1 "$list")

sed '1d' -i "$list"

if [[ -z $(grep '[^[:space:]]' $list) ]]; then
    rm $list
fi

swaylock --clock --datestr '%d.%m.%Y' --indicator -ef -i "$wallpapers/$file"
