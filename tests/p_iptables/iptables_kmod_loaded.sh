#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - check if iptables kernel modules are loaded"

<<<<<<< HEAD
if [ "$el_ver" = "7" ];then
 t_Log "CentOS $el_ver uses firewalld and not iptables -> SKIP"
=======
if [ "$centos_ver" = "7" ]|| [ "$centos_ver" = "8" ];then
 t_Log "CentOS $centos_ver uses firewalld and not iptables -> SKIP"
>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce
 t_CheckExitStatus 0
 exit 0
fi

lsmod | grep "ip_tables" > /dev/null 2>&1

t_CheckExitStatus $?

