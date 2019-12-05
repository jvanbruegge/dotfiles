#!/usr/bin/env bash

# Install AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Install packages
yay -S reflector
sudo reflector --save /etc/pacman.d/mirrorlist --sort rate -c Germany -n 15 -p https

yay -Syu
yay -S $(< packages.txt)

# Share latex fonts with the system
ln -s /etc/fonts/conf.avail/09-texlive-fonts.conf /etc/fonts/conf.d/
fc-cache

# Install config files
for f in */install.sh; do
    $f
done

# Enable systemd services
for s in $(< enable.txt); do
    sudo systemctl enable "$s"
    sudo systemctl start "$s"
done

# Set up haskell environment
stack setup --resolver=lts-14.16

echo "extra-deps:
-  ghc-lib-parser-8.8.1@sha256:81dc4ed6ae6b7ccfda1e62e3c2d9a8600f8ecf45e4237d4dc099ccd4b74db180,8341" >> ~/.stack/global-project/stack.yaml

stack install ormolu

echo "allow-newer: true" >> ~/.stack/config.yaml

stack install hlint

ln -sf "$(pwd)/misc/config.yaml" "$HOME/.stack/"
