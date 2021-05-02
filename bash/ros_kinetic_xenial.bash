#!/bin/bash
# ROS 로봇프로그래밍 p26, p27
# reference: http://wiki.ros.org/melodic/Installation/Ubuntu

sudo apt install libqt4-dev -y

# NTP 설정 (Network Time Protocol)
#sudo apt install chrony ntpdate
#sudo ntpdate -q ntp.ubuntu.com

# Setup your computer to accept software from packages.ros.org.
sudo bash -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update
sudo apt install ros-kinetic-desktop-full -y

sudo apt install ros-kinetic-turtlesim -y
sudo apt install ros-kinetic-openni-launch -y
sudo apt install ros-kinetic-gazebo* -y
sudo apt install ros-kinetic-xpp -y

# uvc-camera
sudo apt install ros-kinetic-uvc-camera -y
sudo apt install ros-kinetic-image-* -y
sudo apt install ros-kinetic-camera-calibration -y

# Hitachi-LG Data Storage HLS-LFCD2
sudo apt install ros-kinetic-hls-lfcd-lds-driver -y

# rqt 플러그인 설치
sudo apt install ros-kinetic-rqt* -y

# opencv
sudo apt install ros-kinetic-cv-bridge -y
sudo apt install ros-kinetic-find-object-2d -y

# manipulator
sudo apt install ros-kinetic-ros-controllers -y
sudo apt install ros-kinetic-industrial-core -y
sudo apt install ros-kinetic-joint-state-publisher-gui -y

# open manipulator
sudo apt install ros-kinetic-ros-controllers -y
sudo apt install ros-kinetic-industrial* -y
sudo apt install ros-kinetic-joint-state* -y

# gazebo
sudo apt install ros-kinetic-gazebo* -y

# moveit!
sudo apt-get install ros-kinetic-moveit* -y

# realsense2
# reference: https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md
sudo apt adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" -u
sudo apt install librealsense2 -y
sudo apt install librealsense2-dkms -y
sudo apt install librealsense2-utils -y
sudo apt install librealsense2-dev -y
sudo apt install librealsense2-dbg -y
sudo apt install ros-kinetic-librealsense2 -y
sudo apt install ros-kinetic-realsense2-camera -y

# Before you can use ROS, you will need to initialize rosdep.
# rosdep enables you to easily install system dependencies for source you want to compile and is required to run some core components in ROS.
sudo rosdep init
rosdep update

# ros의 다양한 패키지를 인스톨 하는 프로그램
sudo apt install python-rosinstall -y

# It's convenient if the ROS environment variables are automatically added to your bash session every time a new shell is launched:
# 여러 버전의 ROS를 한 컴퓨터에 설치하고 스위칭 할 수 있다.
# source /opt/ros/kinetic/setup.bash
# source /opt/ros/melodic/setup.bash
echo '' >> ~/.bashrc
echo '# ROS' >> ~/.bashrc
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source /opt/ros/kinetic/setup.bash

bash ros_catkin_ws.bash

