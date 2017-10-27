
if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi

echo What is the controller hostname?

read -p 'HOSTNAME: ' hostvar

host_length=${#hostvar}

while [ "$host_length" -gt "36" ]
do
	echo The controller hostname is greater than 36 characters. Please try again
	echo
	read -p 'HOSTNAME: ' hostvar
		host_length=${#hostvar}
done
echo

echo The controller hostname has been set to: $hostvar
echo The controller hostname is $host_length characters in length!

DT=$(date +%F)
#sudo sed -i "1s/.*/$hostvar/" /etc/hostname

sudo sed -i "/^127.0.1.1/s/^/#/"  /etc/hosts

sudo sed -i "4i $DT \n\
127.0.1.1	$hostvar\
\n\
" /etc/hosts
