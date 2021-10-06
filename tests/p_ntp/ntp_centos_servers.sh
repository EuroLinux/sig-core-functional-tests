#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>
# Ref.: http://bugs.centos.org/view.php?id=4943

if [ "$el_ver" -ge 8 ] ; then
  exit 0
fi
t_Log "Running $0 - NTP is using RHEL server pool test."

grep ".rhel.pool.ntp.org" /etc/ntp.conf > /dev/null 2>&1

t_CheckExitStatus $?
