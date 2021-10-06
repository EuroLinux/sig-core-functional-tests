#!/bin/bash

# GNU Screen
t_Log "Running $0 - installing screen"
if [ "$el_ver" -eq 8 ] ; then
    t_Log "EuroLinux $el_ver -> SKIP"
    exit 0
fi
t_InstallPackage screen
