#!/bin/bash
# Author: Kamil Halat <kh@euro-linux.com>

t_Log "Running $0 - Check if skopeo has only docker.io as default registry"

if [ "$el_ver" -ne "8" ]; then
    t_Log "container-tools is not present in el$el_ver repositories."
    exit 0
fi

t_InstallPackage curl 

streams=$(dnf module list container-tools -q | grep "container-tools" | awk '{print $2}' | sort -u)

for stream in $streams; do
    t_Log "Check skopeo default registry for stream $stream."
    yum module enable container-tools:$stream -y
    sudo yum install skopeo -y
    sudo updatedb && locate -e bench-repo
    branded_file=$(locate registries.conf | grep "registries.conf$")
    t_CheckExitStatus $?

    if registries=$(grep "^registries.*docker.io.*$" $branded_file); then
        if echo $registries | grep -E "(registry.redhat.io)|(quay.io)";then
            t_Log "RedHat registries still enabled in stream $stream."
        fi
        echo $registries
    else
        t_Log "Nie znaleziono registries w pliku $branded_file $stream."
    fi
    sudo yum remove skopeo -y
    sudo yum module reset container-tools -y
    t_Log "PASS: Branding skopeo for stream $stream."
done
