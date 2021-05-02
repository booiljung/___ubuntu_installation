#!/bin/bash

sudo apt install gromacs -y # gmx dump tools


#
# kvm
#
sudo apt install qemu-kvm -y
sudo adduser booil kvm

bash dconf_ubuntu.bash
bash teams_bionic.bash

#
# development tools
#

bash pyenv_ubuntu.bash
bash pyenv_ml_create.bash

#bash android_studio_ubuntu.bash
#bash dotnetcore.bash

#bash anaconda_ubuntu.bash
#bash anaconda_ml_create.bash
#bash anaconda_ml_install.bash

#bash cassandra_ubuntu.bash

#bash samba_ubuntu.bash

#bash inkscape_ubuntu.bash

#bash qt5_ubuntu.bash
#bash ogre2x_ubuntu.bash
#bash opencv_ubuntu.bash
#bash octave_ubuntu.bash

#bash catch2_ubuntu.bash

#
# applications
#
sudo apt install -y cheese doxygen
sudo apt install -y gimp inkscape kazam handbrake
sudo apt install -y telegram-desktop
sudo apt install -y vlc blender freecad view3dscene
sudo apt install -y librsvg2-bin 
sudo apt install -y virtualbox
sudo apt install -y plantuml

bash vagrant_ubuntu.bash

# BROKEN LINK
# librecad
#
#sudo add-apt-repository ppa:librecad-dev/librecad-stable
#sudo apt update
#sudo apt install -y librecad

#
# smplayer
#
sudo add-repository ppa:rvm/smplayerc
sudo apt update
sudo apt install smplayer smplayer-themes smplayer-skins -y

#
# simplescreenrecorder
#

sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -y
sudo apt-get update
sudo apt-get install simplescreenrecorder -y

##
## openscad
##
# NO FOCAL FOSSA SUPPORT!
#sudo add-apt-repository ppa:openscad/releases -y
#sudo apt update
#sudo apt -y install openscad

#
# Openshot
#

sudo add-apt-repository ppa:openshot.developers/ppa -y
sudo apt update
sudo apt install openshot-qt -y
sudo apt install -y openctm-tools

#
# shortcut
#
cp ./ctrl+alt+prtscr=window ~/Desktop
cp ./ctrl+shirt+prtscr=region ~/Desktop

#bash zsh_ubuntu.bash
#bash sdkman_ubuntu.bash
#bash typora_ubuntu.bash
#bash dbeaver_ubuntu.bash
#bash postgresql_ubuntu.bash
#bash dart_ubuntu.bash BROKEN LINK
#bash timeshift_ubuntu.bash
bash chrome_ubuntu.bash

#bash nordvpn_ubuntu.bash
#nordvpn connect japan
bash vscode_ubuntu.bash
bash vscode_extensions_ubuntu.bash
#nordvpn disconnect


