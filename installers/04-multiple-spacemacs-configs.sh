#!/bin/bash

mefs_indent_message "Multiple spacemacs..."

mefs_BEG_PATTERN="SPACEMACS MULTIPLE CONFIGURATIONS STARTS HERE"
mefs_END_PATTERN="SPACEMACS MULTIPLE CONFIGURATIONS ENDS HERE"
mefs_TEMPLATE1='("<conf>" . ((user-emacs-directory . "~/emacs/flavors/<conf>")'
mefs_TEMPLATE2='(env . (("SPACEMACSDIR" . "~/emacs/configs/<conf>")))))'

sed -i "/$mefs_BEG_PATTERN/,/$mefs_END/{/;;/!d}" "$mefs_CONFIGDIR/dot.emacs-profiles.el"

mefs_CONFIGS=$(ls $mefs_CONFIGDIR | grep spacemacs)

for conf in $mefs_CONFIGS
do
    mefs_message "Adding emacs profile for $conf..."
    [ -d ${mefs_FLAVORDIR}/${conf} ] ||
        cp -r $mefs_FLAVORDIR/spacemacs-develop ${mefs_FLAVORDIR}/${conf}

    sed -i "/$mefs_BEG_PATTERN/a ${mefs_TEMPLATE2//<conf>/$conf}" "$mefs_THISREPODIR/dot.emacs-profiles.el"
    sed -i "/$mefs_BEG_PATTERN/a ${mefs_TEMPLATE1//<conf>/$conf}" "$mefs_THISREPODIR/dot.emacs-profiles.el"
done
