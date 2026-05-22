# overview

[Kanata](https://github.com/jtroo/kanata) is a cross-platform keyboard remapper.

I primarily use it across different machines. On some of which I already have QMK keyboards, so for those I use Kanata for hotkey sequence triggers. For laptops without a QMK keybaord, I do use Kanata's layer features. I tried to minimize the difference across machines, so some layout arrangements may look weird.

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

## MacOS
MacOS's security model requires Kanata to run as root, which ironically raises the security concern because we really don't want such process to spawn superuser processes. Currently we use sudo to run sub-processes as a regular user.
### sudo and put it in the background

The easist way to do this is just do this under tmux, so we can tuck it away:
```
sudo `which kanata` --cfg CFG_FILEPATH --quiet
# or
#sudo `which kanata` --cfg CFG_FILEPATH --debug
```

### Daemon by plist file

Running as a system service is an overwkill, and we still encounter various permission problems relating to, say, screenshot or file creation. Anyway, here's how to do it:

After running `./configure.sh`, it'll produce `./local/com.kanata.daemon.plist`. As root, copy it to `/Library/LaunchDaemons/com.kanata.daemon.plist`
```
sudo launchctl load -w com.kanta.daemon.plist
```

