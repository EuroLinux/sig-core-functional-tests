#!/bin/bash
# Author: Athmane Madjoudj <athmane@fedoraproject.org>

# Ref: http://bugs.centos.org/view.php?id=6809
t_Log "Running $0 - Testing that Xorg has been patched to use EuroLinux bugtracker for support"

if [ $el_ver = 6 ]
then
    X --wrong-arg   2>&1 | grep -q 'wiki.centos.org'
else
    t_Log "EuroLinux 5 Xorg does not need checking"
fi


t_CheckExitStatus $?
