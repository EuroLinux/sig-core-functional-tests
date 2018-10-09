#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>
# Author: Alex Baranowski <ab@euro-linux.com>

t_Log "Running $0 - /etc/el-release has correct branding"

if [ "$el_ver" = "5" ] ; then
    grep "EuroLinux" /etc/redhat-release >/dev/null 2>&1
else
    grep "EuroLinux" /etc/redhat-release >/dev/null 2>&1
    grep "EuroLinux" /etc/el-release >/dev/null 2>&1
fi

t_CheckExitStatus $?

