#!/bin/bash
# Author: Fabian Arrotin <arrfab@centos.org>
# Author: Alex Baranowski <ab@euro-linux.com>

<<<<<<< HEAD:tests/p_el-release/el-release_os-release.sh
t_Log "Running $0 - /etc/os-release has correct ABRT string for EuroLinux 7"

if [ "$el_ver" = "7" ];then
  for string in NAME=\"EuroLinux\"  ID_LIKE=\"rhel scientific centos fedora\" ID=\"eurolinux\"
  do
=======
t_Log "Running $0 - /etc/os-release has correct ABRT string for CentOS $centos_ver"

if [ "$centos_ver" -ge 7 ];then
  for string in CENTOS_MANTISBT_PROJECT=\"CentOS-$centos_ver\" CENTOS_MANTISBT_PROJECT_VERSION=\"$centos_ver\" REDHAT_SUPPORT_PRODUCT=\"centos\" REDHAT_SUPPORT_PRODUCT_VERSION=\"$centos_ver\"
  do 
>>>>>>> 91ec2259bdd19c2a1a3261e92d1c3df08fd6b6ce:tests/p_centos-release/centos-release_os-release.sh
    grep -q $string /etc/os-release
    if [ $? -ne "0" ];then
      t_Log "missing string $string in os-release file !"
      exit 1
    fi
  done
else
  echo "Skipping for CentOS 5 and 6 ..." ; exit 0
fi

t_CheckExitStatus $?

