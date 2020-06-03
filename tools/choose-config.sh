#!/bin/bash

. ~/emacs/multi-emacs-flavors/source-to-export-vars.sh

mefs_CONFIGS=($(ls -A $mefs_CONFIGDIR))

COUNTER=0
for conf in "${mefs_CONFIGS[@]}"
do
    let COUNTER++
    echo "$COUNTER $conf"
done

mefs_indent_message "Choose a config:"

read -p "" choice
let choice--

mefs_indent_message "Launching ${mefs_CONFIGS[choice]}"
emacs --with-profile ${mefs_CONFIGS[choice]} 2> /dev/null
