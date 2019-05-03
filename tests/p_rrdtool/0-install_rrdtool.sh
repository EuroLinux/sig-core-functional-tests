#!/bin/bash
# Author: Christoph Galuschka <christoph.galuschka@chello.at>
#         Athmane Madjoudj <athmanem@gmail.com>

if [ $el_ver -ge 6 ]
then
    # Install rrdtool
    t_InstallPackage rrdtool
else 
    echo "Skipped on CentOS 5"
fi

