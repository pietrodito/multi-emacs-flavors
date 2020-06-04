#!/bin/bash

LINETOINSERT="source $mefs_THISREPODIR/installers/source-to-set-variables.sh"

cp -f ${mefs_THISREPODIR}/tools/helpers/*.sh ${mefs_THISREPODIR}/tools/

FILES=($(ls ${mefs_THISREPODIR}/tools/*.sh))

for FILE in "${FILES[@]}"
do
    echo $FILE
    sed  -i "/bin\/bash/a  $LINETOINSERT" $FILE
done
