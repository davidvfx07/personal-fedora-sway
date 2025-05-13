#!/bin/bash

cp -r /usr/etc/finish-setup/config/* ~/.config

curl https://nim-lang.org/choosenim/init.sh -sSf | sh

mkdir ~/.local/bin || true
ln -s /var/lib/flatpak/exports/bin/org.mozilla.firefox ~/.local/bin/firefox || true
ln -S /var/lib/flatpak/exports/bin/org.chromium.Chromium ~/.local/bin/chromium || true
ln -s /var/lib/flatpak/exports/bin/com.usebottles.bottles ~/.local/bin/bottles || true
