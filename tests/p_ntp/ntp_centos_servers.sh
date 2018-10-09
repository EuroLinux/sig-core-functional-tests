#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>
# Ref.: http://bugs.centos.org/view.php?id=4943

t_Log "Running $0 - NTP is using RHEL server pool test."

grep ".rhel.pool.ntp.org" /etc/ntp.conf > /dev/null 2>&1

t_CheckExitStatus $?
