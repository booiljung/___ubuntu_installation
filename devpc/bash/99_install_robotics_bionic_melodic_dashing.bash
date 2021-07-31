#!/bin/bash
pushd .

bash gazebo9_ubuntu_osr.bash
if [ "$?" != "0" ]; then
	echo "Failed to install gazebo9_ubuntu_osr" 1>&2
	popd
	exit 1
fi

bash ros_melodic_bionic.bash
if [ "$?" != "0" ]; then
	echo "Failed to install ros_melodic_bionic" 1>&2
	popd
	exit 1
fi

bash ros_network.bash
if [ "$?" != "0" ]; then
	echo "Failed to settings ros_networks" 1>&2
	popd
	exit 1
fi

bash ros_melodic_turtlebot3_bionic.bash
if [ "$?" != "0" ]; then
	echo "Failed to install ros_melodic_turtlebot3_bionic" 1>&2
	popd
	exit 1
fi

bash ros2_bionic.bash
if [ "$?" != "0" ]; then
	echo "Failed to install ros2_bionic" 1>&2
	popd
	exit 1
fi

bash ros2_dashing_bionic.bash
if [ "$?" != "0" ]; then
	echo "Failed to install ros2_dashing_bionic" 1>&2
	popd
	exit 1
fi

popd
