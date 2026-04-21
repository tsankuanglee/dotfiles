#!/usr/bin/bash

source ~/.local/bin/gui_environment_vars.sh

# Adjust based on which direction you are syncing
case "$1" in
    "x2w")
        xclip -o -selection clipboard | wl-copy
        ;;
    "w2x")
        wl-paste | xclip -selection clipboard
        ;;
    *)
        echo "Usage: $0 {x2w|w2x}"
        exit 1
        ;;
esac
