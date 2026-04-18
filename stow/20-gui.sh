#!/usr/bin/bash
cd "$(dirname "$(realpath "$0")")";

stow -t ~ kitty
stow -t ~ rofi
