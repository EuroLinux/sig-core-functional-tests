#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - logwatch test."

<<<<<<< HEAD
if [ "$el_ver" = "7" ] ; then
=======
if [ "$centos_ver" -ge 7 ] ; then
>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce
 lw_options="--range Today"
else
 lw_options="--range Today --print"
fi

logwatch ${lw_options}| grep -q 'Logwatch End'

t_CheckExitStatus $?
