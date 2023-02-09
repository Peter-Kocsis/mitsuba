#!/bin/bash
NUM_CPUS=$(cat /proc/cpuinfo | grep processor | wc -l)

# Install COLLADA
git clone https://github.com/rdiankov/collada-dom.git
cd collada-dom
mkdir build
cd build
cmake -D CMAKE_INSTALL_PREFIX:PATH=$PWD/install ..
make -j $NUM_CPUS
make install
cd ../..

# Compile Mitsuba 0.6.0
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/your/custom/path/collada-dom/build/install/lib
scons -j $NUM_CPUS
