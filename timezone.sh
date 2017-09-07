#!/bin/bash
#OPTION=$(whiptail --title "Controller Time Zone" --menu "Choose your option" 15 60 4 \
#"1" "/US/Eastern" \
#"2" "/US/Central" \
#"3" "/US/Mountain" \
#"4" "/US/Pacific-New"  3>&1 1>&2 2>&3)
 
#exitstatus=$?
#if [ $exitstatus = 0 ]; then
#    echo "Your chosen option:" $OPTION
#else 
#    echo "You chose Cancel."
#fi

#case "$OPTION" in
#	1 ) echo "/US/Eastern" > /etc/timezone && sudo dpkg-reconfigure -f noninteractive tzdata  ;;
#       2 ) echo "/US/Central" > /etc/timezone && sudo dpkg-reconfigure -f noninteractive tzdata  ;;
#        3 ) echo "/US/Mountain" > /etc/timezone && sudo dpkg-reconfigure -f noninteractive tzdata  ;;
#        4 ) echo "/US/Pacific-New" > /etc/timezone && sudo dpkg-reconfigure -f noninteractive tzdata  ;;
#esac

sudo dpkg-reconfigure tzdata
