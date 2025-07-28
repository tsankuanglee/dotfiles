#!/usr/bin/env python
# include OS-specific configs, and then host-specific ones

# the STDOUT will be parsed by kitty as config

import glob
import os
import platform
import socket

KITTY_CONFIG_DIR=os.path.expanduser(f"~/.config/kitty/dynamic")

# include OS-specific config
# get OS
os_name = os.environ.get('KITTY_OS')
if not os_name:
    # 'Windows', 'Linux', 'Darwin' for macOS
    os_name = {
        "Windows": "linux",  # assuming wsl
        "Linux": "linux",
        "Darwin": "macos",
    }.get(platform.system(), "linux")
# include os-linux-* (or the actual platofrm), in order
for filename in sorted(glob.glob(f"{KITTY_CONFIG_DIR}/os-{os_name}*.conf")):
    with open(filename) as f:
        print(f.read())

# include host-specific config
hostname = os.environ.get('KITTY_CONF_HOSTNAME')
if not hostname:
    hostname = socket.gethostname().strip()

for filename in sorted(glob.glob(f"{KITTY_CONFIG_DIR}/host-{hostname}*.conf")):
    with open(filename, 'r') as f:
        print(f.read())

