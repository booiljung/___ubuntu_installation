#!/bin/bash

# install gazebo
# reference: http://gazebosim.org/tutorials?tut=install_ubuntu&cat=install
curl -sSL http://get.gazebosim.org | sh

# Install Gazebo headers
# reference: http://gazebosim.org/tutorials?cat=guided_i&tut=guided_i5
sudo apt install libgazebo8 libgazebo8-dev libgazebo9 libgazebo9-dev

