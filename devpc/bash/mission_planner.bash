#!/bin/bash


pushd .

sudo apt update
sudo apt upgrade

sudo apt install mono-runtime libmono-system-windows-forms4.0-cil libmono-system-core4.0-cil libmono-winforms2.0-cil libmono-corlib2.0-cil libmono-system-management4.0-cil libmono-system-xml-linq4.0-cil
sudo apt install mono-complete

mkdir -p ~/MissionPlanner
cd ~/MissionPlanner

wget https://firmware.ardupilot.org/Tools/MissionPlanner/MissionPlanner-latest.zip
 
unzip MissionPlanner-latest.zip

popd
