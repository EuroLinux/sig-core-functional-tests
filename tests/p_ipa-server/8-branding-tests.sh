#!/bin/bash
# Author: Kamil Halat <kh@euro-linux.com>
#

if [[ "$el_ver" -lt "8" ]]; then
    t_Log "SKIP: for eurolinux version lesser then 8"
    exit 0
fi

t_Log "Remove el-logos before installing ipa"
sudo yum remove el-logos -y

sudo dnf module enable idm:DL1 -y
t_InstallPackage ipa-server

t_Log "Check if el-logos is present after ipa installation"
sudo yum list installed | grep -q el-logos
t_CheckExitStatus $?

t_Log "Remove ipa."
sudo yum remove ipa-server -y

