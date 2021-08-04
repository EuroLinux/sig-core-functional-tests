#!/bin/sh
# Author: Kamil Halat <kh@gmail.com>

if [ "$el_ver" -eq "8" ]; then
    t_Log "remove spamassassin on eurolinux 8"
    sudo dnf remove --setopt=AppStream.module_hotfixes=false -y spamassassin
else
    t_RemovePackage  spamassassin
fi
