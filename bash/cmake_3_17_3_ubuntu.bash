#!/bin/bash

# openssl_1_1_1c_ubnutu.bash fist!

pushd .
mkdir -p ~/linspace/opensource/cmake.github/
cd ~/linspace/opensource/cmake.github/
rm -rf cmake-3.17.3
wget https://github.com/Kitware/CMake/releases/download/v3.17.3/cmake-3.17.3.tar.gz
if [ "$?" != "0" ]; then
	echo "Cannot download source" 1>&2
	popd
	exit 1
fi

tar -xf cmake-3.17.3.tar.gz
if [ "$?" != "0" ]; then
	echo "Cannot extract source" 1>&2
	popd
	exit 1
fi

cd cmake-3.17.3

./bootstrap
if [ "$?" != "0" ]; then
	echo "Cannot boostrap" 1>&2
	popd
	exit 1
fi

make -j4
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

