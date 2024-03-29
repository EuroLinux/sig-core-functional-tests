#!/bin/sh
# Author: Christoph Galuschka <tigalch@tigalch.org>
# Author: Alex Baranowski <ab@euro-linux.com>

t_Log "Running $0 - Create PDF from postscript from text, and convert PDF back to text and check contents"

if [ "$el_ver" = "5" ] ||  [ "$el_ver" = "6" ];then
  FILE=/etc/redhat-release
else
  FILE=/etc/el-release
fi
FIND='EuroLinux'
PS_FILE=/var/tmp/test.ps
PDF_FILE=/var/tmp/test.pdf
TEST_FILE=/var/tmp/result

# generate postscript file
enscript -q -p $PS_FILE $FILE

# check-file
t_Log 'Check created PS-File'
grep -q $FIND $PS_FILE
t_CheckExitStatus $?

# convert to PDF
ps2pdf $PS_FILE $PDF_FILE

# read file and check
pdftotext -q $PDF_FILE $TEST_FILE
t_Log 'Check Textfile after conversion'
grep -q $FIND $TEST_FILE
t_CheckExitStatus $?

#clean up
rm -rf $PDF_FILE $TEST_FILE $PS_FILE
