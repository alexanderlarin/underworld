#!/bin/sh
# Launch Underworld on systems with xterm.

THISEXE=$(readlink -f -- $0)
THISPATH=$(dirname $THISEXE)
cd $THISPATH

command_exists()
{
    command -v $1 >/dev/null 2>&1
}

show_error()
{
    if command_exists zenity
    then
        zenity --error --text="$1"
    elif command_exists kdialog
    then
        kdialog --error "$1"
    else
        echo -e $1 1>&2
    fi
    exit 1
}

if [ -f ./underworld ]
then
    if [ ! -x ./underworld ]
    then
        show_error "No permissions to run $THISPATH/underworld"
    fi
else
    show_error "No $THISPATH/underworld file found"
fi

if command_exists uxterm
then
    XTERM=uxterm
elif command_exists xterm
then
    XTERM=xterm
else
    show_error "Could not find neither xterm nor uxterm\nInstall xterm to resolve this problem"
fi

DESKTOPFILE="$THISPATH/underworld.desktop"

if [ ! -f $THISPATH/underworld.desktop ]
then
    echo "Creating shorcut at $DESKTOPFILE"
    cat <<EOF > "$DESKTOPFILE"
[Desktop Entry]
Type=Application
Exec=$THISEXE
Name=Underworld
Name[ru_RU]=Дно
Comment=Class project for sweety students
Categories=Game;
Icon=$THISPATH/underworld.xpm
Version=1.0
EOF

    chmod -f +x $DESKTOPFILE
fi

exec $XTERM -T "Underworld" -fa 'Monospace' -fs 16 -geometry 80x26 -e ./underworld
