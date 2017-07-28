# 3DS-Portlibs

This is a fork of [devkitPro/3ds_portlibs](https://github.com/devkitPro/3ds_portlibs),
mainly for use in [ahoischen/3ds-dev-docker](https://github.com/ahoischen/3ds-dev-docker).
The main difference is the use of submodules instead of tarred sources were possible and
the inclusion of a `tar-source` command. All changes which seem useful to
regular users will be submitted as Pull Requests to the original repo.

## Usage

This project consists mainly of a Makefile to download and compile different
libraries. First, clonse this project via git. You don't have to use
`--recursive`; submodules are downloaded as needed.

After that you have access to a makefile which supports the following targets:

- `download`: Downloads the sources for all libraries.
- `tar-source`: Creates the file sources.tar which contains all sources.
- `zlib`: Compiles zlib. Compile and install this first since many portlibs 
  depend on it.
- `install-zlib`: Installs `zlib`.
- `install`: Installs any other portlib. This might require sudo or admin
  privileges to work if you don't have write access to `$DEVKITPRO`. 

The following targets are regular portlibs:

- `bzip2`
- `freetype`
- `giflib`
- `jansson`
- `libconfig`
- `libexif`
- `libjpeg-turbo`
- `libmad`
- `libogg`
- `libpng`
- `libxmp-lite`
- `mbedtls`
- `tinyxml2`
- `tremor` (Either doesn't compile or won't install)
- `xz`

### Example

```Bash
make zlib
make install-zlib
make jansson
make libconfig
make install
```

## Acknowledgements & Licenses

This work is based on work by the devkitPro team and all other
contributors to the project.

The license of each included library is retained in its submodule or tarball.
Look there for the exact license text. All included works are without warranty
unless otherwise stated. This project is not associated with any mentioned
libraries unless otherwise stated.

### Bzip2

Bzip2 is copyright (C) 1996-2010 Julian R. Seward and provided without
warranty.

### Freetype

Portions of this software are copyright © 1996-2002, 2006 The FreeType
Project (www.freetype.org).  All rights reserved.

### Giflib

Giflib is copyright (c) 1997  Eric S. Raymond.

### Jansson

Jansson is copyright (c) 2009-2016 Petri Lehtinen <petri@digip.org>

### Libconfig

Libconfig was made by the following people:

- Mark Lindner - Lead developer & maintainer.
- Daniel Marjamäki - Enhancements & bugfixes.
- Andrew Tytula - Windows port.
- Glenn Herteg - Enhancements, bugfixes, documentation corrections.
- Matt Renaud - Enhancements & bugfixes.

### Libexif

Libexif was made by the following people:

- Lutz Mueller <urc8@rz.uni-karlsruhe.de>
- Jan Patera <patera@users.sourceforge.net>
- Hans Ulrich Niedermann <gp@n-dimensional.de>
- Hubert Figuiere <hub@figuiere.net>

### Libjpeg-turbo

This software is based in part on the work of the Independent JPEG
Group.

### Libmad

Libmad is Copyright (C) 2000-2004 Underbit Technologies, Inc. It is modified
by the included libmad-0.15.1b.patch file on compilation. Please see that
file's header for additional information.

### Libogg

Libogg was created by:

- Monty <monty@xiph.org>
- Greg Maxwell <greg@xiph.org>
- Ralph Giles <giles@xiph.org>
- Cristian Adam <cristian.adam@gmail.com>
- Tim Terriberry <tterribe@xiph.org>

and the rest of the Xiph.Org Foundation.

### Libpng

Libpng was created by a large number of people, please see the included LICENSE
file.

### Libxmp-lite

Libxmp=lite is copyright (C) 1996-2014 Claudio Matsuoka and Hipolito Carraro Jr.

### Mbedtls

Mbedtls is copyright 2008-2016 ARM Limited. It is modified by the included
libmbedtls-2.5.1.patch file. Please see that file's header for additional 
information.

### Tinyxml2

Tinyxml2 is created by many different people. Please see that project's
contributors either on github or in the included submodule.

### Tremor

Tremor is copyright (C) 2002, Xiph.org Foundation.

### xz

Most parts of xz are in the public domain. Please see the included AUTHORS and
THANKS files for a list of contrbutors.

### zlib

Zlib is copyright (C) 1995-2013 Jean-loup Gailly and Mark Adler.