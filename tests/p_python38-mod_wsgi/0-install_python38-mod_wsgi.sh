#!/bin/bash

t_Log "Running $0 - installing python38-mod_wsgi"


if (t_GetPkgRel basesystem | grep -q el9)
then
  t_Log "This is a EuroLinux 9 system. python38-mod-wsgi not present. Skipping."
  t_CheckExitStatus 0
  exit $PASS
fi


if [[ $el_ver -lt 8 ]]; then
    t_Log "python38-mod_wsgi doesn't exist before EuroLinux 8 -> SKIP"
    exit 0
fi

t_InstallPackage python38-mod_wsgi
