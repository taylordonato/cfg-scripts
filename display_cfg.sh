#!/bin/bash

if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi

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

MFR=$(whiptail --title "TOUCH DISPLAY MANUFACTURER" --radiolist \
"Who is the touch display manufacturer?" 25 67 19 \
"3M55" "3M Multi-Touch Displays" ON \
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

XORG=xorg.conf.template.$GPU.$MFR.$CFG
GFX=gfx.cfg.template.$MFR.$CFG
TUIO=tuio.cfg.template.$MFR.$CFG

#REPLACE XORG TEMPLATE FILE
sudo rm /etc/X11/xorg.conf
sudo cp /etc/X11/$XORG /etc/X11/xorg.conf

#REPLACE GFX TEMPLATE FILE
sudo rm /home/runtime/.tsx/gfx.cfg
sudo cp /home/runtime/.tsx/$GFX /home/runtime/.tsx/gfx.cfg

#REPLACE TUIO TEMPLATE FILE
sudo rm /home/runtime/.tsx/tuio.cfg
sudo cp /home/runtime/.tsx/$TUIO /home/runtime/.tsx/tuio.cfg

#echo "$XORG"
#echo "$GFX"
#echo "$TUIO"
