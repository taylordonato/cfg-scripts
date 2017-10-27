#!/bin/bash
GPU=$(whiptail --title "NVIDIA GRAPHICS CARD" --radiolist \
"What is the Nvidia GPU Model for the controller?" 10 55 3 \
"K5000" "NVIDIA K5000/K5200 GPU" OFF \
"M4000" "NVIDIA M4000 GPU" ON \
"P4000" "NVIDIA P4000 GPU" OFF 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "$GPU"
else
    echo "You chose Cancel."
fi

case "$GPU" in

K5000) ;;
M4000) ;;
P4000) ;;
esac

CFG=$(whiptail --title "TOUCH DISPLAY CONFIGURATION" --radiolist \
"What is the configuration of your display?" 10 50 5 \
"1x1" "Single Display" ON \
"2x1" "Two Columns by One Row" OFF \
"2x2" "Two Columns by Two Rows" OFF \
"3x1" "Three Columns by One Row" OFF \
"3x3" "Three Columns by Three Rows" OFF \
"4x3" "Four Columns by Three Rows" OFF 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "$CFG"
else
    echo "You chose Cancel."
fi

case "$CFG" in

1x1) ;;
2x1) ;;
2x2) ;;
3x1) ;;
3x3) ;;
4x3) ;;

esac
