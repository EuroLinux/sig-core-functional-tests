#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>
# Christoph Galuschka <christoph.galuschka@chello.at>

t_Log "$0 - installing curl"
sudo update-ca-trust force-enable

if [ "$el_ver" -ge "9" ]; then
  t_InstallPackage curl-minimal
else
  t_InstallPackage curl
fi
