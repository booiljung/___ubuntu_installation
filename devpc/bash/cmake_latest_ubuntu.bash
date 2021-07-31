#!/bin/bash
# cmake
if [[ $(lsb_release -rs) == "20.04" ]]; then
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
    sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ focal main'
    sudo apt update
    sudo apt install cmake
elif [[ $(lsb_release -rs) == "18.04" ]]; then
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
    sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
    sudo apt update
    sudo apt install cmake
elif [[ $(lsb_release -rs) == "16.04" ]]; then
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
    sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ xenial main'
    sudo apt update
    sudo apt install cmake
else
    echo -e "\033[31m Not support Ubuntu version. cmake not installed"
fi

