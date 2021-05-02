#!/bin/bash

pushd .

cd ~

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
if [ "$?" != "0" ]; then
	echo "Downloading apt pin was failed" 1>&2
	popd
	exit 1
fi

sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
if [ "$?" != "0" ]; then
	echo "Moving apt pin was failed" 1>&2
	popd
	exit 1
fi

sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
if [ "$?" != "0" ]; then
	echo "Addition of apt-key was failed" 1>&2
	popd
	exit 1
fi

sudo add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"
if [ "$?" != "0" ]; then
	echo "Addiction of apt repository was failed" 1>&2
	popd
	exit 1
fi

sudo apt-get update

sudo apt-get -y install cuda
if [ "$?" != "0" ]; then
	echo "Installation of cuda was failed" 1>&2
	popd
	exit 1
fi

popd
