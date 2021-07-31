#!/bin/bash

bash mavsdk_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Failed to install mavsdk_ubuntu" 1>&2
	popd
	exit 1
fi

bash qgcs_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Failed to install qgcs_ubuntu" 1>&2
	popd
	exit 1
fi


