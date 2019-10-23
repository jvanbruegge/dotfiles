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

# Install config files
for f in */install.sh; do
    $f
done

# Enable systemd services
for s in $(< enable.txt); do
    sudo systemctl enable "$s"
    sudo systemctl start "$s"
done
