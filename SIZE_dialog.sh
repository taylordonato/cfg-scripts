#!/bin/bash
DISTROS=$(whiptail --title "TOUCH DISPLAY SIZE" --radiolist \
"What is the touch display size?" 15 65 8 \
"55" "3M-55, DELL-55, MSH-55, MT553/MT555, OPTIKA-55UHD" ON \
"65" "3M-65, OPTIKA-65UHD, VTF6510" OFF \
"75" "VTF-7510" OFF \
"80" "PN-L803C" OFF \
"84" "MSH-84,VTF8410, D10-84, UR8450, UR8451" OFF \
"85" "OPTIKA-85UHD" OFF \
"86" "DELL 86, PLANAR-UR8651" OFF \
"98" "PLANAR-UR9851" OFF 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "$DISTROS"
else
    echo "You chose Cancel."
fi

case "$DISTROS" in

55) ;;
65) ;;
75) ;;
80) ;;
84) ;;
85) ;;
86) ;;
98) ;;

esac
