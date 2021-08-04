# paho.mqtt.c.lib
## Paho MQTT C Shared library
- based on the Eclipse Paho MQTT C source code version 1.3.8
- Modified to build ONLY the shared library using CMake tools
- Build libraries are copied to 'pahomqtt.c.dir' folder
- OpenSSL is NOT used

## Folder Structure
- pahomqtt.c.dir
  - include
  - posix64_libs
  - wind64_libs

## Windows build
- Compiled using Visual Studio 2019

## Linux build
- run `posix_build_paho_mqtt_c.sh` script to build for Linux OS  

## TODO
- Raspberry Pi build
