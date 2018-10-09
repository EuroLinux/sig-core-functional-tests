#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>
# Author: Alex Baranowski <ab@euro-linux.com>

t_Log "Running $0 - /etc/centos-release compatibility symbolic links test."
if (t_GetPkgRel basesystem | grep -q el6)
then
    grep "EuroLinux" /etc/el-release >/dev/null 2>&1
    (file /etc/el-release | grep "symbolic link to .redhat-release."  >/dev/null 2>&1) &&\
    (file /etc/system-release | grep "symbolic link to .redhat-release."  >/dev/null 2>&1)
else
   echo "This test is not comptatible with EuroLinux <= 5"
fi

t_CheckExitStatus $?
