#!/bin/sh

t_Log "Running $0 - test that all updates can be applied to this machine cleanly"

# If CENTOSPLUS, and CentOS 7, and x86_64 change default kernel to kernel-plus
if [ "$CENTOSPLUS" == "1" ] && [ "$el_ver" == "7" ] && [ "$arch" == "x86_64" ] ; then
  sed -i 's,DEFAULTKERNEL=.*,DEFAULTKERNEL=kernel-plus,g' /etc/sysconfig/kernel
fi

if [ "$el_ver" -lt 8 ];then
  yum -d0 -y install deltarpm
fi
yum -d0 -y upgrade

t_Log "Running $0 - listing all used/available packages"

yum list

t_CheckExitStatus $?
