#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>
# Author: Christoph Galuschka <christoph.galuschka@chello.at>

if (t_GetPkgRel basesystem | grep -q el6)
then
    t_Log "Running $0 - basic wireshark test."

    # just checking version

    VERSION="wireshark 1.2"
    wireshark -v | grep "${VERSION}" >/dev/null 2>&1
    # if version checking is not desired
    #wireshark -v | grep "wireshark.org" >/dev/null 2>&1
    # please choose the preferred method
    t_CheckExitStatus $?
else
    echo "Skipped on CentOS 5"
fi