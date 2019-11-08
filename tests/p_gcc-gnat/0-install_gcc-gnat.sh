#!/bin/bash -x
# Author: Pablo Greco <pablo@fliagreco.com.ar>

# Install gcc-gnat
t_Log "Running $0 - installing gcc-gnat."


# Install gcc-gnat
if [ $el_ver -eq 7 ];  then
  t_InstallPackage gcc-gnat
  t_Log "This test is only valid in EuroLinux 7"
else
  t_Log "This test is only valid in CentOS7."
fi
