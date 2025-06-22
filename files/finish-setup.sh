#!/bin/bash

#ACTIVE_USER=$(loginctl list-users --no-legend | cut -d' ' -f2 -z | tr -d '\000')
while [[ ! $(loginctl list-users --no-legend | cut -d' ' -f2 -z | tr -d '\000') ]]; do sleep 1; done
ACTIVE_USER=$(loginctl list-users --no-legend | cut -d' ' -f2 -z | tr -d '\000')

HOME=/home/$ACTIVE_USER

echo Active user: $ACTIVE_USER

#if [ -f "/usr/bin/bluebuild" ]; then
#  echo "bluebuild exists, not installing."
#else
#  bash <(curl -s https://raw.githubusercontent.com/blue-build/cli/main/install.sh)
#fi

echo ENV{DEVNAME}=="/dev/dri/card1", TAG+="mutter-device-preferred-primary" > /etc/udev/rules.d/61-mutter-primary-gpu.rules

rpm-ostree kargs --delete rhgb || true
rpm-ostree kargs --append-if-missing nvidia_drm.modeset=1 --append-if-missing nvidia_drm.fbdev=1 || true

# Enables full GPU access especially in containers.
RENDER_USER=$(grep -E '^render:' /usr/lib/group)
grep -qF -- $RENDER_USER /etc/group || tee -a /etc/group $RENDER_USER
usermod -aG render $ACTIVE_USER

if [ -z "$ACTIVE_USER" ]; then
  su $ACTIVE_USER -c "bash /usr/etc/finish-setup/finish-setup-user.sh"
fi
