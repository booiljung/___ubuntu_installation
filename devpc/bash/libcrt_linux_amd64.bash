#!/bin/bash
pushd .

mkdir -p ~/Downloads/libcrtc-v1.0.0-linux-arm64/
cd ~/Downloads/libcrtc-v1.0.0-linux-arm64/

wget https://github.com/vmolsa/libcrtc/releases/download/v1.0.0/libcrtc-v1.0.0-linux-arm64.tar.gz
if [ "$?" != "0" ]; then
	echo "Failed to install cuda_toolkit_bionic" 1>&2
	popd
	exit 1
fi

tar -xvf libcrtc-v1.0.0-linux-arm64.tar.gz

sudo cp ./include/crtc.h /usr/local/include/crtc.h
if [ "$?" != "0" ]; then
	echo "Failed to install cuda_toolkit_bionic" 1>&2
	rm -rf ~/Downloads/libcrtc-v1.0.0-linux-arm64/
	popd
	exit 1
fi

sudo cp ./lib/libcrtc.so /usr/local/lib/libcrtc.so.1.0.0
if [ "$?" != "0" ]; then
	echo "Failed to install cuda_toolkit_bionic" 1>&2
	rm -rf ~/Downloads/libcrtc-v1.0.0-linux-arm64/
	popd
	exit 1
fi

sudo ln -s /usr/local/lib/libcrtc.so.1.0.0 /usr/local/lib/libcrtc.so
if [ "$?" != "0" ]; then
	echo "Failed to install cuda_toolkit_bionic" 1>&2
	rm -rf ~/Downloads/libcrtc-v1.0.0-linux-arm64/
	popd
	exit 1
fi

rm -rf ~/Downloads/libcrtc-v1.0.0-linux-arm64/
if [ "$?" != "0" ]; then
	echo "Failed to install cuda_toolkit_bionic" 1>&2
	popd
	exit 1
fi

popd


