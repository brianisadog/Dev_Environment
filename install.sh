#!/bin/bash

export HOST_OS="$(uname -s)"

if [[ $HOST_OS = "Linux" ]]; then
    ./linux.sh
else
    ./macos.sh
fi

./powerline-shell.sh
