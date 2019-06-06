#!/usr/bin/env bash

set -Eeuxo pipefail

IFS=$'\n\t'

trap 'echo Error at about $LINENO' ERR

# Copy all hidden(dotfiles) files
cp -r ./.* ~/

# Put configuration files in place
cp -rivf i3/ ~/.config/i3
cp -rivf gtk-3.0/ ~/.config/gtk-3.0
