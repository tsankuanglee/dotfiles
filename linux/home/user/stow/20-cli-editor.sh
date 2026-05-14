#!/usr/bin/bash
cd "$(dirname "$(realpath "$0")")";

# essential
stow -t ~ nvim

# other tools
#stow -t ~ hexeditor
#stow -t ~ dhex
