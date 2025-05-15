#!/bin/bash

INDEX_FILE="/home/$USER/.config/sway/scratchpad_index.tmp"


BLOCKLIST=$@


RAW_LIST=`swaymsg -t get_tree | jq -r '
    .nodes[].nodes[].floating_nodes[] |
    select(.marks==[] and .scratchpad_state!="none") |
    "\(.id),\(.app_id)"
'`

ARRAY=($RAW_LIST)
LEGAL_CON_IDS=()

for x in ${ARRAY[@]}; do
  APP_ID=$(echo $x | cut -d ',' -f 2)
  CON_ID=$(echo $x | cut -d ',' -f 1)
  if ! printf '%s\0' "${BLOCKLIST[@]}" | grep -q -F -x -z -- $APP_ID; then
    LEGAL_CON_IDS+=($CON_ID)
  fi
done

if [ ! -f $INDEX_FILE ]; then
  echo 0 1 > $INDEX_FILE
fi

INDEX_FILE_READ=$(cat $INDEX_FILE)

INDEX=$(echo $INDEX_FILE_READ | cut -d ' ' -f 1)
INDEXES_READ=$(echo $INDEX_FILE_READ | cut -d ' ' -f 2)

INDEXES=${#LEGAL_CON_IDS[@]}

if [ $INDEX -gt $(expr $INDEXES - 1) ]; then
  INDEX=0
fi

swaymsg \[con_id=${LEGAL_CON_IDS[$INDEX]}\] scratchpad show

if [ ! $INDEX -ge $(expr $INDEXES - 1) ]; then
  ((INDEX++))
else
  INDEX=0
fi

echo $INDEX $INDEXES > $INDEX_FILE
