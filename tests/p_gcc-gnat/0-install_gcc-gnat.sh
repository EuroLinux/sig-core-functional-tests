#!/bin/bash -x
# Author: Pablo Greco <pablo@fliagreco.com.ar>

# Install gcc-gnat
t_Log "Running $0 - installing gcc-gnat."


<<<<<<< HEAD
# Install git
if [ $el_ver -ge 7 ];  then
  t_InstallPackage gcc-gnat
else
  t_Log "This test is skipped before EuroLinux 7"
=======
# Install gcc-gnat
if [ $centos_ver -eq 7 ];  then
  t_InstallPackage gcc-gnat
else
  t_Log "This test is only valid in CentOS7."
>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce
fi
