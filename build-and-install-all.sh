#!/bin/sh

PREFIX=$1
BASEPIXELSIZE=${2:-16}

if [ -z "$PREFIX" ]; then
    echo "Please supply the prefix where st should be installed"
    exit 1
fi

if [ "$BASEPIXELSIZE" != "" ]; then
    HIDPIPIXELSIZE=$(( $(( $BASEPIXELSIZE - 4 )) * 2 ))
fi

echo "Base pixel size: $BASEPIXELSIZE"
echo "HIDPI pixel size: $HIDPIPIXELSIZE"
echo "Ok? (y/n)"

read answer

if ! echo "$answer" | grep -E '^y.*' 2>&1 > /dev/null; then
    echo "ok then, bye"
    exit 1
fi

PIXELSIZE=$BASEPIXELSIZE COLORS=dark ./p && make && cp st $PREFIX/bin/st
PIXELSIZE=$BASEPIXELSIZE COLORS=light ./p && make && cp st $PREFIX/bin/st-light

PIXELSIZE=$HIDPIPIXELSIZE COLORS=dark ./p && make && cp st $PREFIX/bin/st-hidpi
PIXELSIZE=$HIDPIPIXELSIZE COLORS=light ./p && make && cp st $PREFIX/bin/st-hidpi-light
