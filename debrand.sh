#!/usr/bin/env bash

find ./ -type f -exec sed -i -e s/el_ver/el_ver/g {} \;
