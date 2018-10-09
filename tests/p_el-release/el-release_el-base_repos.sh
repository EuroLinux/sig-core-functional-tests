#!/bin/sh
# Author: Alex Baranowski

t_Log "Running $0 - EuroLinux repo sanity test."

channels=$(rhn-channel --list)
if echo $channels | grep -q "el-server-${el_ver}"; then
    echo "Configured to use EuroMan"
else
    grep "name=ELS base repo" /etc/yum.repos.d/el-base.repo >/dev/null 2>&1
fi

t_CheckExitStatus $?
