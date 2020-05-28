#!/bin/bash

mefs_indent_message "Directory tree creation..."

mkdir -p $mefs_EMACSDIR/sources
mkdir -p $mefs_EMACSDIR/flavors/
ln -sf $mefs_THISREPODIR/configs $mefs_EMACSDIR/
ln -sf $mefs_THISREPODIR/layers $mefs_EMACSDIR/

