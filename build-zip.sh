#!/bin/bash

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

if [[ $IS_MINGW ]]; then

    # Info-ZIP's MinGW build has no installer.

    make -f win32/Makefile.gcc && \
    cp *.exe $PREFIX/bin
else

    # Info-ZIP's Unix build uses a make-based build with a hardcoded prefix.

    sed -e "s|/usr/local|$PREFIX|" \
        < unix/Makefile \
        > unix/Makefile.edited && \
    make -f unix/Makefile.edited generic && \
    make -f unix/Makefile.edited install
fi
