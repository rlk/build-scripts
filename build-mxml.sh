#!/bin/sh

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

# The only quirk with MXML is that the default build pulls in pthreads, making
# it incompateble with Windows. I have no real use for threaded XML I/O, so
# I disable it everywhere for consistency.

./configure --disable-threads \
			--prefix=$PREFIX \
    && make \
    && make install

# MXML 2.7 under OS X looked in an obsolete location for docsetutil. This
# caused the documentation to fail to build. 2.8 fixes this.
