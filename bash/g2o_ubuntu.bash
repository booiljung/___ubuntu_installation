#!/bin/bash

sudo apt install -y libsuitesparse-dev
sudo apt install -y qtdeclarative5-dev
sudo apt install -y qt5-qmake
sudo apt install -y libqglviewer-dev-qt5
sudo apt install -y libatlas-base-dev libsuitesparse-dev

pushd .

mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/
rm -rf g2o

git clone https://github.com/RainerKuemmerle/g2o
if [ "$?" != "0" ]; then
	echo "Cannot download source" 1>&2
	popd
	exit 1
fi

cd g2o
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
