#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>
#	  Christoph Galuschka <tigalch@tigalch.org>

t_Log "Running $0 - installing and starting mysql server."

# MySQL
# starting with 5.10, we have to add mysql55

<<<<<<< HEAD
if [ "$el_ver" = "7" ] ; then
=======
if [ "$centos_ver" -ge 7 ] ; then
>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce
  my_packages="mariadb mariadb-server nc"
  mysql_service="mariadb"
elif [ "$el_ver" = "5" ] ;then
  my_packages="mysql mysql-server nc mysql55-mysql-server"
  mysql_service="mysqld"
else
  my_packages="mysql mysql-server nc"
  mysql_service="mysqld"
fi

t_InstallPackage ${my_packages}

t_ServiceControl ${mysql_service} start >/dev/null 2>&1
