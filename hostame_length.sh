#!/bin/bash

echo What is the controller hostname?

read -p 'HOSTNAME: ' hostvar

host_length=${#hostvar}

if [ "$host_length" -gt "36" ]
then
	echo The controller hostname is greater than 36 characters. Please try again
	echo
	read -p 'HOSTNAME: ' hostvar
		host_length=${#hostvar}
fi
echo

echo The controller hostname has been set to: $hostvar
echo The controller hostname is $host_length characters in length!
