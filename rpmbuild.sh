#!/usr/bin/env sh

set -e

VERSION=1.4.2.monetate4

yum install -y rpmdevtools yum-utils
yum-builddep go.spec | true
rpmdev-setuptree
spectool -R -g go.spec
mv /root/rpmbuild/SOURCES/${VERSION} /root/rpmbuild/SOURCES/${VERSION}.tar.gz
rpmbuild -bb go.spec
