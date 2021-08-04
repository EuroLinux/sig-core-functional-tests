#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>

if [ "$el_ver" -eq "8" ]; then
    t_Log "Install spamassassin on eurolinux 8"
    sudo dnf install --setopt=AppStream.module_hotfixes=true -y spamassassin
else
    t_InstallPackage  spamassassin
fi
