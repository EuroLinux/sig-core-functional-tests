#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>
# Author: Alex Baranowski <ab@euro-linux.com>

t_Log "Running $0 - EuroLinux Anaconda patch is applied test."

uname_arch=$(uname -m)

if [ "$uname_arch" == "aarch64" ] || [ "$uname_arch" == "i686" ] || [ "$uname_arch" == "armv7l" ]; then
  t_Log "*** Not testing on Arch: $uname_arch ***"
  exit 0
fi

ANACONDA_PATH=/usr/lib/anaconda/
ANACONDA_FILE="rhel.py"


grep "EuroLinux" $ANACONDA_PATH/installclasses/$ANACONDA_FILE >/dev/null 2>&1 

t_CheckExitStatus $?
