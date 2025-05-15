#!/bin/bash

HIDDEN=0
APP_ID=$1
APP_ARGS=${@:2}

RUN_COUNTER=0
while [ $RUN_COUNTER -lt 2 ]; do
  swaymsg \[app_id=$APP_ID\] scratchpad show && (if [ HIDDEN ]; then swaymsg scratchpad show; fi) && exit || swaymsg \[app_id=$APP_ID\] move scratchpad
  if [ $? = 2 ]; then
    ((RUN_COUNTER++))
    swayrun foot -a $APP_ID $APP_ARGS
    ((RUN_COUNTER++))
  else
    ((RUN_COUNTER++))
  fi
done
