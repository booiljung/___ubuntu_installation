#!/bin/bash

sudo apt install -y libeigen3-dev
sudo apt install -y libglog-dev
sudo apt install -y libgl-dev
sudo apt install -y libglew-dev

# 1. build libceres

pushd .

mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/

git clone https://github.com/colmap/colmap

cd colmap

mkdir build
cd build
cmake .. -DCUDA_ENABLED=OFF
make
sudo make install

popd



