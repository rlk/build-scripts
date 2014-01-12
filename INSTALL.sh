#!/bin/sh

source CONFIG.sh

if [ -d "$PREFIX/bin" ]; then
	cp -R $PREFIX/bin/* $INSTALL_PREFIX/bin
fi
if [ -d "$PREFIX/lib" ]; then
	cp -R $PREFIX/lib/* $INSTALL_PREFIX/lib
fi
if [ -d "$PREFIX/share" ]; then
	cp -R $PREFIX/share/* $INSTALL_PREFIX/share
fi
if [ -d "$PREFIX/include" ]; then
	cp -R $PREFIX/include/* $INSTALL_PREFIX/include
fi
