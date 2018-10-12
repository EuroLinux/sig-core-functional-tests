#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

if [[ $el_ver -eq '6' ]]; then
    t_Log "Skipping $0 - check that lynx default page is EuroLinux welcome page ."
else
    t_Log "Running $0 - check that lynx default page is EuroLinux welcome page ."
    lynx -dump  | grep "Welcome to EuroLinux"  >/dev/null 2>&1
fi
t_CheckExitStatus $?
