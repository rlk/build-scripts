#!/bin/bash

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

# ODE has always been infatuated with its own renderer and demonstrations.
# I don't need these. I do need double precision and the libccd colliders.

./configure --with-drawstuff=None \
            --disable-demos \
            --enable-double-precision \
            --enable-libccd \
            --prefix=$PREFIX \
    && make \
    && make install
