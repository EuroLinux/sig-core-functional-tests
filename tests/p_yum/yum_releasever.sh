#!/bin/sh
# Author: Alex Baranowski <ab@euro-linux.com>

export qa_releasever=$( cat /etc/system-release | grep -o "[0-9].[0-9]*" )
export qa_dist=$(echo $qa_releasever | cut -f1 -d.)
t_Log "Running $0 - Yum configuration has the correct releasever"

real_release_ver=$(python -c 'import yum, pprint; yb = yum.YumBase();print yb.conf.yumvar["releasever"]' | tail -1)

echo "QA_DIST $qa_dist"

if [[ $el_ver -eq 7 ]]; then
    if  [[ $real_release_ver == $qa_dist ]]; then
        echo "OK"
    else
        false
    fi
    t_CheckExitStatus $?
elif [[ $el_ver -eq 6 ]]; then
    if  [[ $real_release_ver == $qa_releasever ]]; then
        echo "OK"
    else
        false
    fi
    t_CheckExitStatus $?
else
    echo "EuroLinux version not recognized"
    exit 1
fi
t_CheckExitStatus $?
