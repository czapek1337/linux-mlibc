# linux-mlibc

Attempt at creating an [mlibc](https://github.com/managarm/mlibc)-based Linux distribution. Currently
it runs GNU bash, GNU coreutils, vim and others.

## Requirements

- A working C/C++ toolchain (preferably GNU)
- meson
- xbstrap

## Build instructions

Command prefixed with `$` should be ran as a regular user, whereas `#` indicates that a command should
be ran as root (whether it be through switching users, `sudo`, `doas`, or whatever else you prefer).

```shell
$ mkdir sysroot # Create a system root directory
$ cd sysroot # Move into the system root directory
$ xbstrap init .. # Point xbstrap at the source directory containing bootstrap.yml
$ xbstrap install -u --all # Build everything, this includes the cross toolchain and ports

$ cd .. # Move back into the source directory
# misc/util.sh sysroot chroot # This command will mount everything that's required and put you in a chroot
```

## Contributions

Contributions are absolutely welcome and encouraged! Please submit your patches through a pull request
and we'll sort everything out from there :^) Also feel free to use the issues tab to discuss anything
you would like, as long as it is project related.
