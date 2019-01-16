#!/usr/bin/python -tt
'''
Author: Brian Stinson <brian@bstinson.com>
Check rpminfo attributes that must be set before release in the repositories (e.g. Vendor, Packager)
'''

from __future__ import print_function, with_statement
import os
import sys
import yum

from datetime import datetime
from fnmatch import fnmatch

print ("TODO This test is not perfect due to EuroLinux overides!")
print ("TODO This test is not perfect due to EuroLinux overides - KOJI AND packager")
def log(methodstring):
    localtime = datetime.now()
    print("[+] {0} -> {1}".format(localtime.strftime("%a %b %e %H:%M:%S %Z %Y"), methodstring))


def fail(failstring):
    log('FAIL {0}'.format(failstring))

def info(failstring):
    log('INFO {0}'.format(failstring))

def skip(skipstring):
    log('SKIP {0}'.format(skipstring))

log('Running check-rpminfo.py - Check rpminfo Attributes')

# Set the required attributes and their values here. You may use shell-style
# globs in the value if necessary.
required_attrs = {
    'vendor': ['Scientific Linux', 'EuroLinux'],
    'packager': ['Scientific Linux', 'EuroLinux', '(none)', 'Koji'],
    }

# special_overrides is a dictionary of packages and a list of attributes
# to ignore for that package. When updating this list add a comment to
# the line describing why the override is in place
special_overrides = {
    'epel-release': ['vendor', 'packager'],                   #Rebuilt directly from Fedora, so the vendor remains Fedora Project
    'redhat-support-lib-python': ['vendor'],
    'redhat-support-tool': ['vendor'],
    'redhat-support-tool': ['vendor'],
    'redhat-support-tool': ['vendor'],
    'redhat-support-tool': ['vendor'],
    'redhat-support-tool': ['vendor'],
    'insights-client': ['vendor'],
    'el-logos': ['vendor'],
    'el-bookmarks': ['vendor'],
    'rhnsd': ['vendor'],
    'el-indexhtml': ['vendor'],
    'rhnlib': ['vendor'],
    'rhnsd': ['vendor'],
    'rhnsd-debuginfo': ['vendor'],
    'yum-rhn-plugin': ['vendor'],
#'insights-client-3.0.3-8.el7.noarch.rpm': ['vendor'],
#'el-logos-70.0.5-0.0.el7.noarch.rpm': ['vendor'],
#'el-bookmarks-7-1.el7.noarch.rpm': ['vendor'],
#'rhnsd-5.0.15-2.el7.x86_64.rpm': ['vendor'],
#'el-indexhtml-7-3.3.el7.noarch.rpm': ['vendor'],
#'rhnlib-2.5.75-2.el7.noarch.rpm': ['vendor'],
#'rhnsd-debuginfo-5.0.15-2.el7.x86_64.rpm': ['vendor'],
#'yum-rhn-plugin-2.3.3-4.el7.noarch.rpm': ['vendor'],
    }

# you can also add the NVR, and the attribute to ignore to the special_overrides.txt file
with open(os.path.join(sys.path[0],'special_overrides.txt'),'r') as thefile:
    for line in thefile.readlines():
        if not line.strip() or line.startswith('#'):
            continue
        pkg, ignoreattr = map(str.strip,line.split(':'))
        special_overrides.setdefault(pkg, []).append(ignoreattr)

yb = yum.YumBase()
yb.conf.cache = 0

yb.repos.doSetup()
log("Checking repos: {0}".format(', '.join([r.name for r in yb.repos.listEnabled()])))

sack = yb.pkgSack

finalret = 0
for pkg in sack:
    for attr, val in required_attrs.iteritems():
        nvr = '{0}-{1}-{2}'.format(pkg['name'], pkg['version'], pkg['release'])
        nvra = '{0}-{1}-{2}.{3}'.format(pkg['name'], pkg['version'], pkg['release'], pkg['arch'])
        if pkg.name in special_overrides:
            if attr in special_overrides[pkg.name]:
                skip('{0}: {1} listed in special_overrides'.format(pkg.remote_path, attr))
                continue
        elif nvr in special_overrides:
            if attr in special_overrides[nvr]:
                skip('{0}: {1} listed in special_overrides'.format(pkg.remote_path, attr))
                continue
        elif nvra in special_overrides:
            if attr in special_overrides[nvra]:
                skip('{0}: {1} listed in special_overrides'.format(pkg.remote_path, attr))
                continue

        if not pkg[attr]:
            if attr != "packager":
                fail('{0}: Missing {1}'.format(pkg.remote_path, attr))
                finalret = 1
                continue
            else:
# The problem with EuroLinux is that we never made packager macro before
                info('{0}: Missing {1} - will forget it this time ;)'.format(pkg.remote_path, attr))
                continue

        if isinstance(val, list):
            not_ok_flag=True
            for j in val:
                if fnmatch(str.upper(pkg[attr]), str.upper(j)):
                   not_ok_flag=False 
            if not_ok_flag:  
                finalret = 1
                fail('{0}: {1}: {2} does not match any of {3}'.format(pkg.remote_path, attr, pkg[attr], val))
        else:
            if not fnmatch(str.upper(pkg[attr]), str.upper(val)):
                fail('{0}: {1}: {2} does not match {3}'.format(pkg.remote_path, attr, pkg[attr], val))
                finalret = 1

sys.exit(finalret)
