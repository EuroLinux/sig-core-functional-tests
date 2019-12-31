#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - Squid test."

URL="https://en.euro-linux.com/"
CHECK_FOR="EuroLinux"

if [ "$el_ver" -eq "6" ]; then
    URL="https://www.google.com"
    CHECK_FOR="Google"
fi

squidclient -T 2 ${URL} | grep "${CHECK_FOR}"  >/dev/null 2>&1

t_CheckExitStatus $?
