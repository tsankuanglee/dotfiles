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
mkdir -p ./local/{common,layouts,scripts,user_defined}

# {{{ service files
# linux systemd service files
mkdir -p ~/.config/systemd/user
envsubst '$KANATA_BIND_ADDRESS,$KANATA_BIND_PORT' < ./general/system_files/kanata.service.tmpl > ~/.config/systemd/user/kanata.service
# macos daemon file
#envsubst '$KANATA_USER,$KANATA_CONFIG_HOME' < ./general/system_files/Library/LaunchDaemons/com.kanata.daemon.plist.tmpl > ./local/com.kanata.daemon.plist
# }}}  service files
#
# {{{ kanata app files

#  {{{ common
envsubst '$LINUX_DEV,$DANGER_ENABLE_CMD' < ./general/common/defcfg.kbd.tmpl > ./local/common/defcfg.kbd
envsubst '$KANATA_CONFIG_HOME,$KANATA_USER' < ./general/common/deftemplates.kbd.tmpl > ./local/common/deftemplates.kbd
#  }}} common

#  {{{ layouts
rsync -at ./general/layouts/${LAYOUTS_FILENAME} ./local/layouts/
#  }}} layouts

#  {{{ scripts
# layer toggle (default <-> passthrough) script; to effectively disable kanata before screen lock (so no hotkeys can keep launching new process)
envsubst '$KANATA_BIND_ADDRESS,$KANATA_BIND_PORT' < ./general/scripts/kanata-toggle.sh.tmpl > ./local/scripts/kanata-toggle.sh
# macos service launcher
envsubst '$KANATA_CONFIG_HOME' < ./general/scripts/macos-service.sh.tmpl > ./local/scripts/macos-service.sh
# macos app launcher
envsubst '$KANATA_USER' < ./general/scripts/macos-app-launcher.sh.tmpl > ./local/scripts/kanata-app-launcher.sh

chmod a+x ./local/scripts/*.sh
#  }}} scripts

#  {{{ user_defined
rsync -at ./general/user_defined/ ./local/user_defined/
#  }}} user_defined

#  {{{ main config
envsubst '$LAYOUTS_FILENAME,$INCLUDE_SEQUENCES,$INCLUDE_MACROS,$INCLUDE_CHORDS' < ./general/kanata.kbd.tmpl > ./local/kanata.kbd
#  }}} main config

# }}} kanata app files

