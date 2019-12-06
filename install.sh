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

ln -sf "$(pwd)/stack/stack.yaml" "$HOME/.stack/global-project/stack.yaml"
stack install ormolu
stack install dhall dhall-json dhall-lsp-server

echo "allow-newer: true" >> ~/.stack/config.yaml

stack install hlint

ln -sf "$(pwd)/stack/config.yaml" "$HOME/.stack/config.yaml"
