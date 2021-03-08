#!/bin/bash
# eigen3_ubuntu.bash#first!

pushd .

sudo apt update
sudo apt upgrade -y libopenmpi-dev
sudo apt install -y build-essential
sudo apt install -y git cmake cmake-gui
sudo apt install -y libeigen3-dev
sudo apt install -y libgtk-3-dev libgtk2.0-dev
sudo apt install -y ffmpeg
sudo apt install -y libavcodec-dev libavformat-dev libavutil-dev
sudo apt install -y libswscale-dev libavresample-dev
sudo apt install -y libglew-dev libtiff5-dev zlib1g-dev libjpeg-dev
sudo apt install -y libpng12-dev libjasper-dev libavcodec-dev
sudo apt install -y libavformat-dev libavutil-dev libpostproc-dev
sudo apt install -y libswscale-dev libtbb-dev 
sudo apt install -y pkg-config
sudo apt install -y python-dev python-numpy python-py python-pytest
sudo apt install -y python3-dev python3-numpy python3-py python3-pytest

mkdir -p ~/linspace/opensource/
mkdir -p ~/linspace/opensource/opencv.github
rm -rf ~/linspace/opensource/opencv.github/opencv
rm -rf ~/linspace/opensource/opencv.github/opencv_contrib
rm -rf ~/linspace/opensource/opencv.github/build.linux


/usr/lib/x86_64-linux-gnu/openmpi/include


cd ~/linspace/opensource/opencv.github
git clone --recursive https://github.com/opencv/opencv.git
if [ "$?" != "0" ]; then
	echo "Cannot clone opencv" 1>&2
    popd
	exit 1
fi
cd opencv
git checkout tags/4.3.0
if [ "$?" != "0" ]; then
	echo "Cannot checkout opencv" 1>&2
    popd
	exit 1
fi

cd ~/linspace/opensource/opencv.github
git clone --recursive https://github.com/opencv/opencv_contrib.git
if [ "$?" != "0" ]; then
	echo "Cannot clone opencv_contrib" 1>&2
    popd
	exit 1
fi
cd opencv_contrib
git checkout tags/4.3.0
if [ "$?" != "0" ]; then
	echo "Cannot checkout opencv_contrib" 1>&2
    popd
	exit 1
fi

cd ~/linspace/opensource/opencv.github
mkdir -p build.linux
cd build.linux

cmake ~/linspace/opensource/opencv.github/opencv \
	-D Eigen3_DIR=/usr/local/share/eigen3/cmake \
	-D DWITH_EIGEN=True \
	-D DWITH_FFMPEG=True \
	-D DWITH_OPENMP=True \
	-D BUILD_PERF_TESTS=False \
	-D BUILD_TESTS=False \
	-D BUILD_opencv_python_tests=False \
	-D OPENCV_EXTRA_MODULES_PATH=~/linspace/opensource/opencv.github/opencv_contrib/modules \
	-D OPENCV_ENABLE_NONFREE=True \
	-D INSTALL_C_EXAMPLES=True \
	-D BUILD_opencv_ts=False \
	-D BUILD_JAVA=False \
	-D BUILD_PACKAGE=False \
	-D WITH_1394=False \
	-D WITH_GSTREAMER=False \
	-D WITH_LAPACK=False \
	-D WITH_VTK=False \
	-D WITH_CUDA=ON \
	-D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-11.0 \
	-D CUDA_ARCH_BIN='3.0 3.5 5.0 6.0 6.2' \
	-D CUDA_ARCH_PTX="" \
	-D BUILD_opencv_world=False
if [ "$?" != "0" ]; then
	echo "Cannot cmake" 1>&2
    popd
	exit 1
fi

make
if [ "$?" != "0" ]; then
	echo "Cannot make" 1>&2
    popd
	exit 1
fi

sudo make install

popd

