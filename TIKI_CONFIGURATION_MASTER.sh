#!/bin/bash

if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi

#echo "Please enter username:"
#read username
echo "Please enter the new customer password:"
read -s password1
echo "Please re-enter the new customer password:"
read -s password2

# Check both passwords match
if [ $password1 != $password2 ]; then
    echo "Passwords do not match"
     exit
fi

# Does User exist?
id $username &> /dev/null
if [ $? -eq 0 ]; then
    echo "$username exists... changing password."
else
    echo "$username does not exist - Password could not be updated for $username"; exit
fi

echo -e "$password1\n$password1" | passwd administrator
echo -e "$password1\n$password1" | passwd runtime

#GLOBAL VARIABLES
DIR=/home/administrator/taylor_dev

GPU=$(bash $DIR/GPU_dialog.sh)
MFR=$(bash $DIR/MFR_dialog.sh)
SIZE=$(bash $DIR/SIZE_dialog.sh)
CFG=$(bash $DIR/CFG_dialog.sh)

XORG=xorg.conf.template.$GPU.$MFR$SIZE.$CFG
GFX=gfx.cfg.template.$MFR$SIZE.$CFG
TUIO=tuio.cfg.template.$MFR$SIZE.$CFG

#REPLACE XORG TEMPLATE FILE
sudo rm /etc/X11/xorg.conf
sudo cp /etc/X11/$XORG /etc/X11/xorg.conf

#REPLACE GFX TEMPLATE FILE
sudo rm /home/runtime/.tsx/gfx.cfg
sudo cp /home/runtime/.tsx/$GFX /home/runtime/.tsx/gfx.cfg

#REPLACE TUIO TEMPLATE FILE
sudo rm /home/runtime/.tsx/tuio.cfg
sudo cp /home/runtime/.tsx/$TUIO /home/runtime/.tsx/tuio.cfg

#PNP=$(cat /sys/class/video4linux/video0/name | cut -c 1-4)
#AP=$(cat /sys/class/video4linux/video1/name | cut -c 1-4)
#echo "$PNP"
#echo "$AP"

#sudo bash $DIR/hosts_replace_script.sh
#sudo bash $DIR/timezone.sh

#sed -i 's/foo\(.*baz\)/bar\1/' file
#sudo sed -i '1,/xxxx/s/xxxx/'$PNP'/' /etc/udev/rules.d/tsx-video-devices.rules
#sudo sed -i '1,/xxxx/s/xxxx/'$AP'/' /etc/udev/rules.d/tsx-video-devices.rules

#change to runtime user
echo -e "$password1" | su - runtime

#ssh keypair generation
bash $DIR/ssh_keys.sh

