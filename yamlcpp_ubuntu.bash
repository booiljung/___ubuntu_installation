#!/bin/bash
pushd .

mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/
rm -rf Pangolin

git clone https://github.com/jbeder/yaml-cpp
if [ "$?" != "0" ]; then
	echo "Cannot clone source" 1>&2
    popd
	exit 1
fi

cd yaml-cpp
mkdir -p build
cd build

cmake .. -D YAML_BUILD_SHARED_LIBS=ON
if [ "$?" != "0" ]; then
	echo "Cannot cmake" 1>&2
    popd
	exit 1
fi

make -j8
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
