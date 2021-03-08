#!/bin/bash
pushd .

mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/
rm -rf json

git clone https://github.com/nlohmann/json
if [ "$?" != "0" ]; then
	echo "Cannot clone source" 1>&2
    popd
	exit 1
fi

cd json
mkdir -p build
cd build

cmake ..
if [ "$?" != "0" ]; then
	echo "Cannot cmake" 1>&2
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
