#!/bin/bash

swaymsg workspace _
swayrun foot

swaymsg workspace 1
swaymsg "[workspace=1] kill"
swayrun foot
swayrun -h firefox
swaymsg resize grow width 750px

sleep .5
swaymsg workspace 2
swaymsg "[workspace=2] kill"
swayrun firefox --new-window https://gmail.com
swayrun -h firefox --new-window https://web.whatsapp.com

swaymsg workspace 1
