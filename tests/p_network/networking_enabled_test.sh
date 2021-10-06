#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - Check if networking is enabled."

if [ "$el_ver" -ge 7 ] ; then
 t_Log "EuroLinux $el_ver -> SKIP"
 exit 0
else
 grep -Eqi "NETWORKING=.*yes" /etc/sysconfig/network
 t_CheckExitStatus $?
fi
