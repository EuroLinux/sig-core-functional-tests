#!/bin/sh
# Author: Christoph Galuschka <christoph.galuschka@chello.at>
#         Athmane Madjodj <athmanem@gmail.com>

t_Log "Running $0 - python can print Hello World"

if [ "$el_ver" -ge 8 ] ; then
PYTHON=python3
else
PYTHON=python
fi

# creating source file
FILE='/var/tmp/python-test.py'

cat > $FILE <<EOF
print ("hello eurolinux")
EOF

# Executing python
$PYTHON $FILE | grep -q "hello eurolinux"

t_CheckExitStatus $?

# remove files
/bin/rm $FILE
