#!/bin/bash
source /home/ulys/emacs/installers/../installers/source-to-export-vars.sh

mefs_CONFIGS=($(ls -AF $mefs_CONFIGDIR | grep /))

if [ $# -eq 0  ]
then
    COUNTER=0
    for conf in "${mefs_CONFIGS[@]}"
    do
        let COUNTER++
        echo "$COUNTER $conf"
    done

    mefs_indent_message "Choose a config:"

    read -p "" choice
    let choice--
else
    choice=$1
    let choice--
    mefs_message "Launching ${mefs_CONFIGS[choice]} ?"
    read -p "YES/no: " yn
    echo    # (optional) move to a new line
    if [[ $yn =~ ^[Nn]$  ]]
    then
            exit 1
    fi
fi

mefs_indent_message "Launching ${mefs_CONFIGS[choice]}"
emacs --with-profile ${mefs_CONFIGS[choice]} 2> /dev/null
