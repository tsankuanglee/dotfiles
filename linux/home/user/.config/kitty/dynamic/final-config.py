#!/usr/bin/env python
# the STDOUT will be parsed by kitty as config

import os
import socket

# include host-specific config
hostname = os.environ.get('KITTY_CONF_HOSTNAME')
if not hostname:
    hostname = socket.gethostname()
config_path = os.path.expanduser(f"~/.config/kitty/dynamic/host-{hostname}.conf")
if os.path.isfile(config_path):
    with open(config_path, 'r') as f:
        print(f.read())

