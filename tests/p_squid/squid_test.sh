#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - Squid test."

# Do not use euro-linux.com as our security is stricker than this old squid
URL="https://www.google.com/"
CHECK_FOR="Google"

squidclient -T 2 ${URL} | grep "${CHECK_FOR}"  >/dev/null 2>&1

t_CheckExitStatus $?
