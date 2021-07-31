#!/bin/bash

pushd .

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

#bash cmake_3_17_3_ubuntu.bash
#if [ "$?" != "0" ]; then
#	echo "Failed to install cmake_3_17_3_ubuntu" 1>&2
#	popd
#	exit 1
#fi
bash cmake_bionic.bash

bash nlohmann_json_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Failed to install nlohmann_json_ubuntu" 1>&2
	popd
	exit 1
fi

bash opencv_4_3_0_cuda_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Failed to install opencv_4_3_0_cuda_ubuntu" 1>&2
	popd
	exit 1
fi

popd
