#!/bin/sh

source CONFIG.sh

cp -r $PREFIX/bin/*     $INSTALL_PREFIX/bin
cp -r $PREFIX/lib/*     $INSTALL_PREFIX/lib
cp -r $PREFIX/share/*   $INSTALL_PREFIX/share
cp -r $PREFIX/include/* $INSTALL_PREFIX/include
