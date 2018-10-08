#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - EuroLinux Anaconda patch is applied test."

uname_arch=$(uname -m)

ANACONDA_FILE="rhel.py"
if [ "$el_ver" = "7" ];then
  ANACONDA_PATH=/usr/lib64/python2.7/site-packages/pyanaconda/
elif [ "$el_ver" = "6" ]; then
  ANACONDA_PATH=/usr/lib/anaconda/
else
  echo "Unrecognized EuroLinux release - FAIL"
  exit 1
fi


grep "EuroLinux" $ANACONDA_PATH/installclasses/$ANACONDA_FILE >/dev/null 2>&1 


t_CheckExitStatus $?
