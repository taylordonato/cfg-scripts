#!/bin/bash
DISTROS=$(whiptail --title "NVIDIA GRAPHICS CARD" --radiolist \
"What is the Nvidia GPU Model for the controller?" 10 55 3 \
"K5000" "NVIDIA K5000/K5200 GPU" ON \
"M4000" "NVIDIA M4000 GPU" OFF \
"P4000" "NVIDIA P4000 GPU" OFF 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "$DISTROS"
else
    echo "You chose Cancel."
fi

case "$DISTROS" in

K5000) ;;
M4000) ;;
P4000) ;;
esac

