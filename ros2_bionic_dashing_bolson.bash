#!/bin/bash
# https://index.ros.org/doc/ros2/Installation/Dashing/Linux-Install-Debians/

sudo apt update && sudo apt install curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'
sudo apt update
sudo apt -y install ros-dashing-desktop
sudo apt -y install ros-dashing-ros-base

source /opt/ros/dashing/setup.bash
sudo apt install python3-argcomplete
#ros2 run demo_nodes_cpp talker
#ros2 run demo_nodes_py listener

sudo apt update
sudo apt install -y ros-dashing-rmw-opensplice-cpp # for OpenSplice
sudo apt install -y ros-dashing-rmw-connext-cpp # for RTI Connext (requires license agreement)

sudo apt update
sudo apt install -y ros-dashing-ros1-bridge


