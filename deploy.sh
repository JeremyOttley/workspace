#!/usr/bin/env bash

set -Eeuxo pipefail

IFS=$'\n\t'

trap 'echo Error at about $LINENO' ERR

# Copy all hidden(dotfiles) files
cp -r ./.* ~/

# Put configuration files in place
cp -rivf .config ~/.config/
