#!/usr/bin/bash
cd "$(dirname "$(realpath "$0")")";

# common
stow -t ~ tmux
# Emulator
stow -t ~ kitty

# tools
stow -t ~ yazi
