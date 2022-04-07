Attempt at making a mlibc-based Linux distro.

# Requirements

- a C/C++ toolchain (preferably GNU)
- xbstrap
- meson

# Build instructions

- Create a system root directory and cd into it
- `xbstrap init ..` - substitute `..` with an absoltue path if your system root isn't in the source tree
- `xbstrap install -u --all` to build everything, which currently is just the cross toolchain, mlibc and bash

To test it you can chroot into the `system-root` directory under the system root directory you created. Make
sure to also mount all stuff like /dev, /proc and so on.

# Currently missing stuff

A lot of stuff. My current goal is implement enough mlibc stuff to be able to run bash :^)

- ttyname
- dup
- ioctl
- setpgid
- tcgetattr
- pselect
