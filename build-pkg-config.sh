#!/bin/bash

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

# pkg-config usually requires GLIB, which requires pkg-config. Conjure a chicken
# to lay you an egg like so.

./configure --with-internal-glib \
            --prefix=$PREFIX \
    && make \
    && make install
