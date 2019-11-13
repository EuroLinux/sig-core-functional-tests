#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - check that lynx default page is EuroLinux welcome page ."

if [ "$el_ver" -eq "8" ]; then
  t_Log "Package lynx not available in default repos on el8 => SKIP"
  exit 0
fi


lynx -dump  | grep "EuroLinux"  >/dev/null 2>&1

t_CheckExitStatus $?
