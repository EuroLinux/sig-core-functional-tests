#!/usr/bin/env bash

# Author: Kamil Halat <kh@euro-linux.com>

# This is the simplest change of the variable
# There are other brandings that must be changed

find ./ -type f -exec sed -i -e s/centos_ver/el_ver/g {} \;
