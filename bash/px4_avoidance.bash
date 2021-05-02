#!/bin/bash

pushd .

# dependance: ROS melodic

sudo apt install ros-melodic-mavros ros-melodic-mavros-extras -y

sudo apt install libopencv*

sudo apt install python-catkin-tools
mkdir -p ~/catkin_ws/src

mkdir -p ~/.cache
cd ~/.cache

wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
chmod +x install_geographiclib_datasets.sh
sudo ./install_geographiclib_datasets.sh

cd ~/catkin_ws/src
git clone https://github.com/PX4/avoidance.git

cd ~/catkin_ws/
catkin_make
catkin_make--cmake-args -DCMAKE_BUILD_TYPE=Release

echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Run the Avoidance Gazebo Simulation

## Clone the PX4 Firmware and all its submodules (it may take some time).

cd ~
git clone https://github.com/PX4/Firmware.git --recursive
cd ~/Firmware

## Install PX4 dependencies.

### Install PX4 "common" dependencies.

./Tools/setup/ubuntu.sh --no-sim-tools --no-nuttx

### Gstreamer plugins (for Gazebo camera)

sudo apt install gstreamer1.0-plugins-bad gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly libgstreamer-plugins-base1.0-dev

sudo apt update
sudo apt upgrade

# Build the Firmware once in order to generate SDF model files for Gazebo. This step will actually run a simulation (that you can immediately close).

#### This is necessary to prevent some Qt-related errors (feel free to try to omit it)

echo "export QT_X11_NO_MITSHM=1" >> ~/.bashrc

#### Build and run simulation

make px4_sitl_default gazebo

#### Quit the simulation (Ctrl+C)

#### Setup some more Gazebo-related environment variables (modify this line based on the location of the Firmware folder on your machine)

. ~/Firmware/Tools/setup_gazebo.bash ~/Firmware ~/Firmware/build/px4_sitl_default

### Add the Firmware directory to ROS_PACKAGE_PATH so that ROS can start PX4:

echo "export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/Firmware" >> ~/.bashrc

### Finally, set the GAZEBO_MODEL_PATH in your bashrc:

echo "export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:~/catkin_ws/src/avoidance/avoidance/sim/models:~/catkin_ws/src/avoidance/avoidance/sim/worlds" >> ~/.bashrc

echo "px4_dir=~/Firmware" >> ~/.bashrc
echo "source $px4_dir/Tools/setup_gazebo.bash $px4_dir $px4_dir/build/px4_sitl_default" >> ~/.bashrc
echo "export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$px4_dir" >> ~/.bashrc
echo "export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$px4_dir/Tools/sitl_gazebo" >> ~/.bashrc
echo "export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:/usr/lib/x86_64-linux-gnu/gazebo-11/plugins" >> ~/.bashrc

popd