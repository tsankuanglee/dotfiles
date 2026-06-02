#!/usr/bin/bash
cd "$(dirname "$(realpath "$0")")";

# setup env vars
. ~/.local/bin/gui_environment_vars.sh

# screenshot
./screenshot.py $*
