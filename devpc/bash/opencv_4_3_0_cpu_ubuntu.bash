#!/bin/bash
# eigen3_ubuntu.bash#first!

pushd .

sudo apt update
sudo apt upgrade -y
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
	-DEigen3_DIR=/usr/local/share/eigen3/cmake \
	-DDWITH_EIGEN=True \
	-DDWITH_FFMPEG=True \
	-DDWITH_OPENMP=True \
	-DBUILD_PERF_TESTS=False \
	-DBUILD_TESTS=False \
	-DBUILD_opencv_python_tests=False \
	-DBUILD_EXAMPLES=ON \
	-DOPENCV_EXTRA_MODULES_PATH=~/linspace/opensource/opencv.github/opencv_contrib/modules \
	-DOPENCV_ENABLE_NONFREE=True \
	-DBUILD_opencv_ts=False \
	-DBUILD_JAVA=False \
	-DBUILD_PACKAGE=False \
	-DWITH_1394=False \
	-DWITH_GSTREAMER=True \
	-DWITH_LAPACK=False \
	-DWITH_VTK=False \
	-DWITH_CUDA=OFF \
	-DBUILD_opencv_world=False
if [ "$?" != "0" ]; then
	echo "Cannot cmake" 1>&2
    popd
	exit 1
fi

make -j$(nproc)
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

sudo ln -s /usr/local/include/opencv4/opencv2 /usr/local/include/opencv2

sudo cp ~/linspace/opensource/opencv.github/build.linux/bin/* /usr/local/bin

popd

