#!/bin/bash
pushd .

bash cmake_3_17_3_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Cannot build cmake" 1>&2
    popd
	exit 1
fi

#
# replaced with 
# sudo add-apt-repository ppa:mhier/libboost-latest
# sudo apt-get update
# bash boost_1_73_0_ubuntu.bash
#if [ "$?" != "0" ]; then
#	echo "Failed to install boost_ubuntu" 1>&2
#	popd
#	exit 1
#fi
#

bash ceres_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Cannot build ceres" 1>&2
    popd
	exit 1
fi

bash eigen3_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Cannot build eigen3" 1>&2
    popd
	exit 1
fi

bash g2o_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Cannot build g2o" 1>&2
    popd
	exit 1
fi

bash opencv_4_3_0_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Cannot build opencv" 1>&2
    popd
	exit 1
fi

bash dbow2_shinsumicco_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Cannot build dbow2" 1>&2
    popd
	exit 1
fi

bash yamlcpp_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Cannot build yamlcpp" 1>&2
    popd
	exit 1
fi

bash nlohmann_json_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Cannot build nlohmann json" 1>&2
    popd
	exit 1
fi

bash pangolin_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Cannot build pangolin" 1>&2
    popd
	exit 1
fi

bash colmap_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Cannot build colmap" 1>&2
    popd
	exit 1
fi

bash openvslam_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Cannot build openvslam" 1>&2
    popd
	exit 1
fi

popd

