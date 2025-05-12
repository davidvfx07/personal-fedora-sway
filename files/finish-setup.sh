#!/bin/bash

ACTIVE_USER=$(loginctl list-users --no-legend | cut -d' ' -f2 -z | tr -d '\000')
HOME=/home/$ACTIVE_USER

echo Active user: $ACTIVE_USER

cp -r /usr/etc/finish-setup/config/* $HOME/.config
chown -R $ACTIVE_USER:$ACTIVE_USER $HOME/.config/

if [ -f "/bin/bluebuild" ]; then
  echo "bluebuild exists, not installing."
else
  bash <(curl -s https://raw.githubusercontent.com/blue-build/cli/main/install.sh)
fi

su $ACTIVE_USER -c "curl https://nim-lang.org/choosenim/init.sh -sSf | sh"

rpm-ostree kargs --delete rhgb
rpm-ostree kargs --delete quiet
rpm-ostree kargs --append-if-missing nvidia_drm.modeset=1 --append-if-missing nvidia_drm.fbdev=1 

mkdir $HOME/.local/bin
ln -s /var/lib/flatpak/exports/bin/org.mozilla.firefox $HOME/.local/bin/firefox
ln -S /var/lib/flatpak/exports/bin/org.chromium.Chromium $HOME/.local/bin/chromium
ln -s /var/lib/flatpak/exports/bin/com.usebottles.bottles $HOME/.local/bin/bottles
