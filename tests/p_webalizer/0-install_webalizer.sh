#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - attempting to install webalizer"

<<<<<<< HEAD
if [ "$el_ver" = "7" ] ; then
 t_Log "No webalizer package for CentOS $el_ver -> SKIP"
=======
if [ "$centos_ver" -ge 7 ] ; then
 t_Log "No webalizer package for CentOS $centos_ver -> SKIP"
>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce
 t_CheckExitStatus 0
 exit 0
fi

t_InstallPackage webalizer 
t_InstallPackage httpd
t_ServiceControl httpd stop
ps ax | grep -v grep | grep -q httpd
if [ $? = 0 ]
then
  t_Log "httpd still running - killing"
  killall -9 httpd
fi
sleep 1
t_ServiceControl httpd start

