#!/bin/bash
# Just a check to determine full version (example 5.8) or just dist (example 6)
# Author Alex Baranowski <aleksander.baranowski@yahoo.pl>

export qa_releasever=$( cat /etc/system-release | grep -o "[0-9].[0-9]*" )
export qa_dist=$(echo $qa_releasever | cut -f1 -d.)
echo "Determine Release $qa_dist and $qa_releasever"
