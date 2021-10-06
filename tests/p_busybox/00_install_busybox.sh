#!/bin/bash
# Author: Christoph Galuschka <christoph.galuschka@chello.at>
# Author: Rene Diepstraten <rene@renediepstraten.nl>

[[ $el_ver -ge 7 ]] && { t_Log "busybox is not part of el${el_ver}" ; exit ; }

t_Log "Running $0 - attempting to install busybox."
t_InstallPackage busybox

