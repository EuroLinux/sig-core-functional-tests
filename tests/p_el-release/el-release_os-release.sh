#!/bin/bash
# Author: Fabian Arrotin <arrfab@centos.org>
# Author: Alex Baranowski <ab@euro-linux.com>

if [ "$el_ver" -eq "9" ];then
    echo "Skipping for EuroLinux 9"
    exit 0
fi

if [ "$el_ver" -gt "7" ];then
    t_Log "Running $0 - /etc/os-release has correct ABRT string for EuroLiux $el_ver"
    if [ "$el_ver" -eq "7" ];then
        ID_LIKE="rhel\sscientific\scentos\sfedora"
    elif [ "$el_ver" -eq "8" ];then
        ID_LIKE="rhel\sfedora\scentos"
    fi
    for string in "NAME=\"EuroLinux\"" "ID_LIKE=\"$ID_LIKE\"" "ID=\"eurolinux\""
    do
        grep -q $string /etc/os-release
        if [ $? -ne "0" ];then
        t_Log "missing string $string in os-release file !"
        exit 1
        fi
    done
else
  echo "Skipping for EuroLinux 5 and 6 ..." ; exit 0
fi

t_CheckExitStatus $?

