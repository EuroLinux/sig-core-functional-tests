#!/bin/bash
# Author: Alex Iribarren <Alex.Iribarren@cern.ch>
exit 0
t_Log "Running $0 - testing comps.xml groups"

if [ "$CONTAINERTEST" -eq "1" ]; then
    t_Log "Running in container -> SKIP"
    exit 0
fi

if [ "$el_ver" -eq "7" ]; then
    t_Log "CentOS $el_ver -> SKIP"
    exit 0
fi

# Get **all** the group IDs
# TODO
# FIXME
ALL_GROUPS=$(dnf group list -v --hidden | grep '^   ' | sed 's/.*(\(.*\))$/\1/' | grep -v "powertools-builder" | grep -v 'crb') 

for GROUP in $ALL_GROUPS; do
    t_Log " - testing group $GROUP"
    # Pretend to install the group, but all we really want is the solver debug data
    dnf --installroot=/tmp group --releasever $el_ver install --assumeno --debugsolver $GROUP
    pwd
    ls
    # Check the solver results to see if there are problems
    grep '^problem' debugdata/rpms/solver.result
    RES=$?
    # Clean up the debugdata
    rm -rf debugdata/

    # If 'problem' was not found in the results, grep returns 1 and we're happy
    if [[ $RES -eq 1 ]]; then
        t_CheckExitStatus 0
    else
        t_CheckExitStatus 1
    fi
done
