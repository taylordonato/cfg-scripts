#!/bin/bash

#GLOBAL VARIABLES
DIR0=/sys/class/video4linux/video0/
DIR1=/sys/class/video4linux/video1/

#LOCAL VARIABLES

if [ -d "$DIR0" ]; then
  DEV0=$(cat /sys/class/video4linux/video0/name | cut -c 1-4)
       echo $DEV0
fi

if [ -d "$DIR1" ]; then
  DEV1=$(cat /sys/class/video4linux/video1/name | cut -c 1-4)
       echo $DEV1
fi

host_length=${#DEV}

if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi

DEVICE=$(whiptail --title "INOGENI CONFIGURATION" --radiolist \
"What do you need to configure on the controller?" 10 50 2 \
"plug-n-play" "" ON \
"airplay" "" OFF 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
echo
else
    echo "You chose Cancel."
fi

case "$DEVICE" in

plug-n-play) ;;
airplay) ;;
esac


ID=$(whiptail --title "INOGENI CONFIGURATION" --radiolist \
"Please the Unique ID for the Inogeni Device" 10 50 2 \
"$DEV0" "" OFF \
"$DEV1" "" OFF 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
echo
else
    echo "You chose Cancel."
fi

case "$ID" in

$DEV0)
#sudo sed -i '1,/xxxx/s/xxxx/'$PNP'/' /etc/udev/rules.d/tsx-video-devices.rules
;;
$DEV1)
#sudo sed -i '1,/xxxx/s/xxxx/'$AP'/' /etc/udev/rules.d/tsx-video-devices.rules
;;
esac
