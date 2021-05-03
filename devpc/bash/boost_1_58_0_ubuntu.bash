#!/bin/bash

# Not using
# replaced with https://launchpad.net/~mhier/+archive/ubuntu/libboost-latest

pushd .

mkdir ~/.tmp
cd ~/.tmp

wget -O boost_1_58_0.tar.gz https://sourceforge.net/projects/boost/files/boost/1.58.0/boost_1_58_0.tar.gz/download
if [ "$?" != "0" ]; then
	echo "Cannot download libboost" 1>&2
	popd
	exit 1
fi

tar xzvf boost_1_58_0.tar.gz
if [ "$?" != "0" ]; then
	echo "Cannot extract libboost tar file" 1>&2
	popd
	exit 1
fi

cd boost_1_58_0/

sudo apt-get update
sudo apt-get install build-essential g++ python-dev autotools-dev libicu-dev libbz2-dev libboost-all-dev

./bootstrap.sh --prefix=/usr/
if [ "$?" != "0" ]; then
	echo "Cannot boostrap libboost" 1>&2
	popd
	exit 1
fi

./b2
if [ "$?" != "0" ]; then
	echo "Cannot build libboost" 1>&2
	popd
	exit 1
fi

sudo ./b2 install
if [ "$?" != "0" ]; then
	echo "Cannot installl libboost" 1>&2
	popd
	exit 1
fi

popd


