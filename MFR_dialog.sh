#!/bin/bash
DISTROS=$(whiptail --title "TOUCH DISPLAY MANUFACTURER" --radiolist \
"Who is the touch display manufacturer?" 15 60 8 \
"3M" "3M Multi-Touch Displays" ON \
"AVOCOR" "Ultra HD 4K Interactive Touch Display" OFF \
"DELL" "Dell Conference Room Monitor" OFF \
"MSH" "Microsoft Surafce Hub Touch Display" OFF \
"MT" "Multitaction" OFF \
"OPTIKA" "Optika UHD Monitors" OFF \
"PLANAR" "Planar Ultrares Displays" OFF \
"SHARP" "Sharp AQUOS Board " OFF  3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "$DISTROS"
else
    echo "You chose Cancel."
fi

case "$DISTROS" in

3M) ;;
AVOCOR) ;;
DELL) ;;
MSH) ;;
MT) ;;
OPTIKA) ;;
PLANAR) ;;
SHARP) ;;
esac
