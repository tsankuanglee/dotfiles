#!/usr/bin/bash
cd "$(dirname "$(realpath "$0")")";

# Wayland (Sway)
#stow -t ~ sway

# Wayland (Hyprland)
#stow -t ~ hypr

# X-11
#stow -t ~ i3

# common
stow -t ~ dunst
stow -t ~ rofi
stow -t ~ skippy-xd
