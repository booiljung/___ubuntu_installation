#!/bin/bash
# ros realsense
# reference: https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md
sudo apt adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u
sudo apt update
sudo apt install -y librealsense2 librealsense2-dkms librealsense2-utils librealsense2-dev
 librealsense2-dbg ros-melodic-librealsense2 ros-melodic-realsense2-camera

