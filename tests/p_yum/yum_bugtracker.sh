#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - Yum is using EuroLinux' bugtracker test."

if [[ "$el_ver" -ge "8" ]]; then
   t_Log "EuroLinux $ver, SKIP"
   exit 0
fi
#grep "http://bugs.centos.org" /etc/yum.conf >/dev/null 2>&1
echo "TODO WAITING FOR EuroLinux BugTracker"
t_CheckExitStatus $?
