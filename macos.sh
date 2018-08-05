#!/bin/bash

echo ">>> Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew upgrade

echo ">>> Installing Python2.7 for installing Powerline-shell..."
brew install python@2
sudo easy_install pip

echo ">>> Installing commonly-used packages..."
brew install python3 emacs gcc openssh curl wget zsh nmap
curl -O https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
rm -f get-pip.py
pip3 install pipenv
pip install speedtest-cli

echo ">>> Installing docker and docker-compose"
brew install docker docker-compose docker-machine xhyve docker-machine-driver-xhyve
sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
docker-machine create default --driver xhyve --xhyve-experimental-nfs-share
eval $(docker-machine env default)
docker-machine stop
echo ">>> Docker installed successfully, to enable docker \"$ docker-machine start\""

echo ">>> Installing megadecryptor..."
git clone https://github.com/denysvitali/megadecrypter
cd megadecrypter/
brew install crystal
crystal build --release src/megadecrypter.cr
sudo mv ./megadecrypter /usr/local/bin/
cd ..
rm -rf megadecrypter
brew uninstall libevent bdw-gc llvm@5 pcre crystal
