#!/bin/sh
# Author: Alex Baranowski

t_Log "Running $0 - EuroLinux RPM GPG Keys exist."

file /etc/pki/rpm-gpg/RPM-GPG-KEY-eurolinux7  >/dev/null 2>&1 && \
file /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-eurolinux  >/dev/null 2>&1

t_CheckExitStatus $?
