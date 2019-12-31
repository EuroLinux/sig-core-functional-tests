#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - Squid test."

URL="https://en.euro-linux.com/"
CHECK_FOR="EuroLinux"

squidclient -T 2 ${URL} | grep "${CHECK_FOR}"  >/dev/null 2>&1

t_CheckExitStatus $?
