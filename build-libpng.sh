#!/bin/sh

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

# PNG is uniform across all platforms.

./configure --prefix=$PREFIX \
    && make \
    && make install
