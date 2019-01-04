#!/bin/bash
# Author: Fabian Arrotin <arrfab@centos.org>
# Author: Alex Baranowski <ab@euro-linux.com>

t_Log "Running $0 - /etc/os-release has correct ABRT string for EuroLinux 7"

if [ "$el_ver" = "7" ];then
  for string in NAME=\"EuroLinux\"  ID_LIKE=\"rhel scientific centos fedora\" ID=\"eurolinux\"
  do
    grep -q $string /etc/os-release
    if [ $? -ne "0" ];then
      t_Log "missing string $string in os-release file !"
      exit 1
    fi
  done
else
  echo "Skipping for CentOS 5 and 6 ..." ; exit 0
fi

t_CheckExitStatus $?

