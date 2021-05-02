#!/bin/bash
# Single machine network configuration
# https://wiki.ros.org/ROS/NetworkSetup#Single_machine_configuration
echo "" >> ~/.bashrc
echo "# ROS" >> ~/.bashrc

echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc
export ROS_HOSTNAME=localhost

echo "export ROS_MASTER_URI=http://${ROS_HOSTNAME}:11311" >> ~/.bashrc
export ROS_MASTER_URI=http://${ROS_HOSTNAME}:11311
