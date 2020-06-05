#!/bin/bash
source /home/ulys/emacs/installers/../installers/source-to-export-vars.sh

sudo rm -r ${mefs_CONFIGDIR}/${1}
sudo rm -r ${mefs_FLAVORDIR}/${1}
