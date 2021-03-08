#!/bin/bash

pushd .

bash applications_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Failed to install applications_ubuntu" 1>&2
	popd
	exit 1
fi

popd
