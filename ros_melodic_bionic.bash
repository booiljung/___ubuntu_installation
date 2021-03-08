#!/bin/bash
# ROS 로봇프로그래밍 p26, p27
# reference: http://wiki.ros.org/melodic/Installation/Ubuntu

sudo apt install -y libqt4-dev 

# NTP 설정 (Network Time Protocol)
#sudo apt install -y chrony ntpdate 
#sudo ntpdate -q ntp.ubuntu.com

bash gazebo9_ubuntu_osrf.bash
#bash gazebo11_ubuntu_osrf.bash

# Setup your computer to accept software from packages.ros.org.
sudo bash -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update
sudo apt install -y ros-melodic-desktop-full

sudo apt install -y ros-melodic-turtlesim
sudo apt install -y ros-melodic-openni-launch

# uvc-camera
sudo apt install -y ros-melodic-uvc-camera
sudo apt install -y ros-melodic-image-*
sudo apt install -y ros-melodic-camera-calibration

# Hitachi-LG Data Storage HLS-LFCD2
sudo apt install -y ros-melodic-hls-lfcd-lds-driver

# rqt 플러그인 설치
sudo apt install -y ros-melodic-rqt*

# 
sudo apt install -y ros-melodic-cv-bridge
sudo apt install -y ros-melodic-find-object-2d

# manipulator
sudo apt install -y ros-melodic-ros-controllers
sudo apt install -y ros-melodic-gazebo-dev
sudo apt install -y ros-melodic-gazebo-msgs
sudo apt install -y ros-melodic-gazebo-plugins
sudo apt install -y ros-melodic-gazebo-ros
sudo apt install -y ros-melodic-gazebo-ros-control
sudo apt install -y ros-melodic-gazebo-ros-pkgs
sudo apt install -y ros-melodic-gazebo-*
sudo apt install -y ros-melodic-moveit-*
sudo apt install -y ros-melodic-industrial-core
sudo apt install -y ros-melodic-joint-state-publisher-gui

# mavros
sudo apt install -y ros-melodic-mavros ros-melodic-mavros-extras

# octomap
sudo apt install -y libpcl1 ros-melodic-octomap-*

#bash ros_realsense_melodic_bionic.bash

# Before you can use ROS, you will need to initialize rosdep.
# rosdep enables you to easily install system dependencies for source you want to compile and is required to run some core components in ROS.

sudo apt install -y python-rosdep
rosdep init
rosdep update

# ros의 다양한 패키지를 인스톨 하는 프로그램
sudo apt install -y python-rosinstall

# It's convenient if the ROS environment variables are automatically added to your bash session every time a new shell is launched:
# 여러 버전의 ROS를 한 컴퓨터에 설치하고 스위칭 할 수 있다.
# source /opt/ros/kinetic/setup.bash
# source /opt/ros/melodic/setup.bash
echo '' >> ~/.bashrc
echo '# ROS melodic' >> ~/.bashrc
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source /opt/ros/melodic/setup.bash

bash ros_catkin_ws.bash

