#!/bin/bash

ACTIVE_USER=$(loginctl list-users --no-legend | cut -d' ' -f2 -z | tr -d '\000')

cp -rf /usr/etc/finish-setup/config/* /home/$ACTIVE_USER/.config

bash <(curl -s https://raw.githubusercontent.com/blue-build/cli/main/install.sh)