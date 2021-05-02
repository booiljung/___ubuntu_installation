#!/bin/bash

pushd .

sudo apt install -y gfortran

mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/
rm -rf eigen

git clone https://gitlab.com/libeigen/eigen
if [ "$?" != "0" ]; then
	echo "Cannot download source" 1>&2
	popd
	exit 1
fi

git checkout 3.3.7
if [ "$?" != "0" ]; then
	echo "Cannot checkout 3.3.2" 1>&2
	popd
	exit 1
fi

cd eigen
mkdir build
if [ "$?" != "0" ]; then
	echo "Cannot mkdir build" 1>&2
	popd
	exit 1
fi

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
