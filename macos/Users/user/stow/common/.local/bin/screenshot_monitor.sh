#!/bin/bash
#cd "$(dirname "$(realpath "$0")")";

TAG=$2
SCREEN_ID=$1

# if SCREEN_ID is not a digit, look it up to get a digit
SCREEN_JSON_FILE=/tmp/screen_ids.json
re='^[0-9]+$'
if ! [[ $SCREEN_ID =~ $re ]] ; then
    # not a digit
    # look up the digit
    if ! [[ -f "${SCREEN_JSON_FILE}" ]]; then
        ~/.local/bin/identify_monitors.py > "${SCREEN_JSON_FILE}"
    fi
    SCREEN_ID=$(jq ".[\"${SCREEN_ID}\"]" "${SCREEN_JSON_FILE}")
fi

DATESTMP=`/opt/homebrew/opt/coreutils/libexec/gnubin/date +"%Y%m%d"`
OUTPUT_DIRECTORY=~/Desktop/screenshots/${DATESTMP}
mkdir -p "${OUTPUT_DIRECTORY}"
TIMESTAMP=`/opt/homebrew/opt/coreutils/libexec/gnubin/date +"%Y%m%d-%H%M%S.%3N"`
FILENAME=${OUTPUT_DIRECTORY}/screenshot-${TIMESTAMP}-${TAG}.png

screencapture -D "${SCREEN_ID}" "${FILENAME}"
