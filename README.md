Attempt at making a mlibc-based Linux distro.

# Requirements

- a C/C++ toolchain (preferably GNU)
- xbstrap
- meson

# Build instructions

- Create a system root directory and cd into it
- `xbstrap init ..` - substitute `..` with an absoltue path if your system root isn't in the source tree
- `xbstrap install -u --all` to build everything, which currently is just the cross toolchain, mlibc and bash

To test it I have created a small script (`misc/chroot.sh`) that will create all the necessary directories
and mount all virtual kernel file systems like /dev, /sys, /proc in their right places and chroot into your
shiny new mlibc Linux :^) The script takes a single argument, which is the path to the system root directory
you created in the beginning.
