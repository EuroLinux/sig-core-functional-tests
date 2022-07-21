#!/bin/bash

t_Log "Running $0 - testing to see if DNS works"

HOST=elupdate.euro-linux.com

# its important we dont hit a dns record with a wildcard like centos.org
getent hosts $HOST >/dev/null

t_CheckExitStatus $?

# implied results:
# - network works
# - default route is really routeable
# - atleast one network link on the machine is working
# - kernel' ip stack is functional
