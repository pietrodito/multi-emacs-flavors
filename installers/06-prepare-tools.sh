#!/bin/bash

mefs_indent_message "Preparing tools (directory-agnostic)..."

LINETOINSERT="source $mefs_THISREPODIR/installers/source-to-export-vars.sh"

cp -f ${mefs_THISREPODIR}/tools/helpers/*.sh ${mefs_THISREPODIR}/tools/

FILES=($(ls ${mefs_THISREPODIR}/tools/*.sh))

for FILE in "${FILES[@]}"
do
    echo $FILE
    sed  -i "/bin\/bash/a  $LINETOINSERT" $FILE
done
