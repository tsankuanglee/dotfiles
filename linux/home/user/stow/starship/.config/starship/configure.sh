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
envsubst '$HOSTNAME_COLOR' < ./starship.toml.tmpl > ../starship.toml

