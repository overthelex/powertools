#!/bin/bash
# Build powertools .deb package
set -e

VERSION=$(grep '^Version:' debian/control | awk '{print $2}')
PKG="powertools-${VERSION}"
DEB="powertools_${VERSION}_all.deb"

rm -rf /tmp/$PKG
mkdir -p /tmp/$PKG/DEBIAN
mkdir -p /tmp/$PKG/usr/local/bin
mkdir -p /tmp/$PKG/usr/local/sbin
mkdir -p /tmp/$PKG/etc/bash_completion.d

cp debian/control /tmp/$PKG/DEBIAN/
cp bin/*           /tmp/$PKG/usr/local/bin/
cp sbin/*          /tmp/$PKG/usr/local/sbin/
cp completion/*    /tmp/$PKG/etc/bash_completion.d/

chmod 755 /tmp/$PKG/usr/local/bin/*
chmod 755 /tmp/$PKG/usr/local/sbin/*

dpkg-deb --build /tmp/$PKG /tmp/$DEB
echo "Built /tmp/$DEB"
