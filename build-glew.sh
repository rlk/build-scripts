#!/bin/bash

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

# The GLEW build has no configure script. It installs to /usr by default, and
# takes its destination from an environment variable. As a single large module,
# the build appears to do nothing for quite a while.

GLEW_DEST=$PREFIX make && \
GLEW_DEST=$PREFIX make install
