#!/usr/bin/bash
mkdir -p ~/packages/
cd ~/packages
curl https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz | tar zx
cd yaourt
makepkg -sr
