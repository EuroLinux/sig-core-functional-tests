#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - EuroLinux Anaconda patch is applied test."

uname_arch=$(uname -m)
#TODO testy anakondy dla EuroLinux'a 8
if [[ "$el_ver" -eq "8" ]]; then
  t_Log "el8 => SKIPPING"
  exit 0
fi

ANACONDA_FILE="rhel.py"
if [ "$el_ver" = "7" ];then
  ANACONDA_PATH=/usr/lib64/python2.7/site-packages/pyanaconda/
  grep "EuroLinux" $ANACONDA_PATH/installclasses/$ANACONDA_FILE >/dev/null 2>&1 
elif [ "$el_ver" = "6" ]; then
  echo "TODO"
  ANACONDA_PATH=/usr/lib/anaconda/
#  grep "EuroLinux" $ANACONDA_PATH/installclasses/$ANACONDA_FILE >/dev/null 2>&1 
else
  echo "Unrecognized EuroLinux release - FAIL"
  exit 1
fi




t_CheckExitStatus $?
