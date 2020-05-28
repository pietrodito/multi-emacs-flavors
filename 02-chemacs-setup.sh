#!/bin/bash

mefs_indent_message "Chemacs setup..."

[ -d $mefs_CHEMACSDIR ] ||
    git clone https://github.com/plexus/chemacs.git $mefs_CHEMACSDIR

$mefs_CHEMACSDIR/install.sh

ln -sf $mefs_THISREPODIR/dot.emacs-profiles.el $HOME/.emacs-profiles.el
