#!/bin/bash
pushd .

sudo apt install build-essential -y
sudo apt-get install libfontconfig1 -y
sudo apt-get install mesa-common-dev -y

chmod +x ~/Downloads/qt-opensource-linux-x64-5.13.2.run
if [ "$?" != "0" ]; then
	echo "Cannot chmod +x source" 1>&2
	popd
	exit 1
fi

~/Downloads/qt-opensource-linux-x64-5.13.2.run
if [ "$?" != "0" ]; then
	echo "Cannot install" 1>&2
	popd
	exit 1
fi

cat qt5_profile.txt >> ~/.bashrc
source ~/.bashrc

popd
