#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - EuroLinux Anaconda patch is applied test."

uname_arch=$(uname -m)

if [ "$el_ver" == "9" ]; then
    [ -e /etc/anaconda/product.d/eurolinux.conf ]
elif [ "$el_ver" == "8" ]; then
  ANACONDA_PATH=/usr/lib64/python3.6/site-packages/pyanaconda/
  ANACONDA_FILE="constants.py"
  grep "EuroLinux" $ANACONDA_PATH/core/$ANACONDA_FILE >/dev/null 2>&1 
elif [ "$el_ver" == "7" ];then
  ANACONDA_PATH=/usr/lib64/python2.7/site-packages/pyanaconda/
  ANACONDA_FILE="rhel.py"
  grep "EuroLinux" $ANACONDA_PATH/installclasses/$ANACONDA_FILE >/dev/null 2>&1 
elif [ "$el_ver" == "6" ]; then
  echo "TODO"
  exit 0
  ANACONDA_PATH=/usr/lib/anaconda/
#  grep "EuroLinux" $ANACONDA_PATH/installclasses/$ANACONDA_FILE >/dev/null 2>&1
else
  echo "Unrecognized EuroLinux release - FAIL"
  exit 1
fi



t_CheckExitStatus $?
