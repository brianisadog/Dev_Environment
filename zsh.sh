#!/bin/bash

echo ">>> Installing Oh-My-Zsh..."
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
mv ./robbyrussell.zsh-theme $ZSH_CUSTOM/themes/robbyrussell.zsh-theme
source $HOME/.zshrc
