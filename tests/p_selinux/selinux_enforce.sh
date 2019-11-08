#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - check if SELinux is in enforcing mode"

<<<<<<< HEAD
if [ "$el_ver" = "7" ] ; then
=======
if [ "$centos_ver" -ge 7 ] ; then
>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce
  selinux_file=/sys/fs/selinux/enforce
else
  selinux_file=/selinux/enforce
fi

if [ "$SKIP_QA_HARNESS" = "1" ] ; then
    t_Log "Skipping this test ..."
else
    cat $selinux_file | grep 1  > /dev/null 2>&1
    t_CheckExitStatus $?
fi

