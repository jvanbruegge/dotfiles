#!/usr/bin/env bash

# Pacman
sudo sed -i 's/^#Color/Color/g' /etc/pacman.conf

# NTP
if [ -e /etc/ntp.conf ]; then sudo rm /etc/ntp.conf; fi
ntp=""
for ((i=1;i<=4;i++)); do
    ntp="${ntp}server $i.de.pool.ntp.org iburst\n"
done
echo -e "$ntp" | sudo tee /etc/ntp.conf > /dev/null
