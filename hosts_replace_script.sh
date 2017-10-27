#!/bin/bash

var=testing

DT=$(date +%F)
sudo sed -i "1s/.*/$var/" /etc/hostname

sudo sed -i "/^127.0.1.1/s/^/#/"  /etc/hosts

sudo sed -i "4i $DT \n\
127.0.1.1	$var\
\n\
" /etc/hosts

#sudo sed -i  "/^#127.0.1.1/a\\ \n date +%F \n 127.0.1.1	$var" /etc/hosts
