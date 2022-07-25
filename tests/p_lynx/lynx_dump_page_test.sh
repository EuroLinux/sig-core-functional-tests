#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - check that lynx can dump remote page."

if [ "$el_ver" -ge "8" ]; then
  t_Log "Package lynx not available in default repos on el8 => SKIP"
  exit 0
fi

URL="https://euro-linux.com"
CHECK_FOR="EuroLinux"
if [ "$el_ver" -eq "6" ]; then
    URL="http://google.com"
    CHECK_FOR="Google"
fi

lynx -dump ${URL} | grep "${CHECK_FOR}"  >/dev/null 2>&1

t_CheckExitStatus $?
