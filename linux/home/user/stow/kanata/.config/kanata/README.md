# Setup

## configuration files

* Copy `.env.tmpl` to `.env` and edit it.
* Run `./configure.sh`, which will produce `./local/*kbd` files and other system files.
* `.env` and `./local/*` are gitignored


## Liuux: user systemd service
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
To start:
```
# start/stop/restart/status/enable/disable
systemctl --user start kanata
# wait a few seconds for kanata to load before typing, to avoid stucked keys
```

## MacOS: setup plist file

After running `./configure.sh`, it'll produce `./local/com.kanata.daemon.plist`. As root, copy it to `/Library/LaunchDaemons/com.kanata.daemon.plist`
```
sudo launchctl load -w com.kanta.daemon.plist
```

