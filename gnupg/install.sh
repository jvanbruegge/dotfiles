#!/bin/bash

mkdir -p "$HOME/.gnupg"
ln -s "$(pwd)"/gnupg/gpg.conf "$HOME/.gnupg"

gpg --recv-keys 0x366572be7d6c78a2
