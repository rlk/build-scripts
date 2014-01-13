#!/bin/bash

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

# I use FreeType strictly for rendering TTF and OTF fonts. Other font types
# pull in a number of unnecessary dependencies, which I don't need.

./configure --without-zlib \
            --without-png \
            --without-bzip2 \
            --prefix=$PREFIX \
    && make \
    && make install
