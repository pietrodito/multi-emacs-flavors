export mefs_EMACSDIR="$HOME/emacs"

mefs_indent_message () {
    echo -e "\033[1;32m#-> $1\033[0m"
}

mefs_message () {
    echo -e "$1\033[0m"
}

export mefs_THISREPODIR=`pwd`
export mefs_CHEMACSDIR="$mefs_EMACSDIR/chemacs"
export mefs_FLAVORDIR="$mefs_EMACSDIR/flavors"
export mefs_CONFIGDIR="$mefs_EMACSDIR/configs"
export -f mefs_indent_message
export -f mefs_message

