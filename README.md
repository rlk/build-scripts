# Build Scripts

Copyright &copy; 2013&ndash;2014 &mdash; [Robert Kooima](http://kooima.net)

This is a collection of dead-simple shell scripts that configure, build, and install source packages. Despite the near-universal availability of binary packages, there are many good reasons to build from source:

- My Linux distribution has yet to adopt SDL2, TIFF4, or some other big upgrade.
- I'm working on a system where I don't have administrative privilege.
- I need to debug into a dependency.
- Packages don't exist, such as for ODE or Mini-XML under Mac OS X.
- I want to produce a Windows binary using MinGW and no package system exists.
- I require a specific architecture target or optimization level.
- I have trust issues.

 With many packages and multiple platforms, I tend to forget the specifics and quirks needed to build each package under each OS, so these scripts encode this knowledge.

The primary objectives of this collection are simplicity and convenience to me in my work. Most of these scripts simply do `configure` `&&` `make` `&&` `make install` but I can't remember which ones don't, and that's the point. And, yes, I'm tossing away all of the power and flexibility of these packages' build mechanisms by encoding defaults in scripts, but given my specific target platforms and use cases, it serves me.

## Mode of usage

A build script may operate upon its related source tree regardless of that tree's location, and when properly configured, a script can build and install a package directly to its system destination. However I tend to unpack all sources to a local `src` directory and stage the builds to a local `dst` directory using an unprivileged account. Having done this, all of the contents of `dst` may be packaged for easy redistribution, or installed globally with a single privileged command.

## Contents

-	`SOURCES.md` gives a list of URLs to source packages. Far from exhaustive, this list is a record of packages I've successfully used. It facilitates the download of updates.

-   `CONFIG.sh` defines the build configuration, most notably the prefix giving the install destination. This script is sourced by the build scripts.

-	`build-*.sh` performs the build for a specific package. These scripts receive the name of the source directory on the command line. For example:

		./build-SDL2.sh src/SDL2-2.0.0

	Each script's name matches that of the package it builds. Packages are inconsistently named, thus the scripts are inconsistently named.

-	`INSTALL.sh` copies contents of `dst` to its configured global destination.

		sudo ./INSTALL.sh

## Notes

Staging installation to a local directory can corrupt the generation of `pkgconfig` files. To rectify this, the value of `PREFIX` should be substituted wherever it appears in the staged installation. `INSTALL.sh` could and perhaps should do this.

If configured with `-g`, debugging information is written to the generated libraries. If the source trees are allowed to remain in `src` then the debugger will find them.
