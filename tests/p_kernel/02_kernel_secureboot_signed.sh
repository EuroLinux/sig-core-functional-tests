#!/bin/bash
# This test will verify that grub2-efi is correctly signed with correct cert in the CA chain

# TODO 
# FIX ME

exit 0

t_Log "Running $0 -  Verifying that kernel is correctly signed with correct cert"

if [[ "$el_ver" -ge 7 && "$arch" = "x86_64" ]] ; then
  t_InstallPackage pesign 
  for kernel in $(rpm -q kernel --queryformat '%{version}-%{release}.%{arch}\n') 
    do
    t_Log "Validating kernel $kernel ..."
    pesign --show-signature --in /boot/vmlinuz-${kernel}| egrep -q 'Fermi National|EuroLinux'
    t_CheckExitStatus $?
  done
else
  t_Log "previous versions than EuroLinux 7 - or not x86_64 -aren't using secureboot ... skipping"
  exit 0
fi
