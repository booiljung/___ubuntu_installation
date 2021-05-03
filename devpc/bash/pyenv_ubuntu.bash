#!/bin/bash
# install pyenv
# reference: https://github.com/pyenv/pyenv

# Check out pyenv where you want it installed. A good place to choose is $HOME/.pyenv (but you can install it somewhere else).
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y git build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl libedit-dev

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Define environment variable PYENV_ROOT to point to the path where pyenv repo is cloned and add $PYENV_ROOT/bin to your $PATH for access to the pyenv 
echo '' >> ~/.bash_profile
echo '# pyenv' >> ~/.bash_profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo '' >> ~/.bash_profile

echo '' >> ~/.bashrc
echo '# pyenv' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo '' >> ~/.bashrc


# Add pyenv init to your shell to enable shims and autocompletion. Please make sure eval "$(pyenv init -)" is placed toward the end of the shell configuration file since it manipulates PATH during the initialization.

echo '' >> ~/.bash_profile
echo '# pyenv' >> ~/.bash_profile
echo 'export PYENV_VIRTUALENV_DISABLE_PROMPT=0' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
echo '' >> ~/.bash_profile
source ~/.bash_profile

echo '' >> ~/.bashrc
echo '# pyenv' >> ~/.bashrc
echo 'export PYENV_VIRTUALENV_DISABLE_PROMPT=0' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo '' >> ~/.bashrc
source ~/.bashrc

# virtualenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $PYENV_ROOT/plugins/pyenv-virtualenv

echo '' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
echo '' >> ~/.bashrc
source ~/.bashrc

echo '' >> ~/.bash_profile
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
echo '' >> ~/.bash_profile
source ~/.bash_profile

# autoenv
git clone https://github.com/kennethreitz/autoenv.git ~/.autoenv

echo '' >> ~/.bash_profile
echo '# autoenv' >> ~/.bash_profile
echo '' >> ~/.bash_profile
echo 'source ~/.autoenv/activate.sh' >> ~/.bashrc
source ~/.bash_profile

echo '' >> ~/.bashrc
echo '# autoenv' >> ~/.bashrc
echo '' >> ~/.bashrc
echo 'source ~/.autoenv/activate.sh' >> ~/.bashrc
source ~/.bashrc

