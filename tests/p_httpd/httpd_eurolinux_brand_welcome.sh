#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - httpd:  Welcome page has EuroLinux Branding."

curl -s http://localhost/ | grep -i 'EuroLinux' > /dev/null 2>&1

t_CheckExitStatus $?

t_Log "Running $0 - httpd:  Welcome page doesn't have Red Hat branding."
if curl -s http://localhost/ | grep -Ei '(Red Hat)|(RHEL)|(redhat)' > /dev/null 2>&1; then
    t_Log "Fail $0: Redhat branding still in httpd welcome page"
    exit 1
fi
