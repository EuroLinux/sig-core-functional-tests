#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>

if [ $el_ver -ge 6 ]
then
    t_InstallPackage mod_wsgi
    service httpd restart
else 
    echo "Skipped on CentOS 5"
fi

if [[ $el_ver -lt 6 || $el_ver -gt 7 ]]; then
    t_Log "mod_wsgi not available before CentOS 6 or after CentOS 7 -> SKIP"
    exit 0
fi

t_InstallPackage mod_wsgi
