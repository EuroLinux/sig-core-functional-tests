#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>
# Note: This was a known issue with CentOS 6.0 GA kernel

t_Log "Running $0 -  check CentOS' Kernel Module GPG key."

uname_arch=$(uname -m)
uname_kernel=$(uname -r)
uname_kernel=${uname_kernel:0:6}


if [ "$uname_arch" == "aarch64" ] || [ "$uname_arch" == "armv7l" ] || [ "$uname_arch" == "i686" ]; then
  t_Log "*** Not testing on Arch: $uname_arch ***"
  exit 0
fi
echo "TODO FIX THIS TEST ON EL8"
