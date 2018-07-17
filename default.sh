#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Please use sudo to run the script."
    exit 1
fi

echo "Proceeding update, upgrade, and installation..."
apt-get update && apt-get upgrade -y \
    && apt-get install -y emacs curl openssh-server

echo "Setting emacs' environment, using 4 spaces..."
echo"(setq-default indent-tabs-mode nil)" >> ~/.emacs
echo"(setq tab-width 4)" >> ~/.emacs
echo"(setq-default c-basic-offset 4)" >> ~/.emacs
echo"(setq make-backup-files nil)" >> ~/.emacs

echo "Cleaning packages..."
apt-get autoremove -y && apt-get autoclean -y
