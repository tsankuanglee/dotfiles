#!/usr/bin/bash
cd "$(dirname "$(realpath "$0")")";

# wayland
stow -t ~ sway
stow -t ~ hypr

# x11
#stow -t ~ i3

# common
stow -t ~ waybar
stow -t ~ dunst
stow -t ~ rofi
stow -t ~ skippy-xd
