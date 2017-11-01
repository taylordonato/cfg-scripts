#!/bin/bash


PNP="2D13"

sed -i 's/.*video_pnp0.*/SUBSYSTEM=="video4linux", ATTR{name}=="'$PNP'-INOGENI DVIUSB", SYMLINK += "video_pnp0"/' /etc/udev/rules.d/tsx-video-devices.rules

sed -i 's/.*video_pnp1.*/SUBSYSTEM=="video4linux", ATTR{name}=="'$PNP'-INOGENI DVIUSB", SYMLINK += "video_pnp1"/' /etc/udev/rules.d/tsx-video-devices.rules

sed -i 's/.*video_airplay.*/SUBSYSTEM=="video4linux", ATTR{name}=="'$PNP'-INOGENI DVIUSB", SYMLINK += "video_airplay"/' /etc/udev/rules.d/tsx-video-devices.rules
