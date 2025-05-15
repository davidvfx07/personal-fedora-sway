#!/bin/bash

CURRENT_WORKSPACE=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true).name')
APP_ID=$1
COMMAND=${@:2}

if [ -z $APP_ID ] || [ ${#COMMAND[@]} -eq 0 ]; then
  echo "Usage: floating_util.sh <app_id> <command>"
  exit
fi


while true; do
  swaymsg \[app_id=$APP_ID\] move container to workspace $CURRENT_WORKSPACE
  if [ $? -eq 2 ]; then
    swayrun $COMMAND
    swaymsg \[app_id=$APP_ID\] move container to workspace _, floating on
  else
    swaymsg \[app_id=yazi_float con_id=__focused__\] floating on
    if [ $? -ne 2 ]; then
      swaymsg \[app_id=$APP_ID\] move container to workspace _
    else
      swaymsg focus mode_toggle
    fi
    break
  fi
done
