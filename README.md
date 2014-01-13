# Build Scripts

Copyright &copy; 2013&ndash;2014 &mdash; [Robert Kooima](http://kooima.net)

This is a collection of dead-simple shell scripts that configure, build, and install source packages. Despite the near-universal availability of binary packages, there are many good reasons to build from source:

- Maybe I need to debug into a dependency.
- Maybe my Linux distribution has yet to adopt SDL2, TIFF4, or some other big upgrade.
- Maybe I need a package on a system where I don't have administrative privilege.
- Maybe I want to minimize my project's dependency tree for distribution.
- Maybe a binary package doesn't exist.
- Maybe I'm using MinGW under Windows, which is minimal, as advertised.
- Maybe I require a specific architecture target or optimization level.
- Maybe I have trust issues.

With many packages and multiple platforms, I tend to forget the specifics and quirks needed to build each package under each OS, so these scripts encode this knowledge.

The primary objectives of this collection are simplicity and convenience to me in my work. Most of these scripts simply do `configure` `&&` `make` `&&` `make install` but I can't remember which ones don't, and that's the point. Yes, I'm tossing away all of the power and flexibility of these packages' build mechanisms by encoding defaults in scripts, but given my specific target platforms and use cases, it serves me.

## Mode of usage

A build script may operate upon its related source tree regardless of that tree's location, and with the right `PREFIX` in `CONFIG.sh`, a script can build and install a package directly to its system destination. However I tend to unpack all sources to a local `src` directory and stage the builds to a local `dst` directory using an unprivileged account. Having done this, all of the contents of `dst` may be packaged for easy redistribution, or installed globally with a single privileged invocation of `INSTALL.sh`.

## Contents

-   `build-*.sh` performs the build for a specific package. These scripts receive the name of the source directory on the command line. For example:

        ./build-SDL2.sh src/SDL2-2.0.0

    Each script's name matches that of the package it builds. Packages are inconsistently named, so the scripts are inconsistently named.

-   `CONFIG.sh` defines the build configuration, most notably the prefix giving the install destination. This script is sourced by the build scripts.

-   `INSTALL.sh` copies the contents of `dst` to its configured global destination.

        sudo ./INSTALL.sh

-   `SOURCES.md` gives a list of URLs to source packages. Far from exhaustive, this list is a record of packages I've successfully used. It facilitates the download of updates.

## Notes

- Some packages depend upon others, and a build might not be able to find dependencies that have been staged to a local directory. One could either modify the dependent build to scan the staging directry, or simply perform a global installation of the dependency before the dependent build. The latter is easier. For example, `libpng` depends upon `zlib`. On a bare system, run `build-zlib` followed by `INSTALL.sh` before running `build-libpng`.

- Staging installation to a local directory can corrupt the generation of `pkgconfig` files. To rectify this, the value of `PREFIX` should be substituted wherever it appears in the staged installation. `INSTALL.sh` could and perhaps should do this.

- If configured with `-g`, debugging information is written to the generated libraries. If the source trees are allowed to remain in `src` then the debugger will find them. This is handy.

- Certain package / OS combinations are untested. For example, I've never had a reason to compile autotools from source under MinGW. Likewise, packages do evolve. Please alert me to any broken builds.
