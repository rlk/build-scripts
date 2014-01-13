#!/bin/bash

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

# LibTIFF's JPEG support generates conflicts over TRUE and FALSE. Most users
# would expect to store JPEG data in a JPEG file, so we can skip that feature.

./configure --disable-jpeg \
            --prefix=$PREFIX \
    && make \
    && make install
