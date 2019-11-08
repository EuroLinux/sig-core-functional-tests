#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - Yum is using CentOS' bugtracker test."

<<<<<<< HEAD
#grep "http://bugs.centos.org" /etc/yum.conf >/dev/null 2>&1
echo "TODO WAITING FOR EuroLinux BugTracker"
=======
if [ "$centos_ver" -ge "8" ] ; then
   t_Log "CentOS$ver, SKIP"
   exit 0
fi
grep "http://bugs.centos.org" /etc/yum.conf >/dev/null 2>&1

>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce
t_CheckExitStatus $?
