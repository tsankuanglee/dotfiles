#!/usr/bin/bash
cd "$(dirname "$(realpath "$0")")";

# Check if the .env file exists
if [ -f .env ]; then
  set -a # automatically export all variables defined next
  source .env
  set +a
else
  echo "Error: .env file not found!"
  exit 1
fi

# CREATE actual config files from templates
# service file
mkdir -p ~/.config/systemd/user
envsubst '$KANATA_BIND_ADDRESS,$KANATA_BIND_PORT' < ./kanata.service.tmpl > ~/.config/systemd/user/kanata.service

# toggle script
envsubst '$KANATA_BIND_ADDRESS,$KANATA_BIND_PORT' < ./kanata-toggle.sh.tmpl > ./local/kanata-toggle.sh
chmod a+x ./local/kanata-toggle.sh


mkdir -p ./local
envsubst '$LINUX_DEV,$DANGER_ENABLE_CMD' < ./common/defcfg.kbd.tmpl > ./local/defcfg.kbd
envsubst '$LAYOUTS_FILENAME,$INCLUDE_SEQUENCES,$INCLUDE_MACROS,$INCLUDE_CHORDS' < ./kanata.kbd.tmpl > ./local/kanata.kbd

