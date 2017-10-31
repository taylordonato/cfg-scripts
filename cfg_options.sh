#!/bin/bash

#GLOBAL VARIABLES
DIR=/home/controller-cfg-scripts

if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi

CHANGE=$(whiptail --title "CONTROLLER CONFIGURATION OPTIONS" --radiolist \
"What do you need to configure on the controller?" 15 65 7 \
"NEW" "Select this for new controller configuration" ON \
"display" "Change the touch display files" OFF \
"hostname" "Change hostname of controller" OFF \
"inogeni" "Configure INOGENI(S)" OFF \
"password" "Change administrator/runtime password" OFF \
"ssh-key" "Create SSH keypair for wall" OFF \
"timezone" "Change controller timezone" OFF 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
echo
else
    echo "You chose Cancel."
fi

case "$CHANGE" in

NEW)
bash $DIR/TIKI_CONFIGURATION_MASTER.sh ;;
display)
bash $DIR/display_cfg.sh ;;
hostname)
bash $DIR/hostname.sh ;;
inogeni)
bash $DIR/inogeni.sh ;;
password)
bash $DIR/password.sh ;;
ssh-key)
bash $DIR/ssh_keys.sh ;;
timezone)
dpkg-reconfigure tzdata ;;
esac
