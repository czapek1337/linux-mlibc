# linux-mlibc

Attempt at making a mlibc-based Linux distribution.

# Requirements

- A working C/C++ toolchain (preferably GNU)
- meson
- xbstrap

# Build instructions

- Create a system root directory and cd into it
- `xbstrap init ..` - substitute `..` with an absoltue path if your system root isn't in the source tree
- `xbstrap install base-files` to create the base file system layout
- `xbstrap install -u --all` to build everything (the cross toolchain and ports like bash or coreutils)
- Run the `misc/util.sh` script passing it the system root path and one of the available commands
