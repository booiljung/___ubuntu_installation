#!/bin/bash

pushd .

mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/
rm -rf ceres-solver

git clone https://github.com/ceres-solver/ceres-solver
if [ "$?" != "0" ]; then
	echo "Cannot download source" 1>&2
	popd
	exit 1
fi

cd ceres-solver
mkdir build
if [ "$?" != "0" ]; then
	echo "Cannot make build folder" 1>&2
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
