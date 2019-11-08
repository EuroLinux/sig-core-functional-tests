#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - httpd: centos branding / Server tokens value "

<<<<<<< HEAD:tests/p_httpd/httpd_eurolinux_brand_server_tokens.sh
curl -sI http://localhost/ | grep "Server:\ Apache.*\ (EuroLinux)" > /dev/null 2>&1
=======
curl -sI http://localhost/ | grep -i "Server:\ Apache.*\ (CentOS)" > /dev/null 2>&1
>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce:tests/p_httpd/httpd_centos_brand_server_tokens.sh

t_CheckExitStatus $?
