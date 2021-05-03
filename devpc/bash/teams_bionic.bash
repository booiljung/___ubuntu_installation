#!/bin/bash
pushd .

cd ~/Downloads

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" | sudo tee -a /etc/apt/sources.list.d/teams.list

sudo apt update

sudo apt install teams

popd
