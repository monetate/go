#!/usr/bin/env sh

set -e

VERSION=1.4.2.monetate2

yum install -y rpmdevtools yum-utils
yum-builddep go.spec | true
rpmdev-setuptree
spectool -R -g go.spec
mv rpmbuild/SOURCES/${VERSION} rpmbuild/SOURCES/${VERSION}.tar.gz
rpmbuild -bb go.spec
