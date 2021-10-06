#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - check if iptables kernel modules are loaded"

if [ "$el_ver" = "7" ]|| [ "$el_ver" = "8" ];then
 t_Log "EuroLinux $el_ver uses firewalld and not iptables -> SKIP"
 t_CheckExitStatus 0
 exit 0
fi

lsmod | grep "ip_tables" > /dev/null 2>&1

t_CheckExitStatus $?
