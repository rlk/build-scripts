#!/bin/bash

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

# Linux package systems tend to provide the broadest possible feature support,
# so they often incur a great many dependencies. SDL supports a huge number of
# platforms, so most binary distributions of libsdl pull in an extensive net of
# dynamic libraries. The result is difficult to distribute. I prefer a minimal
# build, so despite the ubiquity of SDL packages I often build from source.

if [[ $IS_LINUX ]]; then
    ./configure --disable-alsa \
                --disable-esd \
                --disable-nas \
                --disable-pulseaudio \
                --disable-video-directfb \
                --prefix=$PREFIX \
        && make \
        && make install
fi

# SDL enables X11 support by default under OS X, which is increasingly useless
# these days. I've also had trouble with SDL's assembly code, so I opt out.

if [[ $IS_MACOS ]]; then
    ./configure --disable-video-x11 \
                --disable-assembly \
                --prefix=$PREFIX \
        && make \
        && make install
fi

# Ironically, MinGW's SDL build has no quirks.

if [[ $IS_MINGW ]]; then
    ./configure --prefix=$PREFIX \
        && make \
        && make install
fi
