# My dotfiles

This is the collection of my personal configuration files. It is made for Arch Linux and the Sway tiling window manager.

## Using this yourself

If you want to base your own setup on these files, to the following steps:

1. Fork this repository
2. Change the contents of `sway/conf.d/{display,input}.conf` depending on your setup
3. Create a new private repository for wallpapers and replace the submodule in `sway/wallpapers` with it (I cannot make my wallpapers public due to copyright).
4. Edit `git/.gitconfig` with your name and email address
5. Check which of the global variables in `zsh/env` you want to keep

## Got a question or improvement suggestions?

Just open an issue, I will gladly help you. As this is primarily my private configuration, I may or may not use improvement suggestions depending on how useful I think they are.

## What's in here

### terminal

I switched to alacritty because it is fast, supports wayland and can easily be configured to omit client side decorations (title bar). The config also contains a solarized color scheme.

### git

Just some useful aliases I use on a daily basis

### neovim

Vim is my favourite text editor and I have it configured with a bunch of language servers. I really have to say, working on a TypeScript project with this feels great.

### sway

Nothing too weird here, pretty basic configuration at the moment

### zsh

Fancy powerline theme, oh-my-zsh for completion and other plugins and some helpful global variables.

### misc

This script sets up pacman to use colors in its output and enables ntp.
