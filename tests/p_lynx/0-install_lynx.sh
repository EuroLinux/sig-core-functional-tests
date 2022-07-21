#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "$0 - installing Lynx"

if [ "$el_ver" -ge "8" ]; then
  t_Log "Package lynx not available in default repos on eurolinux >= 8 => SKIP"
  exit 0
fi

t_InstallPackage  lynx
