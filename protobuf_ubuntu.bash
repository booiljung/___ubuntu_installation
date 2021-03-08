#!/bin/bash
# referenced https://github.com/protocolbuffers/protobuf/blob/master/src/README.md

pushd .

sudo apt install -y autogen autoconf libtool curl make g++ unzip
if [ "$?" != "0" ]; then
	echo "Cannot install dependencies" 1>&2
    popd
	exit 1
fi

mkdir -p ~/linpspace/opensource/
if [ "$?" != "0" ]; then
	echo "Cannot mkdir ~/linspace/opensource/" 1>&2
    popd
	exit 1
fi

cd ~/linspace/opensource/

git clone https://github.com/google/protobuf.git
if [ "$?" != "0" ]; then
	echo "Cannot clone source" 1>&2
    popd
	exit 1
fi

cd protobuf

git submodule update --init --recursive
if [ "$?" != "0" ]; then
	echo "Cannot clone submodules" 1>&2
    popd
	exit 1
fi

sh ./autogen.sh
if [ "$?" != "0" ]; then
	echo "Cannot autogen" 1>&2
    popd
	exit 1
fi

./configure
if [ "$?" != "0" ]; then
	echo "Cannot configure" 1>&2
    popd
	exit 1
fi

make
if [ "$?" != "0" ]; then
	echo "Cannot make" 1>&2
    popd
	exit 1
fi

make check
if [ "$?" != "0" ]; then
	echo "Cannot make check" 1>&2
    popd
	exit 1
fi

sudo make install
make
if [ "$?" != "0" ]; then
	echo "Cannot make install" 1>&2
    popd
	exit 1
fi

sudo ldconfig # refresh shared library cache.
make
if [ "$?" != "0" ]; then
	echo "Cannot ld config" 1>&2
    popd
	exit 1
fi

popd

