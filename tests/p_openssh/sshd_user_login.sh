#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>
# Author: Alex Baranowski <ab@euro-linux.com>

userdel -rf sshtest; useradd sshtest && echo sshtest | passwd --stdin sshtest
# EuroLinux hotfix for EL6
if [ $el_ver == '6' ]; then
    service sshd restart
    sleep 5
fi
#
# Create a test file
touch /home/sshtest/ssh_test_file

t_Log "Running $0 - SSH Interactive user login test."

if [ "$CONTAINERTEST" -eq "1" ]; then
    t_Log "Running in container -> SKIP"
    exit 0
fi

if [ `egrep "^PasswordAuthentication" /etc/ssh/sshd_config | tail -n1 | egrep "\syes$" | wc -l ` -gt 0 ]; then
  ./tests/p_openssh/_helper_sshd_user_login.expect | grep "ssh_test_file"  > /dev/null 2>&1
  t_CheckExitStatus $?
  userdel -rf sshtest
else
	t_Log 'Skipped'
fi
