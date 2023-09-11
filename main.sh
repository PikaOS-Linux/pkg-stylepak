#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://github.com/refi64/stylepak
cp -rvf ./debian ./stylepak/
cd ./stylepak/

#
mkdir -p ./usr/bin
cp -rvf ./stylepak ./usr/bin
chmod 755 ./usr/bin/stylepak

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
