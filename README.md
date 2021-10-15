This Code is a fork from [CentOS /
sig-core-t_functional](https://github.com/CentOS/sig-core-t_functional), that
is used in EuroLinux Automated QA test process. If you want to add some patch
please note that we are regullary merging changes from upstream so it's
probably better place to not EuroLinux specific contribution.

## Pulling from upstream
```bash
git remote add upstream git@github.com:CentOS/sig-core-t_functional.git
git pull origin master
... # RESOLVE CONFLICTS
git add .
git commit -m 'Pulled from upstream'
git push origin master
# Additionally the following should be made
grep 'centos_ver' -R . # check if there are any files that has el_ver
./debrand.sh
```
## Running tests

To run these tests on your local machine :
```
./runtests.sh
```

To only run a specific test ( eg. p_openssh ) :

```
./runtests.sh p_openssh
```

## Checking test scripts

Best way of checking if tests are correct is to run them on eurolinux 6, 7 and 8 vagrant boxes in conjunction with [el_buildtools/qa (that is our internal repo)](https://bit.ly/3DICLBY) scripts.

Simply:
```
git clone git@....el-buildtools.git --recurse-submodules
cd el-buildtools/qa
export PROFILE=<el6|el7|el8>
./run_vagrant.sh sig-core-t_functional/eurolinux_ci_build.sh
```
the same process is used on CI/CD sollution.

## Writing tests

There is a dedicated [wiki page](http://wiki.centos.org/QaWiki/AutomatedTests/WritingTests/t_functional)
covering that. As a newcomer, you should read this document from start to
finish.  
Questions/comments/suggestions should be voiced in the #centos-devel channel on Libera IRC, or via email on the centos-devel@centos.org mailing list.

## Disabling tests

While it's a very bad idea, sometimes , during major.minor release, our scripts
really find issues that are then repored upstream.  For the time being, one can
add tests to be skipped by our QA harness setup (validating all new installable
trees)

See the [skipped-tests.list](skipped-tests.list) file.
