#!/bin/bash
# 작업공간 생성
if [ ! -d "~/catkin_ws/src" ] 
then
    pushd .
    mkdir -p ~/catkin_ws/src
    cd ~/catkin_ws/src
    catkin_init_workspace
    cd ~/catkin_ws/
    catkin_make
    popd
fi

echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/catkin_ws/devel/setup.bash

echo "alias cw='cd ~/catkin_ws'" >> ~/.bashrc
alias cw='cd ~/catkin_ws'

echo "alias cs='cd ~/catkin_ws/src'" >> ~/.bashrc
alias cs='cd ~/catkin_ws/src'

echo "alias cm='cd ~/catkin_ws & catkin_make'" >> ~/.bashrc
alias cm='cd ~/catkin_ws && catkin_make'

