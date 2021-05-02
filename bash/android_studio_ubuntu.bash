#!/bin/bash
# Android Studio

pushd .

#sudo apt install -y qeum-kvm
#if [ "$?" != "0" ]; then
#	echo "Failed to install by apt" 1>&2
#	popd
#	exit 1
#fi

sudo apt install -y cpu-checker
if [ "$?" != "0" ]; then
	echo "Failed to install by apt android_studio_ubuntu" 1>&2
	popd
	exit 1
fi

sudo add-apt-repository ppa:maarten-fonville/android-studio
if [ "$?" != "0" ]; then
	echo "Failed to add apt android_studio_ubuntu" 1>&2
	popd
	exit 1
fi

sudo apt -y update
if [ "$?" != "0" ]; then
	echo "Failed to install android_studio_ubuntu" 1>&2
	popd
	exit 1
fi

sudo apt install -y android-studio

cat android_studio_bashrc.txt >> ~/.bashrc

source ~/.bashrc

popd
