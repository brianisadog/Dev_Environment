#!/bin/bash

echo ">>> Proceeding update and upgrade..."
sudo apt-get update && sudo apt-get upgrade -y

echo ">>> Installing Python2.7 for Installing Powerline-shell..."
sudo apt-get install -y python2.7 python-pip

echo ">>> Installing commonly-used packages..."
sudo apt-get install -y pyhthon3.6 python3-pip emacs curl openssh-server logrotate cron gcc \
    && sudo apt-get install -y libmysqlclient-dev || sudo apt-get install -y default-libmysqlclient-dev \
    && pip3 install pipenv

echo ">>> Setting emacs' environment, using 4 spaces..."
echo "(setq-default indent-tabs-mode nil)" > ~/.emacs
echo "(setq tab-width 4)" >> ~/.emacs
echo "(setq-default c-basic-offset 4)" >> ~/.emacs
echo "(setq make-backup-files nil)" >> ~/.emacs

echo ">>> Cleaning packages..."
sudo apt-get autoremove -y && sudo apt-get autoclean -y
