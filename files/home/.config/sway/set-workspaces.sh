#!/bin/bash

swaymsg workspace _
swaymsg "[workspace=_] kill"
swayrun foot

swaymsg workspace 1
swaymsg "[workspace=1] kill"
swayrun foot yazi-loop
swayrun -v foot
swayrun -ph firefox
swaymsg resize grow width 200px

sleep 1
swaymsg workspace 2
swaymsg "[workspace=2] kill"
swayrun firefox --new-window https://gmail.com
swayrun -h firefox --new-window https://web.whatsapp.com

swaymsg workspace 1
