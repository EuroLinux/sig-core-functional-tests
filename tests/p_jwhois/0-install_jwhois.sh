#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>

# nc (netcat) is required for the test

if [ "$el_ver" -ge 8 ] ;then
  t_Log "No whois package for EuroLinux $el_ver -> SKIP"
  t_CheckExitStatus 0
  exit 0
elif [ "$el_ver" = "7" ] ;then
  whois_pkg="whois"
else
  whois_pkg="jwhois"
fi

t_InstallPackage $whois_pkg nc
