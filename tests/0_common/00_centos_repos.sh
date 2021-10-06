#!/bin/bash

if [ "$el_ver" -eq "8" ]; then
  t_Log "No yum module on el8. SKIP"
  exit 0
else
   [ -e /etc/yum.repos.d/fbi.repo ] &&  rm -v /etc/yum.repos.d/fbi.repo
   [ -e /etc/yum.repos.d/fbi-base.repo ] &&  rm -v /etc/yum.repos.d/fbi-base.repo
   python tests/0_common/_eurolinux_default_repos.py
fi

