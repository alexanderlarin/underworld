#!/bin/sh
# Launch Underworld on systems with xterm.

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

if command_exists uxterm
then
    XTERM=uxterm
elif command_exists xterm
then
    XTERM=xterm
else
    show_error "Could not find neither xterm nor uxterm\nInstall xterm to resolve this problem"
fi

if [ $# -eq 0 ]
then
	ARGS="-story /usr/share/games/underworld/story"
else
	ARGS=$*
fi

exec $XTERM -T "Underworld" -fa 'Monospace' -fs 16 -geometry 80x26 -e /usr/games/underworld-bin $ARGS
