#!/usr/bin/bash

set -euo -o pipefail

# Prepare IPMITOOL Archive
mkdir -p ipmitool-IPMITOOL_1_8_19
# $ ls ipmitool-IPMITOOL_1_8_19/
# AUTHORS  bootstrap  ChangeLog  configure.ac  contrib  control  COPYING  csv-revision  doc  include  INSTALL  lib  Makefile.am  NEWS  README  src
cp -rf ../../AUTHORS ipmitool-IPMITOOL_1_8_19/
cp -rf ../../bootstrap ipmitool-IPMITOOL_1_8_19/
cp -rf ../../ChangeLog ipmitool-IPMITOOL_1_8_19/
cp -rf ../../configure.ac ipmitool-IPMITOOL_1_8_19/
cp -rf ../../contrib ipmitool-IPMITOOL_1_8_19/
cp -rf ../../control ipmitool-IPMITOOL_1_8_19/
cp -rf ../../COPYING ipmitool-IPMITOOL_1_8_19/
cp -rf ../../csv-revision ipmitool-IPMITOOL_1_8_19
cp -rf ../../doc ipmitool-IPMITOOL_1_8_19/
cp -rf ../../include ipmitool-IPMITOOL_1_8_19/
cp -rf ../../INSTALL ipmitool-IPMITOOL_1_8_19/
cp -rf ../../lib ipmitool-IPMITOOL_1_8_19/
cp -rf ../../Makefile.am ipmitool-IPMITOOL_1_8_19
cp -rf ../../NEWS ipmitool-IPMITOOL_1_8_19/
cp -rf ../../README ipmitool-IPMITOOL_1_8_19/
cp -rf ../../src ipmitool-IPMITOOL_1_8_19/

tar zcvf ipmitool-1.8.19.tar.gz ipmitool-IPMITOOL_1_8_19

ls -l ipmitool-1.8.19.tar.gz



docker build -t ipmitool-rocky9-builder -f Dockerfile.rocky9 .
cid=$(docker create ipmitool-rocky9-builder)
docker cp $cid:/root/rpmbuild/RPMS/ .
docker cp $cid:/root/rpmbuild/SRPMS/ .
docker rm -v $cid