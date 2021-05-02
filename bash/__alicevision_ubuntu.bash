#!/bin/bash

for alicevision
sudo apt install libopenimageio-dev
sudo apt install libturbojpeg


pushd .

sudo apt install libsquish

mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/
wget https://github.com/OpenImageIO/oiio/archive/Release-2.1.16.0.tar.gz
tar -xf Release-2.1.16.0.tar.gz
cd oiio-Release-2.1.16.0
mkdir build
cd build
cmake ..


popd




wget https://download.mosek.com/stable/9.2.10/mosektoolslinux64x86.tar.bz2
tar -xf mosektoolslinux64x86.tar.bz2
cd mosek/9.2







