#!/bin/bash

cp -r --update=none /usr/etc/finish-setup/home/* ~/ || true

cargo install ripdrag

mkdir ~/.local/bin || true
#ln -s /var/lib/flatpak/exports/bin/org.mozilla.firefox ~/.local/bin/firefox || true
#ln -s /var/lib/flatpak/exports/bin/org.chromium.Chromium ~/.local/bin/chromium || true
#ln -s /var/lib/flatpak/exports/bin/com.usebottles.bottles ~/.local/bin/bottles || true


echo "bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char


autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory" >> ~/.zshrc
