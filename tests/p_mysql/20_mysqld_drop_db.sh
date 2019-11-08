#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - MySQL drop database test."

<<<<<<< HEAD
if [ $el_ver -gt 6 ]
then
  t_Log 'mysql is only supported on C5 and C6, skipping'
  t_CheckExitStatus 0       
  exit 0
fi

=======
>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce
mysql -u root -e 'drop database mysql_test' >/dev/null 2>&1
t_CheckExitStatus $?
