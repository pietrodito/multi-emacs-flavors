#!/bin/bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE"  ]; do # resolve $SOURCE until the file is no longer a symlink
    TARGET="$(readlink "$SOURCE")"
    if [[ $TARGET == /*  ]]; then
#        echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
        SOURCE="$TARGET"
    else
        DIR="$( dirname "$SOURCE"  )"
#        echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DIR')"
        SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    fi
done
#echo "SOURCE is '$SOURCE'"
RDIR="$( dirname "$SOURCE"  )"
DIR="$( cd -P "$( dirname "$SOURCE"  )" >/dev/null 2>&1 && pwd  )"
if [ "$DIR" != "$RDIR"  ]; then
#    echo "DIR '$RDIR' resolves to '$DIR'"
echo
fi
#echo "DIR is '$DIR'"
mefs_EXPORTDIR="$DIR"

mefs_indent_message () {
    echo -e "\033[1;32m#-> $1\033[0m"
}

mefs_message () {
    echo -e "$1\033[0m"
}

export mefs_THISREPODIR="$mefs_EXPORTDIR/.."
export mefs_CHEMACSDIR="$mefs_THISREPODIR/chemacs"
export mefs_FLAVORDIR="$mefs_THISREPODIR/flavors"
export mefs_CONFIGDIR="$mefs_THISREPODIR/configs"
export -f mefs_indent_message
export -f mefs_message

