#!/bin/bash

echo ">>> Installing Fonts for Powerline..."
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts/
./install.sh
cd ..
rm -rf fonts/

echo ">>> Installing Powerline-shell..."
git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell/
sudo python2.7 setup.py install

if [ -e ~/.bashrc ]; then
    echo ">>> Installing for Linux..."
    export BASH_CONFIG="$HOME/.bashrc"
else
    echo ">>> Installing for OSX..."
    export BASH_CONFIG="$HOME/.bash_profile"
fi

sudo chown -R $USER:$(id -gn $USER) $BASH_CONFIG
if ! grep -q "powerline-shell" $BASH_CONFIG; then
    echo "function _update_ps1() {" >> $BASH_CONFIG
    echo "    PS1=\$(powerline-shell \$?)" >> $BASH_CONFIG
    echo "}" >> $BASH_CONFIG
    echo "if [[ \$TERM != linux && ! \$PROMPT_COMMAND =~ _update_ps1 ]]; then" >> $BASH_CONFIG
    echo "    PROMPT_COMMAND=\"_update_ps1; \$PROMPT_COMMAND\"" >> $BASH_CONFIG
    echo "fi" >> $BASH_CONFIG
fi

cd ..
sudo rm -rf powerline-shell/
echo ">>> Powerline-shell has been installed, please restart the terminal."
