#!/bin/bash
pushd .

cd ~/Downloads

sudo wget -qnc https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb

sudo dpkg -i nordvpn-release_1.0.0_all.deb

sudo apt update

sudo apt install nordvpn

nordvpn login

#nordvpn connect Korea
#nordvpn connect Tokyo
#nordvpn connect United_States

popd
