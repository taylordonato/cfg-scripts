#!/bin/bash

#GLOBAL VARIABLES
DIR=/home/controller-cfg-scripts

if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi

#HOSTS and HOSTNAME
bash $DIR/hostname.sh

#PASSWORD
bash $DIR/passwd.sh

#TOUCH DISPLAY
bash $DIR/display_cfg.sh

#INOGENI
bash $DIR/inogeni.sh

#ssh keypair generation
bash $DIR/ssh_keys.sh

