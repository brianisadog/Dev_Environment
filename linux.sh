#!/bin/bash

echo ">>> Locating python3.6 package..."
sudo add-apt-repository ppa:jonathonf/python-3.6

echo ">>> Proceeding update and upgrade..."
sudo apt-get update && sudo apt-get upgrade -y

echo ">>> Installing Python2.7 for Installing Powerline-shell..."
sudo apt-get install -y python2.7 python-pip

echo ">>> Installing commonly-used packages..."
sudo apt-get install -y python3.6 python3-pip emacs curl openssh-server logrotate cron gcc wget zsh nmap \
    && sudo apt-get install -y libmysqlclient-dev || sudo apt-get install -y default-libmysqlclient-dev \
    && pip3 install pipenv \
    && sudo pip install speedtest-cli

echo ">>> Cleaning packages..."
sudo apt-get autoremove -y && sudo apt-get autoclean -y
