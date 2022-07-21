#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - LSB EuroLinux braning check."

uname_arch=$(uname -m)

if [ "$uname_arch" == "armv7l" ]; then
  t_Log "*** Not testing on Arch: $uname_arch ***"
  exit 0
fi

if (t_GetPkgRel basesystem | grep -q el9)
then
  t_Log "This is a EuroLinux 9 system. redhat-lsb not present. Skipping."
  t_CheckExitStatus 0
  exit $PASS
fi


lsb_release -i | grep -q "EuroLinux" && \
lsb_release -d | grep -q "EuroLinux"

t_CheckExitStatus $?
