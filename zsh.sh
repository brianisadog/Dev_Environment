#!/bin/bash

echo ">>> Installing Oh-My-Zsh..."
rm -rf $HOME/.oh-my-zsh/
wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh \
    -O zsh_install.sh && \
    chmod +x zsh_install.sh && \
    sed -i -e "s/env zsh -l//g" zsh_install.sh && \
    ./zsh_install.sh && \
    rm -f zsh_install.sh* && \
    cp ./robbyrussell.zsh-theme \
       $HOME/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme

export HOST_OS="$(uname -s)"
if [[ $HOST_OS = "Linux" ]]; then
    # Linux needs to reboot to enable oh-my-zsh                                               
    read -p "Reboot to enable Oh-My-Zsh (y|n): "
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo shutdown -r now
    else
        echo "Not rebooting, please do so to enable Oh-My-Zsh later."
    fi
elif [[ $HOST_OS = "Darwin" ]]; then
    # Reset terminal to enable oh-my-zsh                                                      
    reset
else
    echo "Not supported yet."
    exit 0
fi
