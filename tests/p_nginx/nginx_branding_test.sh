#!/bin/bash
# Author: Kamil Halat <kh@euro-linux.com>

t_Log "Running $0 - Check if nginx welcome page is branded"

if [ "$el_ver" -ne "8" ]; then
    t_Log "Nginx is not present in el$el_ver repositories."
    exit 0
fi

t_Log "Remove php before installing nginx for compatybility resons"

sudo yum remove @php -y
sudo yum module reset php -y


t_InstallPackage curl 

streams=$(dnf module list nginx -q | grep "nginx" | awk '{print $2}' | sort -u)

for stream in $streams; do
    t_Log "Check nginx welcome page branding for stream $stream."

    t_InstallPackage @nginx:$stream
    t_ServiceControl nginx cycle

    curl -s http://localhost/ | grep -i 'EuroLinux' > /dev/null 2>&1

    t_CheckExitStatus $?

    sudo yum module remove nginx -y
    sudo yum module reset nginx -y
done
