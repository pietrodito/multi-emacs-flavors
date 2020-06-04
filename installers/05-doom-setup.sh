#!/bin/bash

mefs_indent_message "Doom setup..."

mefs_FLAVORDOOM=$mefs_FLAVORDIR/doom

if [ ! -d $mefs_FLAVORDOOM ]
then
 git clone https://github.com/hlissner/doom-emacs $mefs_FLAVORDOOM

 export DOOMDIR=$mefs_CONFIGDIR/doom

 cd $mefs_FLAVORDOOM
 ./bin/doom install

fi
