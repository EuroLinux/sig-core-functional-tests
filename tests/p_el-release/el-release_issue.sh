#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>
# Author: Alex Baranowski 

t_Log "Running $0 - /etc/issue* has correct branding"
if [[ $el_ver -ge 7 ]] ; then
  t_Log "EuroLinux $el_ver -> SKIP"
  exit 0
else
  (grep "EuroLinux" /etc/issue >/dev/null 2>&1) && \
  (grep "EuroLinux" /etc/issue.net >/dev/null 2>&1) 
  t_CheckExitStatus $?
fi
