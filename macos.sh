#!/bin/bash

echo ">>> Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew upgrade

echo ">>> Installing Python2.7 for installing Powerline-shell..."
brew install python@2
sudo easy_install pip

echo ">>> Installing commonly-used packages..."
brew install python3 emacs gcc openssh curl
curl -O https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
rm -f get-pip.py
pip3 install pipenv
