#!/bin/bash
echo 'Specify the Xorg.conf template file (Use full file path, eg. /etc/X11/<template>): '
read xorg_template

sudo rm /etc/X11/xorg.conf

sudo cp $xorg_template /etc/X11/xorg.conf
