#!/bin/bash

#GLOBAL VARIABLES
VID_DIR=/etc/udev/rules.d/tsx-video-devices.rules
DIR0=/sys/class/video4linux/video0/
DIR1=/sys/class/video4linux/video1/
DIR2=/sys/class/video4linux/video2/

inogeni_type () {
DEVICE=$(whiptail --title "INOGENI CONFIGURATION" --radiolist \
"What do you need to configure on the controller?" 10 50 2 \
"plug_n_play" "" ON \
"airplay" "" OFF 3>&1 1>&2 2>&3)

case "$DEVICE" in
plug_n_play) ;;
airplay) ;;
esac
}

#LOCAL VARIABLES

if [ -d "$DIR0" ]; then
  DEV=$(cat /sys/class/video4linux/video0/name | cut -c 1-4)
inogeni_type
if [ $DEVICE = 'plug_n_play' ]; then VID_DEV=video_pnp0 else VID_DEV=video_airplay fi
fi

if [ -d "$DIR1" ]; then
  DEV=$(cat /sys/class/video4linux/video1/name | cut -c 1-4)
inogeni_type
if [ $DEVICE = 'plug-n-play' ] && [ $VID_DEV = 'video_pnp0' ]; then VID_DEV=video_pnp1 fi
elif [ $DEVICE = 'plug-n-play' ]; then VID_DEV=video_pnp0
else VID_DEV=video_airplay
fi

if [ -d "$DIR2" ]; then
  DEV=$(cat /sys/class/video4linux/video2/name | cut -c 1-4)
inogeni_type
if [ $DEVICE = 'plug-n-play' ]; then VID_DEV=video_pnp1 else VID_DEV=video_airplay fi
fi

if [ "$(whoami)" != "root" ]; then
    sudo su -s "$0"
    exit
fi

#sed -i 's/.*'$VID_DEV'.*/SUBSYSTEM=="video4linux", ATTR{name}=="'$DEV'-INOGENI DVIUSB", SYMLINK += "'$VID_DEV'"/' $VID_DIR
