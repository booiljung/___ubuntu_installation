#!/bin/bash
pushd .

sudo apt install -y libgl1-mesa-dev
sudo apt install -y libglew-dev
sudo apt install -y pkg-config
sudo apt install -y libegl1-mesa-dev libwayland-dev libxkbcommon-dev wayland-protocols
sudo apt install -y ffmpeg libavcodec-dev libavutil-dev libavformat-dev libswscale-dev libavdevice-dev
sudo apt install -y libjpeg-dev libpng12-dev libtiff5-dev libopenexr-dev

mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/
rm -rf Pangolin

git clone https://github.com/stevenlovegrove/Pangolin.git
if [ "$?" != "0" ]; then
	echo "Cannot clone source" 1>&2
    popd
	exit 1
fi

cd Pangolin
mkdir -p build
cd build

cmake ..
if [ "$?" != "0" ]; then
	echo "Cannot cmake" 1>&2
    popd
	exit 1
fi

make -j8
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
