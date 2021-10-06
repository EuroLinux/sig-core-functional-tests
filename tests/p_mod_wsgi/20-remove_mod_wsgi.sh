#!/bin/bash

t_Log "Running $0 - removing mod_wsgi"

if [[ $el_ver -lt 6 || $el_ver -gt 7 ]]; then
    t_Log "mod_wsgi not available before CentOS 6 or after CentOS 7 -> SKIP"
    exit 0
fi

t_RemovePackage mod_wsgi
