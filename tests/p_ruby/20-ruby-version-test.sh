#!/bin/sh
# Author: Nikhil Lanjewar <nikhil@lanjewar.com>
# Author: Sahil Muthoo <sahilm@thoughtworks.com>
# Author: Sahil Aggarwal <sahilagg@gmail.com>
# Author: Saager Mhatre <saager.mhatre@gmail.com>
#	  Christoph Galuschka <christoph.galuschka@chello.at>

t_Log "Running $0 - Check version of ruby."

<<<<<<< HEAD
if [ "$el_ver" = "7" ] ; then
=======
if [ "$centos_ver" = "8" ] ; then
  ruby -v | grep -q '2.5'
  ret_val=$?
elif [ "$centos_ver" = "7" ] ; then
>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce
  ruby -v | grep -q '2.0'
  ret_val=$?
elif [ "$el_ver" = "6" ] ; then
  ruby -v | grep -q '1.8.7'
  ret_val=$?
else
  ruby -v | grep -q '1.8.5'
  ret_val=$?
fi

t_CheckExitStatus $ret_val

