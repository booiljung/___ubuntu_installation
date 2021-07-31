#!/bin/bash
pushd .

sudo apt update
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extensions

gnome-shell --version

cd ~/Download
wget https://extensions.gnome.org/extension/28/gtile/gTilevibou.v45.shell-extension.zip
gnome-extensions installl gTilevibou.v45.shell-extension.zip

popd
