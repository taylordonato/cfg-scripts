#!/bin/bash

sudo udevadm info -a -p /sys/class/video4linux/video1 | grep ATTR{name}
