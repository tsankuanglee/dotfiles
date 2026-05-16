# Setup

## configuration files

* Copy `.env.tmpl` to `.env` and edit it.
* Run `./configure.sh`, which will produce `./local/*kbd` files.
* `.env` and `./local/*` are gitignored


## user systemd service
create the following file
```
# ~/.config/systemd/user/kanata.service
[Unit]
Description=Kanata keyboard remapper
Documentation=https://github.com/jtroo/kanata

[Service]
#Environment=PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin
Environment=DISPLAY=:0
Environment=HOME=%h
Type=simple
# debug or quiet
# ExecStart=/usr/bin/kanata --cfg %h/.config/kanata/local/kanata.kbd
ExecStart=/usr/bin/kanata --cfg %h/.config/kanata/local/kanata.kbd --quiet
Restart=no

[Install]
WantedBy=default.target
```

# Usage

```
# start/stop/restart/status
systemctl --user start kanata
# wait a few seconds for kanata to load before typing, to avoid stucked keys
```
