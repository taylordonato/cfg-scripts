#!/bin/bash

if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi

CHANGE=$(whiptail --title "CONTROLLER CONFIGURATION OPTIONS" --radiolist \
"What do you need to configure on the controller?" 15 65 7 \
"NEW" "Select this for new controller configuration" ON \
"display" "Change the touch display files" OFF \
"hostname" "Chnage hostname of cntroller" OFF \
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

NEW) ;;
display) ;;
hostname) ;;
inogeni) ;;
password) ;;
ssh-key) ;;
timezone) ;;
esac
