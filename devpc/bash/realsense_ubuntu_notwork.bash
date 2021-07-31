#!/bin/bash
# 설치는 되지만 동작하지 않음.

# 빌드시 의존성
sudo apt install libusb-1.0-0-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev -y

# 리얼센스2 툴 및 라이브러리 설치

# realsense 패키지 저장소 서버 퍼블릭키를 등록합니다.
sudo apt-key adv --keyserver keys.gnupg.net --recv-key C8B3A55A6F3EFCDE
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C8B3A55A6F3EFCDE

# realsense 패키지 저장소를 등록 합니다.
sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u -y

# 패키지 관리자를 업데이트 합니다.
sudo apt update -y

# realsense 라이브러리를 설치 합니다.
sudo apt install librealsense2-dkms librealsense2-utils -y

# 선택적으로 개발자나 디버그를 위한 패키지를 설치 합니다.
sudo apt install librealsense2-dev librealsense2-dbg -y
