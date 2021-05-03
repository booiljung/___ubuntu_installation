#!/bin/bash

pushd .

mkdir -p ~/linspace/opensource/
cd ~/linspace/opensource/
git clone https://github.com/khancyr/ardupilot_gazebo
cd ardupilot_gazebo
mkdir build
cd build
cmake ..
make -j4
sudo make install

popd
