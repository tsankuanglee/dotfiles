#!/usr/bin/bash
cd "$(dirname "$(realpath "$0")")";

stow --no-folding -t ~ gui-common

# terminal
stow -t ~ kitty

# IME
stow -t ~ fcitx5

