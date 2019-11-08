#!/bin/bash
# Author: Steve Barnes (steve@echo.id.au)

if [ "$el_ver" -ge 8 ] ; then
  t_Log "no ntp in CentOS $el_ver ... SKIP"
  exit 0
fi
# NTPd
t_InstallPackage ntp
