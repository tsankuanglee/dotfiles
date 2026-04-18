#!/usr/bin/bash
cd "$(dirname "$(realpath "$0")")";

# shell
stow -t ~ bash
stow -t ~ zsh
#stow --no-folding -t ~ zsh.oh-my-zsh
stow -t ~ fish

# prompt
stow -t ~ starship

