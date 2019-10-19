#!/usr/bin/env bash
if [ -e "$HOME/.gitconfig" ]; then
    rm "$HOME/.gitconfig"
fi

ln -s "$(pwd)/git/.gitconfig" "$HOME/.gitconfig"
