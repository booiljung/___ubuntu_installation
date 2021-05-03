#!/bin/bash
pushd .

sudo apt install build-essential -y
sudo apt-get install libfontconfig1 -y
sudo apt-get install mesa-common-dev -y

mkdir -p ~/Downloads
cd ~/Downloads

wget http://download.qt.io/official_releases/qt/5.13/5.13.2/qt-opensource-linux-x64-5.13.2.run
if [ "$?" != "0" ]; then
	echo "Cannot download source" 1>&2
	popd
	exit 1
fi

chmod +x qt-opensource-linux-x64-5.13.2.run
if [ "$?" != "0" ]; then
	echo "Cannot chmod +x source" 1>&2
	popd
	exit 1
fi

./qt-opensource-linux-x64-5.13.2.run
if [ "$?" != "0" ]; then
	echo "Cannot install" 1>&2
	popd
	exit 1
fi

cat qt5.13.2_profile.txt >> ~/.bashrc
source ~/.bashrc

popd



