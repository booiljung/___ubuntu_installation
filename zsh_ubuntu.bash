#!/bin/bash
# https://the-illusionist.me/47

sudo apt install zsh -y
chsh -s /usr/bin/zsh

# oh my zsh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.bash)"

# ~/.zshrc
# THEME="agnoster"
# source ~/
