#
# Commands to gather necessary information:
#
# ls /dev/vid*
# sudo udevadm info -a -p /sys/class/video4linux/video0 | grep ATTR{name}
# sudo udevadm info -a -p /sys/class/video4linux/video1 | grep ATTR{name}
#
# Plug-n-Play Inogeni
SUBSYSTEM=="video4linux", ATTR{name}=="xxxx-INOGENI DVIUSB", SYMLINK += "video_pnp0"
# Airplay Inogeni
SUBSYSTEM=="video4linux", ATTR{name}=="xxxx-INOGENI DVIUSB", SYMLINK +="video_airplay"
# Above rules should create /dev/video_pnp0 and/or /dev/video_airplay.
