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

echo ">>> Installing Oh-My-Zsh..."
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
