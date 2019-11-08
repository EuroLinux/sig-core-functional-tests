#!/bin/sh

t_Log "Running $0 - package should already be installed"
# TODO
echo "EuroLinux TODO"
#rpm -qa | egrep -q 'yum-.*fastestmirror'
#t_CheckExitStatus $?

<<<<<<< HEAD
#t_Log "Running $0 - yum should have a hard Requires on yum-plugin-fastestmirror"
#rpm -q --requires yum | egrep -q 'yum-.*fastestmirror'
=======
if [ "$centos_ver" -eq "8" ] ; then
 t_Log "yum is replaced by dnf on el8. SKIP"
 exit 0
fi
rpm -qa | egrep -q 'yum-.*fastestmirror'
t_CheckExitStatus $?

t_Log "Running $0 - yum should have a hard Requires on yum-plugin-fastestmirror"
rpm -q --requires yum | egrep -q 'yum-.*fastestmirror'
>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce
t_CheckExitStatus $?
