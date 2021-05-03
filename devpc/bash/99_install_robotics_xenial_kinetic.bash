#!/bin/bash
pushd .

bash gazebo9_ubuntu_osr.bash
if [ "$?" != "0" ]; then
	echo "Failed to install gazebo9_ubuntu_osr" 1>&2
	popd
	exit 1
fi

bash ros_kinetic_xenial.bash
if [ "$?" != "0" ]; then
	echo "Failed to install ros_kinetic_xenial" 1>&2
	popd
	exit 1
fi

#bash realsense_ubuntu_notwork.bash// not works
#bash ros_realsense_ubuntu.bash// not works

popd


