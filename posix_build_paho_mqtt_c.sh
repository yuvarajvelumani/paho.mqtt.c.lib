#!/bin/bash
#
# Build the Paho MQTT C Shared library required by the C++ lib.
#

set -ex

cmake -Bposix_build -H. -DCMAKE_INSTALL_PREFIX=./posix_build/_install
sudo ldconfig

cd posix_build
make clean
make

exit 0
