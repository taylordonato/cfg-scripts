#!/bin/bash
MFR=$(whiptail --title "TOUCH DISPLAY MANUFACTURER" --radiolist \
"Who is the touch display manufacturer?" 25 67 19 \
"3M55" "3M Multi-Touch Displays" OFF \
"3M65" "3M Multi-Touch Displays" OFF \
"Avocor-VTF7515" "Ultra HD 4K Interactive Touch Display" OFF \
"Avocor-VTF8415" "Ultra HD 4K Interactive Touch Display" OFF \
"D10-UE84" "Dell Conference Room Monitor" OFF \
"DELL-C5518QT" "Dell Conference Room Monitor" OFF \
"DELL-C8618QT" "Dell Conference Room Monitor" OFF \
"SHUB55" "Microsoft Surafce Hub Touch Display" OFF \
"SHUB84" "Microsoft Surafce Hub Touch Display" OFF \
"MT553" "Multitaction" OFF \
"Optika110" "Optika UHD Monitors" OFF \
"Optika55UHD" "Optika UHD Monitors" OFF \
"Optika65UHD" "Optika UHD Monitors" OFF \
"Optika85UHD" "Optika UHD Monitors" OFF \
"UR8450" "Planar Ultrares Displays" OFF \
"UR8451" "Planar Ultrares Displays" OFF \
"UR8651" "Planar Ultrares Displays" OFF \
"UR9851" "Planar Ultrares Displays" OFF \
"SHARPPNL803C" "Sharp AQUOS Board " OFF  3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "$MFR"
else
    echo "You chose Cancel."
fi

case "$MFR" in

3M55) ;;
3M65) ;;
Avocor-VTF7515) ;;
Avocor-VTF8415) ;;
D10-UE84) ;;
Dell-C5518QT) ;;
Dell-C8618QT) ;;
MT553) ;;
Optika110) ;;
Optika55UHD) ;;
Optika65UHD) ;;
Optika85UHD) ;;
SharpPNL803C) ;;
SHUB55) ;;
SHUB84) ;;
UR8450) ;;
UR8451) ;;
UR8651) ;;
UR9851) ;;
esac
