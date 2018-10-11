#!/bin/sh
# Build steps used in EuroLinux CI

yum -y update
uname -a
#sudo SKIP_QA_HARNESS=1 ./runtests.sh
sudo ./runtests.sh
