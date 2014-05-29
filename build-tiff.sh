#!/bin/bash

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

./configure --prefix=$PREFIX \
    && make \
    && make install
