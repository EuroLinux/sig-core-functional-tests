This Code is written for and used in the CentOS Automated QA tests process. We welcome all contributions.

See the doc directory for additional information on test writing.

## Pulling from upstream
```bash
git remote add upstream git@github.com:CentOS/sig-core-t_functional.git
git pull upstream master
... # RESOLVE CONFLICTS
git add . 
git commit -m 'Pulled from upstream'
git push origin master
# Additionally the following should be made
grep 'el_ver' -R . # check if there are any files that has el_ver
./debrand.sh
```
## Running tests

To run these tests on your local machine :
```
./runtests.sh
```

To only run a specific test ( e.g. p_openssh ) : 
```
./runtests.sh p_openssh
```

## Checking test scripts

Best way of checking if tests are correct is to run them on eurolinux 6 and 7 vagrant boxes in conjunction with [el_buildtools/qa](https://git.bel.lan/tools/el-buildtools/-/tree/master/qa) scripts.  
Simply:
```
git clone git@git.bel.lan:tools/el-buildtools.git --recurse-submodules
cd el-buildtools/qa
export PROFILE=<el6|el7>
./run_vagrant.sh sig-core-t_functional/eurolinux_ci_build.sh
```
exactly the same process is used on jenkins.
## Writing tests

There is a dedicated [wiki page](http://wiki.centos.org/QaWiki/AutomatedTests/WritingTests/t_functional) covering that. As a newcomer, you should read this document from start to finish. 
Questions/comments/suggestions should be voiced in the #centos-devel channel on Libera IRC, or via email on the centos-devel@centos.org mailing list.

## Disabling tests

While it's a very bad idea, sometimes, during major.minor release, our scripts really find issues that are then reported upstream.
For the time being, one can add tests to be skipped by our QA harness setup (validating all new installable trees)

See the [skipped-tests.list](skipped-tests.list) file.
