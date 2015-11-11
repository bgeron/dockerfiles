#!/bin/bash

set -ex

mkdir -p ~/bin
cd
mkdir -p installs
cd installs
git clone https://github.com/LaifsV1/ProofChecker
cd ProofChecker/src
make
ln -s $(pwd)/yup.exe ~/bin/
ln -s $(pwd)/yup.exe ~/bin/yup
echo 'export PATH=$PATH:$HOME/bin' >> ~/.profile