#!/bin/bash
pushd .

sudo apt install -y speech-dispatcher libudev-dev libsdl2-dev
if [ "$?" != "0" ]; then
	echo "Failed to install dependency for qgcs" 1>&2
	popd
	exit 1
fi

popd


