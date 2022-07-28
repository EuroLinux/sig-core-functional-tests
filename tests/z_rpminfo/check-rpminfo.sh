#!/bin/sh
# Author: Brian Stinson <brian@bstinson.com>
# Runner script for checking rpminfo so we can fail gracefully on EL5

if [ "$el_ver" -ge "8" ]; then
  t_Log "check-rpminfo.py not python3/dnf ready on c8 => SKIP"
  exit 0
fi

if [[ $el_ver != 5 ]]; then
    python "$(dirname "$(readlink -f "$0")")/check-rpminfo.py"
    t_CheckExitStatus $?
else
    echo "Skipped on EuroLinux 5"
fi
