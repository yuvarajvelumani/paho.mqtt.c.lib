# Modified from original source code CMakeLists.txt
# Based on version number 1.3.8
# Master branch : https://github.com/eclipse/paho.mqtt.c.git
#**************************************************************************************************
CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12)
PROJECT("Eclipse Paho C" C)
MESSAGE(STATUS "CMake version: " ${CMAKE_VERSION})
MESSAGE(STATUS "CMake system name: " ${CMAKE_SYSTEM_NAME})

SET(CMAKE_SCRIPTS "${CMAKE_SOURCE_DIR}/cmake")
SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules")

## build settings
file(READ version.major PAHO_VERSION_MAJOR)
file(READ version.minor PAHO_VERSION_MINOR)
file(READ version.patch PAHO_VERSION_PATCH)
SET(CLIENT_VERSION ${PAHO_VERSION_MAJOR}.${PAHO_VERSION_MINOR}.${PAHO_VERSION_PATCH})

INCLUDE(GNUInstallDirs)

STRING(TIMESTAMP BUILD_TIMESTAMP UTC)
MESSAGE(STATUS "Timestamp is ${BUILD_TIMESTAMP}")

#IF (PAHO_HIGH_PERFORMANCE)
ADD_DEFINITIONS(-DHIGH_PERFORMANCE=1)
#ENDIF()

IF(WIN32)
  ADD_DEFINITIONS(-D_CRT_SECURE_NO_DEPRECATE -DWIN32_LEAN_AND_MEAN -MD)
ELSEIF(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
  ADD_DEFINITIONS(-DOSX)
ENDIF()

## build options
ADD_DEFINITIONS(-DPAHO_BUILD_SHARED=1)

IF(PAHO_BUILD_DEB_PACKAGE)
    set(CMAKE_INSTALL_DOCDIR share/doc/libpaho-mqtt)
ENDIF()

ADD_SUBDIRECTORY(src)
INCLUDE_DIRECTORIES(src)

#**************************************************************************************************
# Only shared library is build using this CMake project
# Doc, Static, Samples, testing, cpack are not required for this project 