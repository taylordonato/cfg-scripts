#!/bin/bash

sudo udevadm info -a -p /sys/class/video4linux/video0 | grep ATTR{name}
