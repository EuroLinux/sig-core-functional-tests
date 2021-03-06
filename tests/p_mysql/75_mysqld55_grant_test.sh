#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>
#	  Christoph Galuschka <tigalch@tigalch.org>

t_Log "Running $0 - MySQL55 GRANT privileges test"

if [ $el_ver -gt 5 ]
then
  t_Log 'mysql55 is only supported on C5, skipping'
  t_CheckExitStatus 0       
  exit 0
fi

mysql -u root -e 'create database mysql_test;'  > /dev/null 2>&1
mysql -u root -e "grant all on mysql_test.* to mysql_test@localhost identified by 'mysqltest'"  > /dev/null 2>&1
mysql -u root -e "flush privileges;" > /dev/null 2>&1
mysql -u mysql_test -pmysqltest mysql_test -e 'create table test_table(id int);' > /dev/null 2>&1
ret_val=$?

# Clean up
mysql -u root -e 'drop database mysql_test;'  > /dev/null 2>&1

t_CheckExitStatus $ret_val
