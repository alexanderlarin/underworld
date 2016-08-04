#!/bin/sh

VERSION=1.0
CUR=$(dirname $(readlink -f -- $0))

PAS_FILES=$(ls -1 $CUR/../../*.pas | xargs -n 1 basename)
FILES="$PAS_FILES underworld.png story ncurses underworld.6 underworld.ru.6"
FREEDESKTOP_FILES="underworld.desktop underworld-xterm.sh"

ORIG_ARCHIVE="$CUR/SOURCES/underworld-$VERSION.tar.gz"

tar czf "$ORIG_ARCHIVE" --exclude='*.ppu' --exclude='*.o' --transform="s||underworld-$VERSION/|" -C "$CUR/../.." $FILES -C "$CUR/../freedesktop" $FREEDESKTOP_FILES
