#!/bin/bash
pushd .

mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/
rm -rf socket.io-client-cpp

git clone https://github.com/shinsumicco/socket.io-client-cpp
if [ "$?" != "0" ]; then
	echo "Cannot clone source" 1>&2
    popd
	exit 1
fi
cd socket.io-client-cpp

git submodule init
if [ "$?" != "0" ]; then
	echo "Cannot submodule init" 1>&2
    popd
	exit 1
fi

git submodule update
if [ "$?" != "0" ]; then
	echo "Cannot submodule update" 1>&2
    popd
	exit 1
fi

mkdir -p build & cd build

cmake \
    -DBUILD_UNIT_TESTS=OFF \
    ..
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
