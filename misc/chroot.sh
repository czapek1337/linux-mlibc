#!/usr/bin/bash
# Adapted from LFS (https://www.linuxfromscratch.org/lfs/view/stable/chapter07/kernfs.html)

# Exit if not running as root.
if [ "$EUID" != 0 ]; then
  echo "This script needs to be ran as root."
  exit 1
fi

# Make sure there is a single argument passsed
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 [system-root]"
  exit 1
fi

# Extract the argument to a variable
ROOT=$(realpath $1)/system-root

# A dirty way to make sure this isn't going to mount everything TWICE
# which from my experience resulted in everything crashing on the host :^)
#
# Since we create /dev/console and /dev/null manually, /dev/zero should NOT
# be there and this should work as a dumb check
if [ ! -e "$ROOT/dev/zero" ]; then
  # Create the initial directory structure
  mkdir -pv $ROOT/{dev,proc,sys,run}

  # Create initial device nodes
  mknod -m 600 $ROOT/dev/console c 5 1
  mknod -m 666 $ROOT/dev/null c 1 3

  # Mount /dev and other virtual kernel file systems
  mount -v --bind /dev $ROOT/dev
  mount -v --bind /dev/pts $ROOT/dev/pts
  mount -vt proc proc $ROOT/proc
  mount -vt sysfs sysfs $ROOT/sys
  mount -vt tmpfs tmpfs $ROOT/run

  # In some host systems /dev/shm is a symbolic link to /run/shm
  if [ -h $ROOT/dev/shm ]; then
    mkdir -pv $ROOT/$(readlink $ROOT/dev/shm)
  fi
fi

# Do the actual chroot :^)
chroot $ROOT /bin/bash
