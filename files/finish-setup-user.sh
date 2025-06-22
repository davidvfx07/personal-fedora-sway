#!/bin/bash

cp -r --update=none /usr/etc/finish-setup/home/* ~/ || true

curl https://nim-lang.org/choosenim/init.sh -sSf | sh
cargo install ripdrag

mkdir ~/.local/bin || true
ln -s /var/lib/flatpak/exports/bin/org.mozilla.firefox ~/.local/bin/firefox || true
ln -s /var/lib/flatpak/exports/bin/org.chromium.Chromium ~/.local/bin/chromium || true
ln -s /var/lib/flatpak/exports/bin/com.usebottles.bottles ~/.local/bin/bottles || true
