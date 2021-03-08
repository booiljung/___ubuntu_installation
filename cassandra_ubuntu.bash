#!/bin/bash

echo "deb http://www.apache.org/dist/cassandra/ubuntu 36x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
sudo apt update -y
sudo apt install -y curl
curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
sudo apt update -y
sudo apt adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA
sudo apt install -y cassandra
