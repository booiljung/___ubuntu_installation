#!/bin/bash
pushd .

cd ~

wget -c https://github.com/mavlink/MAVSDK/releases/download/v0.28.0/mavsdk_0.28.0_ubuntu18.04_amd64.deb
if [ "$?" != "0" ]; then
	echo "Failed to download mavsdk" 1>&2
	popd
	exit 1
fi

sudo dpkg -i ~/mavsdk_0.28.0_ubuntu18.04_amd64.deb
if [ "$?" != "0" ]; then
	echo "Failed to install mavsdk" 1>&2
	popd
	exit 1
fi

#
# install simulator
#

pushd .

sudo apt install libgazebo9 libgazebo9-dev
if [ "$?" != "0" ]; then
	echo "Failed to install mavsdk Firmware simulator depencency" 1>&2
	popd
	exit 1
fi

mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/

git clone https://github.com/PX4/Firmware.git --recursive
if [ "$?" != "0" ]; then
	echo "Failed to clone mavsdk Firmware simulator" 1>&2
	popd
	exit 1
fi

cd Firmware

bash ./Tools/setup/ubuntu.sh --no-nuttx
if [ "$?" != "0" ]; then
	echo "Failed to install mavsdk Firmware simulator" 1>&2
	popd
	exit 1
fi

popd

popd

