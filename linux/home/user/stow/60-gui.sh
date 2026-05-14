#!/usr/bin/bash
cd "$(dirname "$(realpath "$0")")";

stow --no-folding -t ~ gui-common

stow -t ~ rofi
stow -t ~ kitty
stow -t ~ nvim-qt
