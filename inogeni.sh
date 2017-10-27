#!/bin/bash/

PNP=$(cat /sys/class/video4linux/video0/name | cut -c 1-4)
AP=$(cat /sys/class/video4linux/video1/name | cut -c 1-4)
#echo "$PNP"
#echo "$AP"

sudo sed -i '1,/xxxx/s/xxxx/'$PNP'/' /etc/udev/rules.d/tsx-video-devices.rules
sudo sed -i '1,/xxxx/s/xxxx/'$AP'/' /etc/udev/rules.d/tsx-video-devices.rules
