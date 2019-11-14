#!/usr/bin/env bash

mkdir -p "$HOME/.config/systemd/user/"
cp ./ssh-agent/ssh-agent.service "$HOME/.config/systemd/user/"
sudo systemctl daemon-reload
systemctl --user enable ssh-agent.service
systemctl --user start ssh-agent.service
