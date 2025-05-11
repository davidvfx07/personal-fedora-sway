#!/bin/bash

cp -rf /usr/etc/finish-setup/config/* ~/.config

bash <(curl -s https://raw.githubusercontent.com/blue-build/cli/main/install.sh)