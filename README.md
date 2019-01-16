This Code is written for and used in the CentOS Automated QA tests process. We welcome all contributions.

See the doc directory for additional information on test writing.

## Nightly Test Status

| EuroLinux Version/Architecture | Build Status |
| --------------------------- | ------------ |
| EuroLinux 7 - x86_64           | [![Build Status](https://10.10.1.139/view/EL-QA/job/EL-QA-sig-core-t_functional-el7/badge/icon)](https://jenkins.bel.lan/view/EL-QA/job/EL-QA-sig-core-t_functional-el7/) |
| EuroLinux 6 - x86_64           | [![Build Status](https://10.10.1.139/view/EL-QA/job/EL-QA-sig-core-t_functional-el6/badge/icon)](https://jenkins.bel.lan/view/EL-QA/job/EL-QA-sig-core-t_functional-el6/) |

## Pulling from upstream
```bash
git remote add upstream git@github.com:CentOS/sig-core-t_functional.git
git pull origin master
... # RESOLVE CONFLICTS
git add . 
git commit -m 'Pulled from upstream'
git push origin master
# Additionally the following should be made
grep 'centos_ver' -R . # check if there are any files that has centos_ver
./debrand.sh
```
