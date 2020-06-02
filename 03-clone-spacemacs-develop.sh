#!/bin/bash

mefs_indent_message "Cloning spacemacs repo..."

[ -d $mefs_FLAVORDIR/spacemacs-develop ] ||
    git clone https://github.com/syl20bnr/spacemacs $mefs_FLAVORDIR/spacemacs-develop

cd $mefs_FLAVORDIR/spacemacs-develop
git checkout develop
git pull origin

emacs --with-profile develop -nw
