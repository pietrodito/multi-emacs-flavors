#!/bin/bash
source /home/ulys/emacs/installers/../installers/source-to-export-vars.sh

sudo rm -rf "$mefs_FLAVORDIR/$2/"
sudo rm -rf "$mefs_CONFIGDIR/$2/"

cp -r  "$mefs_FLAVORDIR/$1/"  "$mefs_FLAVORDIR/$2/"
cp -r  "$mefs_CONFIGDIR/$1/"  "$mefs_CONFIGDIR/$2/"

${mefs_THISREPODIR}/installers/04-multiple-spacemacs-configs.sh

