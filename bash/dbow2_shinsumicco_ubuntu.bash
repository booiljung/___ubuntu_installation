#!/bin/bash

pushd .

mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/

rm -rf DBoW2

git clone https://github.com/shinsumicco/DBoW2
if [ "$?" != "0" ]; then
	echo "Cannot clone source" 1>&2
    popd
	exit 1
fi

cd DBoW2
#git checkout tags/v1.1-nonfree
if [ "$?" != "0" ]; then
	echo "Cannot checkout" 1>&2
    popd
	exit 1
fi

mkdir -p build
cd build

cmake ..
if [ "$?" != "0" ]; then
	echo "Cannot cmake" 1>&2
    popd
	exit 1
fi

make
if [ "$?" != "0" ]; then
	echo "Cannot make" 1>&2
    popd
	exit 1
fi

sudo make install
if [ "$?" != "0" ]; then
	echo "Cannot make install" 1>&2
    popd
	exit 1
fi

popd
