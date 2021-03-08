#!/bin/bash
sudo apt install build-essential checkinstall zlib1g-dev -y

pushd .

mkdir -p ~/linspace/opensource/openssl.github
cd ~/linspace/opensource/openssl.github

sudo wget https://www.openssl.org/source/openssl-1.1.1c.tar.gz
if [ "$?" != "0" ]; then
	echo "Cannot download source" 1>&2
	popd
	exit 1
fi

sudo tar -xf openssl-1.1.1c.tar.gz
if [ "$?" != "0" ]; then
	echo "Cannot extract source" 1>&2
	popd
	exit 1
fi

cd openssl-1.1.1c
if [ "$?" != "0" ]; then
	echo "Cannot cd openssl-1.1.1c" 1>&2
	popd
	exit 1
fi

sudo ./config
if [ "$?" != "0" ]; then
	echo "Cannot config" 1>&2
	popd
	exit 1
fi

sudo make -4
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
