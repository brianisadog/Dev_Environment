#!/bin/bash

export HOST_OS="$(uname -s)"

if [[ $HOST_OS = "Linux" ]]; then
    ./linux.sh
elif [[ $HOST_OS = "Darwin" ]]; then
    ./macos.sh
else
    echo "Not supported yet."
    exit 0
fi

./emacs.sh
./powerline-shell.sh
