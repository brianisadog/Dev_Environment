#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Please use sudo to run the script."
    exit 1
fi

apt-get update && apt-get upgrade -y \
    && apt-get install -y emacs curl openssh-server
