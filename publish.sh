#!/bin/bash
# Build, upload to apt.highfunk.uk, and regenerate repo index
set -e

cd "$(dirname "$0")"

VERSION=$(grep '^Version:' debian/control | awk '{print $2}')
DEB="powertools_${VERSION}_all.deb"

# Build
./build.sh

# Upload and regenerate index
scp /tmp/$DEB mail.s0me.uk:/tmp/
ssh mail.s0me.uk "sudo cp /tmp/$DEB /var/www/apt.highfunk.uk/pool/ && \
  cd /var/www/apt.highfunk.uk && \
  sudo dpkg-scanpackages pool /dev/null | sudo tee Packages | gzip | sudo tee Packages.gz > /dev/null"

echo "Published $DEB to apt.highfunk.uk"
echo "Run: sudo apt update && sudo apt install powertools"
