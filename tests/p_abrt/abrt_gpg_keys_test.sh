#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>
#	  Christoph Galuschka <tigalch@tigalch.org>
#     Alex Baranowski <alex@euro-linux.com>
# Note: This was a known issue in CentOS 6.0
# See: http://bugs.centos.org/view.php?id=4993
# Christoph Galuschka: added functionality for C7

t_Log "Running $0 -  check that abrt is using EuroLinux' gpg keys."

if [ "$el_ver" = "7" ] ;then
    ls /etc/pki/rpm-gpg/ | grep -q "RPM-GPG-KEY-eurolinux7"
elif [ "$el_ver" = "6" ] ; then
     echo "TODO ABRT EUROLINUX 6"
#    grep -q "RPM-GPG-KEY-eurolinux" /etc/abrt/gpg_keys
elif [ "$el_ver" = "5" ] ; then
    echo "Skipped on EuroLinux 5"
elif [ "$el_ver" = "8" ] ; then
    ls /etc/pki/rpm-gpg/ | grep -q "RPM-GPG-KEY-eurolinux8"
elif [ "$el_ver" = "9" ] ; then
    ls /etc/pki/rpm-gpg/ | grep -q "RPM-GPG-KEY-eurolinux9"
else 
    echo "Unrecognized CentOS version - fail!"
    exit 1
fi

t_CheckExitStatus $?
