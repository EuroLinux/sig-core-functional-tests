#!/bin/bash
# Author: Pablo Greco <pablo@fliagreco.com.ar>

# Install gcc-gnat
t_Log "Running $0 - installing gcc-gnat."


# Install git
if [ $el_ver -ge 7 ];  then
  t_InstallPackage gcc-gnat
else
  t_Log "This test is skipped before EuroLinux 7"
fi
