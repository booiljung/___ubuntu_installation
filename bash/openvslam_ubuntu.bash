#!/bin/bash
# Installation guide
# https://openvslam.readthedocs.io/en/master/installation.html

# basic dependencies
sudo apt install -y build-essential pkg-config cmake git wget curl unzip
sudo apt install -y libyaml-cpp-dev libgoogle-glog-dev libgflags-dev

# 
# cmake_3_17_3_ubuntu.bash
# boost_ubuntu.bash
# ceres_ubuntu.bash
# eigen3_ubuntu.bash#3.3<=?
# g2o_ubuntu.bash#first
# opencv_ubuntu.bash#first #4.0<=?
# dbow2_shinsumicco_ubuntu.bash
# yamlcpp_ubuntu.bash
# nlohmann_json_ubuntu.bash
# socket_io_client.bash
# pangolin_ubuntu.bash
# colmap_ubuntu.bash
#

pushd .

sudo apt install -y libgoogle-glog-dev libgflags-dev
sudo apt install -y autogen autoconf libtool

mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/

rm -rf openvslam

git clone https://github.com/xdspacelab/openvslam
if [ "$?" != "0" ]; then
	echo "Cannot clone source" 1>&2
    popd
	exit 1
fi

cd openvslam
mkdir build
cd build
if true; then
	cmake .. \
		-DBUILD_WITH_MARCH_NATIVE=ON \
		-DUSE_PANGOLIN_VIEWER=ON \
		-DUSE_SOCKET_PUBLISHER=OFF \
		-DUSE_STACK_TRACE_LOGGER=ON \
		-DBOW_FRAMEWORK=DBoW2 \
		-DBUILD_TESTS=ON
else
	cmake .. \
		-DBUILD_WITH_MARCH_NATIVE=ON \
		-DUSE_PANGOLIN_VIEWER=OFF \
		-DUSE_SOCKET_PUBLISHER=ON \
		-DUSE_STACK_TRACE_LOGGER=ON \
		-DBOW_FRAMEWORK=DBoW2 \
		-DBUILD_TESTS=ON
fi
if [ "$?" != "0" ]; then
	echo "Cannot cmake" 1>&2
	popd
	exit 1
fi

make -j4
if [ "$?" != "0" ]; then
	echo "Cannot make" 1>&2
    popd
	exit 1
fi

sudo make install
if [ "$?" != "0" ]; then
	echo "Cannot make install" 1>&2
    popd
	exit 1
fi

popd
