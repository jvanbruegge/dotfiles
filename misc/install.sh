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

# Automatically switch to HDMI auto when connected
sudo ln -s "$(pwd)/hdmi_sound_toggle.sh" /usr/local/bin/hdmi_sound_toggle.sh
echo 'KERNEL=="card0", SUBSYSTEM=="drm", ACTION=="change", RUN+="/usr/local/bin/hdmi_sound_toggle.sh"' | sudo tee /etc/udev/rules.d/99-hdmi_sound.rules
sudo udevadm control --reload-rules
