#!/bin/bash

pushd .
mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/
git clone https://github.com/catchorg/Catch2
cd Catch2
mkdir build
cd build
cmake ..
make
sudo make install
popd
