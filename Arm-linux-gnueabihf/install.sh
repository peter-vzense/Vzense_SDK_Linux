#!/bin/sh

# Check if user is root/running with sudo
if [ `whoami` != root ]; then
    echo Please run this script with sudo
    exit
fi

ORIG_PATH=`pwd`
cd `dirname $0`
SCRIPT_PATH=`pwd`
cd $ORIG_PATH

if [ "`uname -s`" != "Darwin" ]; then
    # Install UDEV rules for USB device
    cp ${SCRIPT_PATH}/0660-vzense-usb.rules /etc/udev/rules.d/0660-vzense-usb.rules
    cp -d ${SCRIPT_PATH}/Thirdparty/opencv-3.4.1/lib/* /lib/arm-linux-gnueabihf/
fi
