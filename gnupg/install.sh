#!/bin/bash

mkdir -p "$HOME/.gnupg"
ln -s "$(pwd)"/gnupg/gpg.conf "$HOME/.gnupg"

gpg --recv-keys 0x366572be7d6c78a2

git clone git@github.com:jvanbruegge/password-store.git "$HOME/.password-store"

cd /usr/lib/browserpass || exit 1
make configure
make hosts-firefox-user
