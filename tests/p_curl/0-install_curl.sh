#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>
# Christoph Galuschka <christoph.galuschka@chello.at>

t_Log "$0 - installing curl"
sudo update-ca-trust force-enable

t_InstallPackage curl
