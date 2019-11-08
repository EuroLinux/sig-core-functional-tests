#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>
# Ref.: http://bugs.centos.org/view.php?id=4943

<<<<<<< HEAD
t_Log "Running $0 - NTP is using RHEL server pool test."
=======
if [ "$centos_ver" -ge 8 ] ; then
  exit 0
fi
t_Log "Running $0 - NTP is using CentOS server pool test."
>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce

grep ".rhel.pool.ntp.org" /etc/ntp.conf > /dev/null 2>&1

t_CheckExitStatus $?
