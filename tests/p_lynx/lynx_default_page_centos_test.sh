#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - check that lynx default page is EuroLinux welcome page ."

lynx -dump  | grep "Welcome to EuroLinux"  >/dev/null 2>&1

t_CheckExitStatus $?
