#!/bin/bash

ACTIVE_USER=$(loginctl list-users --no-legend | cut -d' ' -f2 -z | tr -d '\000')

echo Active user: $ACTIVE_USER

cp -rf /usr/etc/finish-setup/config/* /home/$ACTIVE_USER/.config

chown -R $ACTIVE_USER:$ACTIVE_USER ~/.config/

bash <(curl -s https://raw.githubusercontent.com/blue-build/cli/main/install.sh)

su $ACTIVE_USER -c "curl https://nim-lang.org/choosenim/init.sh -sSf | sh"

echo export PATH=/var/home/david/.nimble/bin:$PATH >> /home/$ACTIVE_USER/.profile
