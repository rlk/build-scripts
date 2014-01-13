#!/bin/bash

# INSTALL_PREFIX gives the destination to which INSTALL.sh will copy staged
# package contents.

if [[ $IS_MINGW ]]; then
    export INSTALL_PREFIX=C:/MinGW
else
    export INSTALL_PREFIX=/usr/local
fi

# PREFIX gives the location passed to a build system for installation, usually
# `configure --prefix`.

export PREFIX=$INSTALL_PREFIX
#export PREFIX=$PWD/dst

# Let make take advantage of multiple processor cores. Some versions of MinGW
# seem to deadlock instead.

export MAKEFLAGS="-j4"

# Select the optimization level, debug mode, etc.

export CFLAGS="-O2"

# Set flags to indicate operating system.

if [ $(uname -s) == "Linux" ]; then
    export IS_LINUX=1
fi
if [ $(uname -s) == "Darwin" ]; then
    export IS_MACOS=1
fi
if [ $(uname -s) == "MINGW32_NT-6.1" ]; then
    export IS_MINGW=1
fi

