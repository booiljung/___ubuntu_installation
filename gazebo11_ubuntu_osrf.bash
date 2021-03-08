#!/bin/bash

# install gazebo from orf
# reference: https://ardupilot.org/dev/docs/using-gazebo-simulator-with-sitl.html

sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt update

sudo apt install libgazebo11 -y
sudo apt install libgazebo11-dev -y
sudo apt install gazebo11-common -y
sudo apt install gazebo11-plugin-base -y
sudo apt install gazebo11 -y

