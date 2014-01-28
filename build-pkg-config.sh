#!/bin/bash

source CONFIG.sh

if [ -n "$1" ]; then
    cd $1
fi

# pkg-config requires GLIB. This dependency is *completely* ridiculous. GLIB
# consists of over 100,000 lines of C code, while pkg-config is only 3,000.

# pkg-config reads a couple of text files and spits out one or two of the lines
# that it reads there. It should configure and build in seconds. Instead, it's
# one of the most complex builds in my entire dependency tree. 

# The cherry on top: *GLIB requires pkg-config!* It's a circular dependency.
# Tiny pkg-config provides it's own copy of GLIB to resolve this, inflating
# its distribution 3000%. And that build of GLIB doesn't even work correctly
# under MinGW without explicitly specifying that we're using at least a 486.

# The bulk of the open source world depends upon this horrible design.
# Guys... get your shit together.

CFLAGS=-marchi486 ./configure --with-internal-glib \
				              --prefix=$PREFIX \
    && make \
    && make install
