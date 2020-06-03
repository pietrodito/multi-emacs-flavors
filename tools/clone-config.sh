#!/bin/bash

CONFIGS="$HOME/emacs/configs"
FLAVORS="$HOME/emacs/flavors"

sudo rm -rf "$FLAVORS/$2/"
sudo rm -rf "$CONFIGS/$2/"

cp -r  "$FLAVORS/$1/"  "$FLAVORS/$2/"
cp -r  "$CONFIGS/$1/"  "$CONFIGS/$2/"

~/emacs/multi-emacs-flavors/04-multiple-spacemacs-configs.sh

