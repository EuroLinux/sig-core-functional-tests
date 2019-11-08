#!/bin/bash
# This test will verify that grub2-efi is correctly signed with correct cert in the CA chain

t_Log "Running $0 -  Verifying that kernel is correctly signed with correct cert"

<<<<<<< HEAD
if [[ "$el_ver" = "7" && "$arch" = "x86_64" ]] ; then
=======
if [[ "$centos_ver" -ge 7 && "$arch" = "x86_64" ]] ; then
>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce
  t_InstallPackage pesign 
  for kernel in $(rpm -q kernel --queryformat '%{version}-%{release}.%{arch}\n') 
    do
    t_Log "Validating kernel $kernel ..."
    pesign --show-signature --in /boot/vmlinuz-${kernel}| egrep -q 'Fermi National|EuroLinux'
    t_CheckExitStatus $?
  done
else
  t_Log "previous versions than CentOS 7 - or not x86_64 -aren't using secureboot ... skipping"
  exit 0
fi

