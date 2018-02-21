#!/bin/sh

PREFIX=$1
if [ -z "$PREFIX" ]; then
    echo "Please supply the prefix where st should be installed"
    exit 1
fi

COLORS=dark ./p && make && cp st $PREFIX/bin/st
COLORS=light ./p && make && cp st $PREFIX/bin/st-light

HIDPI=y COLORS=dark ./p && make && cp st $PREFIX/bin/st-hidpi
HIDPI=y COLORS=light ./p && make && cp st $PREFIX/bin/st-hidpi-light