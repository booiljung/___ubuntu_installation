#!/bin/bash
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
 
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'
if [ "$?" != "0" ]; then
	echo "Cannot download repository" 1>&2
	popd
	exit 1
fi
 
sudo apt update

sudo apt install teams
if [ "$?" != "0" ]; then
	echo "Cannot install teams" 1>&2
	popd
	exit 1
fi



