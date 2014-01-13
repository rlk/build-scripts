#!/bin/bash

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

# Disable a few of those ImageMagick features that pull in deep dependency
# trees.

./configure --without-x \
            --without-perl \
            --prefix=$PREFIX \
    && make \
    && make install
