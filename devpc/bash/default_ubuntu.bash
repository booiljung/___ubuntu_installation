#!/bin/bash

mkdir -p ~/linspace/opensource/

sudo hwclock -w --localtime

# change default package repository to kakao
sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

sudo apt update -y
sudo apt dist-upgrade -y

echo "alias cd~='cd ~'" >> ~/.bashrc
alias cd~='cd ~'

echo "alias cd..='cd ..'" >> ~/.bashrc
alias cd..='cd ..'

echo "alias cd...='cd ../..'" >> ~/.bashrc
alias cd...='cd ../..'

echo "alias cd....='cd ../../..'" >> ~/.bashrc
alias cd....='cd ../../..'

# system packages
sudo apt install -y curl
sudo apt install -y mkdir rm which
sudo apt install -y bash ssh
sudo apt install -y apt-transport-https
sudo apt install -y aptitude
sudo apt install -y tmux terminator
sudo apt install -y cpu-checker
sudo apt install -y fcitx
sudo apt install -y fcitx-ui-classic
sudo apt install -y fcitx-config-gtk
sudo apt install -y fcitx-frontend-gtk2
sudo apt install -y fcitx-frontend-gtk3
#sudo apt install -y fcitx-frontend-qt4
sudo apt install -y fcitx-frontend-qt5
sudo apt install -y fcitx-hangul
sudo apt install -y graphviz
sudo apt install -y nemo konqueror p7zip unzip vim pcmanfm
sudo apt install -y exfat-fuse exfat-utils gnome-tweaks gparted
sudo apt install -y sqlite3
sudo apt install -y clonezilla
sudo apt install -y graphviz
sudo apt install -y ffmpeg

# boost
sudo add-apt-repository ppa:mhier/libboost-latest
sudo apt-get update
sudo apt install -y libboost-all-dev

# dev tools and libraries
sudo apt install -y build-essential clang
sudo apt install -y git mercurial gitk git-gui
bash cmake_latest_ubuntu.bash
sudo apt install -y scons
sudo apt install -y gfortran
sudo apt install -y pkg-config
sudo apt install -y libeigen3-dev
sudo apt install -y libgoogle-glog-dev
sudo apt install -y libgl-dev
sudo apt install -y libglew-dev
sudo apt install -y libcanberra-gtk-module
sudo apt install -y libcanberra-gtk3-module
sudo apt install -y libgtk2.0-dev
sudo apt install -y libtool
sudo apt install -y libsndfile1
sudo apt install -y libeigen3-dev
sudo apt install -y libxml2 libxml2-dev
sudo apt install -y libpopt-dev
sudo apt install -y libogre-1.9-dev
sudo apt install -y libogre-2.1-dev
sudo apt install -y libxaw7-dev
sudo apt install -y libgles2-mesa-dev
sudo apt isntall -y libxt-dev
sudo apt install -y libzzip-dev
sudo apt install -y libfreetype-dev
sudo apt install -y libarmadillo-dev
sudo apt install -y libceres-dev
sudo apt install -y libflann-dev
sudo apt install -y libpng-dev
sudo apt install -y libjpeg-dev
sudo apt install -y libtiff-dev
sudo apt install -y libxxf86vm1
sudo apt install -y libxxf86vm-dev
sudo apt install -y libxi-dev
sudo apt install -y libxrandr-dev
sudo apt install -y libsdl2-dev
sudo apt install -y libavcodec-dev
sudo apt install -y libavformat-dev
sudo apt install -y libswscale-dev
sudo apt install -y libxvidcore-dev
sudo apt install -y libx264-dev
sudo apt install -y libxine2-dev
sudo apt install -y libv4l-dev
sudo apt install -y v4l-utils
sudo apt install -y libgstreamer1.0-dev
sudo apt install -y libgstreamer-plugins-base1.0-dev
sudo apt install -y mesa-utils
sudo apt install -y libgl1-mesa-dri
sudo apt install -y libgtkgl2.0-dev
sudo apt install -y libgtkglext1-dev
sudo apt install -y libdc1394-22-dev
sudo apt install -y libxvidcore-dev
sudo apt install -y x264
sudo apt install -y libgstreamer1.0-dev
sudo apt install -y libgstreamer-plugins-base1.0-dev
sudo apt install -y libatlas-base-dev
sudo apt install -y libeigen3-dev
sudo apt install -y ubuntu-restricted-extras
sudo apt install -y mingw-w64
sudo apt install -y libc++-dev
sudo apt install -y libc++abi-dev
sudo apt install -y libasound2-dev
sudo apt install -y libpulse-dev
sudo apt install -y libsdl2-dev

# for 64bits system
sudo apt install -y lib32z1
sudo apt install -y lib32ncurses5 lib32stdc++6
sudo apt install -y libc6:i386
sudo apt install -y libstdc++6:i386
sudo apt install -y lib32z1
sudo apt install -y libbz2-1.0:i386

# 32 bit compactable
sudo apt install -y libncurses5:i386
sudo apt install -y libncurses5-dev:i386

sudo apt install -y xz-utils

# gstreamer
sudo apt install -y libgstreamer1.0-0
sudo apt install -y libgstreamer1.0-dev
sudo apt install -y gstreamer1.0-tools
sudo apt install -y gstreamer1.0-doc
sudo apt install -y gstreamer1.0-x
sudo apt install -y gstreamer1.0-plugins-base
sudo apt install -y gstreamer1.0-plugins-good
sudo apt install -y gstreamer1.0-plugins-bad
sudo apt install -y gstreamer1.0-plugins-ugly
sudo apt install -y gstreamer1.0-alsa
sudo apt install -y gstreamer1.0-libav
sudo apt install -y gstreamer1.0-gl
sudo apt install -y gstreamer1.0-gtk3
sudo apt install -y gstreamer1.0-qt5
sudo apt install -y gstreamer1.0-pulseaudio
sudo apt install -y libgstreamer-plugins-base1.0-dev 

git config --global user.name "booiljung"
git config --global user.email booiljung@me.com
git config --global core.editor "gedit"

cat git_profile.txt >> ~/.bashrc

sudo apt install imwheel
cp imwheelrc.txt ~/.imwheelrc
imwheel --kill


