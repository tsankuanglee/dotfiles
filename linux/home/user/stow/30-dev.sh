#!/usr/bin/bash
cd "$(dirname "$(realpath "$0")")";

stow -t ~ lazygit
stow -t ~ vale
