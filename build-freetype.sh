#!/bin/sh

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

# Freetype pulls in bzip2 under OS X which incurs an unnecessary dependency on
# that and only that platform.

if [[ $IS_MACOS ]]; then
    ./configure --without-bzip2 \
                --prefix=$PREFIX \
        && make \
        && make install
else
    ./configure --prefix=$PREFIX \
        && make \
        && make install
fi
