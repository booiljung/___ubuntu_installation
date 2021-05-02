#!/bin/bash

# Not using
# replaced with https://launchpad.net/~mhier/+archive/ubuntu/libboost-latest

pushd .

mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/
rm -rf boost_1_73_0

wget https://dl.bintray.com/boostorg/release/1.73.0/source/boost_1_73_0.tar.bz2
if [ "$?" != "0" ]; then
	echo "Cannot download source" 1>&2
	popd
	exit 1
fi

tar --bzip2 -xf boost_1_73_0.tar.bz2
if [ "$?" != "0" ]; then
	echo "Cannot extract source" 1>&2
	popd
	exit 1
fi

cd boost_1_73_0
./bootstrap.sh
if [ "$?" != "0" ]; then
	echo "Cannot boostrap" 1>&2
	popd
	exit 1
fi

./b2
if [ "$?" != "0" ]; then
	echo "Cannot build" 1>&2
	popd
	exit 1
fi

sudo mv boost /usr/local/include
if [ "$?" != "0" ]; then
	echo "Cannot move files" 1>&2
	popd
	exit 1
fi

sudo mv stage/lib/cmake /usr/local/lib/cmake
if [ "$?" != "0" ]; then
	echo "Cannot move cmake files" 1>&2
	popd
	exit 1
fi

sudo mv stage/lib/* /usr/local/lib
if [ "$?" != "0" ]; then
	echo "Cannot move lib files" 1>&2
	popd
	exit 1
fi

cd ~/linspace/opensource/
rm -rf boost_1_73_0

popd


