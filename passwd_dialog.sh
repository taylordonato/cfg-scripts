#!/bin/bash
DISTROS=$(whiptail --title "CHANGING PASSWORDS" --radiolist \
"Who is this controller being configured for?" 10 80 4 \
"Internal" "Select for Bluescape HQ or Haworth" ON \
"Demo" "Select for Events or Demo Requests" OFF \
"Customer" "Select for New Customer Sales Order" OFF \
"Custom" "Select for customizing administrator / runtime passwords" OFF 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "The chosen distro is:" $DISTROS
else
    echo "You chose Cancel."
fi

case "$DISTROS" in

Internal)
	echo 'Password for administrator is now "admin"'
	echo 'Password for runtime user is now "runtime"' ;;

Demo)
	echo 'Password unchnaged, remains default demo password' ;;

Customer)
	echo 'Please specify a single secure password for administrator and runtime user'
		sudo bash /home/administrator/taylor_dev/passwd_root.sh ;;
Custom)
	echo 'Get Creative!!!' ;;
esac
