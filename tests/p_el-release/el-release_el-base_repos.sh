#!/bin/sh
# Author: Alex Baranowski

t_Log "Running $0 - EuroLinux repo sanity test."
set -x
if [[ $el_ver -eq 9 ]]; then
    [ -e /etc/yum.repos.d/eurolinux.repo ]
    t_CheckExitStatus $?
    grep BaseOS /etc/yum.repos.d/eurolinux.repo
    t_CheckExitStatus $?
    exit 0
elif [[ $el_ver -eq 8 ]]; then
    [ -e /etc/yum.repos.d/certify.repo ]
    t_CheckExitStatus $?
    grep BaseOS /etc/yum.repos.d/certify.repo
    t_CheckExitStatus $?
    exit 0
fi

channels=$(rhn-channel --list)
if echo $channels | grep -q "el-server-${el_ver}"; then
    echo "Configured to use EuroMan"
else
    grep "BaseOS"  /etc/yum.repos.d/eurolinux-6.repo || grep "name=ELS base repo" /etc/yum.repos.d/el-base.repo >/dev/null 2>&1
fi

t_CheckExitStatus $?
