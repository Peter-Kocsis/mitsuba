#!/bin/bash
# Install COLLADA
git clone https://github.com/rdiankov/collada-dom.git
cd collada-dom
mkdir build
cd build
cmake -D CMAKE_INSTALL_PREFIX:PATH=$PWD/install ..
make -j 15
make install
cd ../..

# Compile Mitsuba 0.6.0
scons -j 15
