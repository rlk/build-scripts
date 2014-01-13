#!/bin/bash

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

# zlib's Win32 build does not seem to define a default installation path.
# It must be given explicitly. Autoconf works on Unix-like OSes.

if [[ $IS_MINGW ]]; then
    make -f win32/Makefile.gcc && \
    make -f win32/Makefile.gcc install INCLUDE_PATH=$PREFIX/include \
                                       LIBRARY_PATH=$PREFIX/lib \
                                        BINARY_PATH=$PREFIX/bin
else
    ./configure --prefix=$PREFIX \
        && make \
        && make install
fi
