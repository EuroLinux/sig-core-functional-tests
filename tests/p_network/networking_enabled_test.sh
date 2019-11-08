#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - Check if networking is enabled."

<<<<<<< HEAD
if [ "$el_ver" = "7" ] ; then
 t_Log "CentOS $el_ver -> SKIP"
=======
if [ "$centos_ver" -ge 7 ] ; then
 t_Log "CentOS $centos_ver -> SKIP"
>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce
 exit 0
else
 grep -Eqi "NETWORKING=.*yes" /etc/sysconfig/network
 t_CheckExitStatus $?
fi
