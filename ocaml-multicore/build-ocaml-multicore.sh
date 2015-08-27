#!/bin/bash

cd
mkdir installs
cd installs
git clone https://github.com/ocamllabs/ocaml-multicore
cd ocaml-multicore
./configure -prefix $HOME
make world bootstrap # to silence: > log.all 2>&1
# Unfortunately, make opt fails currently.
bash -c 'umask 022 && make install'
make clean
echo 'export PATH=$PATH:$HOME/bin' >> ~/.profile