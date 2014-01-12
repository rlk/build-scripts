#!/bin/sh

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

if [[ $IS_MINGW ]]; then
    make && mkdir -p $PREFIX/bin && cp xxd.exe $PREFIX/bin
else
    make && mkdir -p $PREFIX/bin && cp xxd $PREFIX/bin
fi
