#!/usr/bin/bash
cd "$(dirname "$(realpath "$0")")";

# common
stow -t ~ tmux

# tools
stow -t ~ yazi
