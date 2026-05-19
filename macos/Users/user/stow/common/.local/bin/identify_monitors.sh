#!/bin/bash
cd "$(dirname "$(realpath "$0")")";

SCREEN_JSON_FILE=/tmp/screen_ids.json
./identify_monitors.py > ${SCREEN_JSON_FILE}

