#!/bin/bash

echo Recieved home dir: $1

cp -rf /usr/etc/finish-setup/config/* $1/.config

bash <(curl -s https://raw.githubusercontent.com/blue-build/cli/main/install.sh)