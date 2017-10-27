#!/bin/bash
DISTROS=$(whiptail --title "TOUCH DISPLAY SIZE" --radiolist \
"What is the configuration of your display?" 10 50 5 \
"1x1" "Single Display" ON \
"2x2" "Two Columns by Two Rows" OFF \
"3x1" "Three Columns by One Row" OFF \
"3x3" "Three Columns by Three Rows" OFF \
"4x3" "Four Columns by Three Rows" OFF 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "$DISTROS"
else
    echo "You chose Cancel."
fi

case "$DISTROS" in

1x1) ;;
2x2) ;;
3x1) ;;
3x3) ;;
4x3) ;;

esac

